from flask import Flask, request, jsonify
from flask_cors import CORS
import speech_recognition as sr
import re
import nltk
from nltk.corpus import cmudict
from collections import Counter
import pymysql
import requests
import logging
from functools import lru_cache

nltk.download('cmudict')
nltk.download('punkt')

# Configure logging
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "http://localhost:3000"}})

# MySQL Configuration
try:
    db = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        database='confidence_speaker',
        cursorclass=pymysql.cursors.DictCursor
    )
    logger.info("MySQL connection established")
except Exception as e:
    logger.error(f"Failed to connect to MySQL: {e}")
    raise

# Load CMU Pronouncing Dictionary
cmu_dict = cmudict.dict()

# Global flag for stopping recognition
stop_recognition = False

# Common filler words (only single words for better matching)
FILLER_WORDS = {
    'um', 'uh', 'like', 'you know', 'so', 'basically', 'actually', 'well',
    'er', 'ahm', 'i mean', 'sort of', 'kind of', 'yep', 'right', 'just',
    'okay', 'yeah', 'literally', 'honestly', 'to be honest', 'at the end of the day',
    'in a way', 'i guess', 'in fact', 'you see', 'as i said', 'i suppose',
    'if you will', 'like i said', 'essentially', 'that is to say', 'sorta',
    'well, anyway', 'right then', 'you know what i mean', 'at least',
    'i mean to say', 'what i’m trying to say is', 'if that makes sense',
    'to some extent', 'more or less', 'by the way', 'come to think of it',
    'for what it’s worth', 'if anything', 'as it were', 'in other words',
    'like i said before', 'you get the idea'
}

# Cache CMUdict lookups
@lru_cache(maxsize=10000)
def get_phonemes(word):
    return cmu_dict.get(word.lower(), [[]])[0]

# Function to validate token
def validate_token(token):
    try:
        response = requests.post(
            "http://localhost:3003/api/auth/validate-token",
            json={"token": token},
            timeout=5
        )
        return response.json()
    except requests.RequestException as e:
        logger.error(f"Token validation failed: {e}")
        return {"success": False, "message": f"Failed to validate token: {str(e)}"}

# Speech recognition setup
def transcribe_audio():
    global stop_recognition
    recognizer = sr.Recognizer()
    with sr.Microphone() as source:
        logger.info("Listening for audio...")
        try:
            audio_data = recognizer.listen(source, timeout=5, phrase_time_limit=10)
        except sr.WaitTimeoutError:
            logger.error("No audio detected within timeout")
            return "No audio detected", 408
        except Exception as e:
            if stop_recognition:
                logger.info("Recording stopped by user")
                return "Recording stopped", 200
            logger.error(f"Audio capture failed: {e}")
            return "Audio capture failed", 500
    try:
        text = recognizer.recognize_google(audio_data)
        logger.info(f"Transcription successful: {text}")
        return text, 200
    except sr.UnknownValueError:
        logger.error("Google Speech Recognition could not understand audio")
        return "Could not understand audio", 400
    except sr.RequestError as e:
        logger.error(f"Google Speech Recognition request failed: {e}")
        return f"Could not request results: {str(e)}", 503

# NLP processing
def process_text(text):
    if not isinstance(text, str):
        logger.error("Invalid text input for processing")
        return []
    from nltk.tokenize import word_tokenize
    text = re.sub(r'[^\w\s]', '', text).lower()
    words = word_tokenize(text)
    logger.debug(f"Tokenized words: {words}")
    return words

