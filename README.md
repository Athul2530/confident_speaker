# AI-Enhanced Confident Speaker

An AI-powered web application designed to improve **public speaking confidence** and **pronunciation clarity**.  
The system analyzes **speech, tone, pace, vocabulary, and body language** using real-time **audio/video inputs** and provides personalized feedback.

---

## 🚀 Features
- 🎤 **Speech Analysis** – Detects tone, pace, and confidence levels.  
- 🧠 **Pronunciation Accuracy** – Identifies mispronunciations using ML models.  
- 🎥 **Body Language Tracking** – Uses OpenCV to monitor facial expressions & posture.  
- 📊 **Real-Time Feedback** – Provides confidence score & personalized coaching tips.  
- 🗂️ **Progress Tracking** – Tracks improvements over multiple sessions.

---

## 🛠️ Tech Stack
- **Frontend:** React.js  
- **Backend:** Node.js, Flask API  
- **Machine Learning:** Python, TensorFlow, CNN, NLP  
- **Database:** MySQL / MongoDB  
- **Other Tools:** OpenCV, Express.js  

---

## 📂 Project Structure
ConfidenceVoice/
│── backend/ # Node.js backend APIs
│── frontend/ # React frontend
│── ml_backend/ # Python ML models (Flask/TensorFlow)
│── confidence_speaker.sql # Database schema

2️⃣ Install dependencies

For frontend:

cd frontend
npm install


For backend:

cd backend
npm install


For ML backend:

cd ml_backend
pip install -r requirements.txt

3️⃣ Run the project

Start backend:

cd backend
npm start


Start frontend:

cd frontend
npm start


Start ML server:

cd ml_backend
python app.py