# Function to assess pronunciation
def assess_pronunciation(text):
    try:
        if not isinstance(text, str):
            logger.error("Invalid text for pronunciation assessment")
            return "Unknown vocabulary", [], "None", "None"

        words = process_text(text)
        if not words:
            return "No words found", [], "None", "None"

        if not isinstance(words, list):
            logger.error(f"Words is not a list: {words}")
            words = []

        # Most repeated words (top 3)
        word_counts = Counter(words)
        # Filter only words with count > 1, then get top 3
        repeated_words = [(word, count) for word, count in word_counts.items() if count > 1]
        repeated_words.sort(key=lambda x: x[1], reverse=True)
        top_repeated = repeated_words[:3]

        most_repeated_words = ", ".join(word for word, _ in top_repeated) if top_repeated else "None"

        logger.debug(f"Most repeated words list: {top_repeated}")
        logger.debug(f"Most repeated words string: {most_repeated_words}")

        # Filler words with counts
        filler_words = Counter(word for word in words if word in FILLER_WORDS)
        filler_words_str = ", ".join(f"{word}: {count}" for word, count in filler_words.items()) if filler_words else "None"
        logger.debug(f"Filler words: {filler_words_str}")

        # Pronunciation assessment based on phoneme count of first recognized word
        assessment = "Good vocabulary"  # default fallback
        for word in words:
            phonemes = get_phonemes(word)
            if phonemes:
                if len(phonemes) <= 1:
                    assessment = "Excellent vocabulary"
                elif len(phonemes) <= 2:
                    assessment = "Good vocabulary"
                elif len(phonemes) <= 3:
                    assessment = "Okay vocabulary"
                elif len(phonemes) <= 4:
                    assessment = "Bad vocabulary"
                else:
                    assessment = "Poor vocabulary"
                break

        suggestions = {
            "Excellent vocabulary": (
                "Well done! Keep practicing how you stress words and change your tone to sound natural. "
                "Try reading out loud with different feelings to improve."
            ),
            "Good vocabulary": (
                "Good job! Focus on vowel sounds and listen carefully to how native speakers say words. "
                "Try to copy their pronunciation."
            ),
            "Okay vocabulary": (
                "You’re doing okay! Work on hard consonant sounds like 'th', 'v', and 'r'. "
                "Try recording your voice and listen to it."
            ),
            "Bad vocabulary": (
                "Keep trying! Break long words into small parts and say them slowly. "
                "Practice hard words many times."
            ),
            "Poor vocabulary": (
                "Don’t worry! Learn the basic sounds and how to make them with your mouth. "
                "Ask a teacher or use a pronunciation guide to help."
            )
        }
        suggestion = suggestions.get(assessment, "No specific suggestions")

        return assessment, [suggestion], most_repeated_words, filler_words_str
    except Exception as e:
        logger.error(f"Pronunciation assessment failed: {e}")
        return "Unknown vocabulary", [], "None", "None"

# Store analysis results
def store_analysis_results(user_id, pronunciation, suggestion, most_repeated_words, filler_words):
    try:
        cursor = db.cursor()
        cursor.execute(
            'INSERT INTO audio_results (user_id, pronunciation, suggestion, most_repeated_words, filler_words, created_at) '
            'VALUES (%s, %s, %s, %s, %s, NOW())',
            (user_id, pronunciation, suggestion, most_repeated_words, filler_words)
        )
        db.commit()
        logger.info("Analysis results stored in database")
    except Exception as e:
        logger.error(f"Failed to store analysis results: {e}")
        db.rollback()

@app.route('/analyze', methods=['POST'])
def analyze():
    global stop_recognition
    stop_recognition = False
    auth_header = request.headers.get('Authorization')
    if not auth_header or not auth_header.startswith('Bearer '):
        return jsonify({"success": False, "message": "Unauthorized"}), 401

    token = auth_header.split(" ")[1]
    token_response = validate_token(token)
    if not token_response.get("success"):
        return jsonify({"success": False, "message": token_response.get("message", "Invalid token")}), 401

    user_id = token_response.get("user").get("id")

    data = request.get_json() or {}
    text = data.get("text")

    if text:
        logger.info(f"Received client-side transcript: {text}")
    else:
        text, status = transcribe_audio()
        if status != 200:
            return jsonify({"success": False, "message": text}), status

    pronunciation, suggestions, most_repeated_words, filler_words = assess_pronunciation(text)
    store_analysis_results(
        user_id,
        pronunciation,
        suggestions[0] if suggestions else "No suggestions",
        most_repeated_words,
        filler_words
    )

    return jsonify({
        "success": True,
        "result": {
            "transcribed_text": text,
            "pronunciation": pronunciation,
            "suggestions": suggestions,
            "most_repeated_words": most_repeated_words,
            "filler_words": filler_words
        }
    })

@app.route('/stop', methods=['POST'])
def stop_recording():
    global stop_recognition
    stop_recognition = True
    return jsonify({"success": True, "message": "Recording stopped"})

@app.route('/reports', methods=['GET'])
def reports():
    auth_header = request.headers.get('Authorization')
    if not auth_header or not auth_header.startswith('Bearer '):
        return jsonify({"success": False, "message": "Unauthorized"}), 401

    token = auth_header.split(" ")[1]
    token_response = validate_token(token)
    if not token_response.get("success"):
        return jsonify({"success": False, "message": token_response.get("message", "Invalid token")}), 401

    user_id = token_response.get("user").get("id")

    try:
        cursor = db.cursor()
        cursor.execute(
            'SELECT id, user_id, pronunciation, suggestion, most_repeated_words, filler_words, created_at '
            'FROM audio_results WHERE user_id = %s ORDER BY created_at DESC',
            (user_id,)
        )
        results = cursor.fetchall()
        return jsonify(results)
    except Exception as e:
        logger.error(f"Failed to fetch reports: {e}")
        return jsonify({"success": False, "message": "Failed to fetch reports"}), 500

if __name__ == '__main__':
    logger.info("Starting Flask server on port 5001")
    app.run(debug=True, port=5001)
