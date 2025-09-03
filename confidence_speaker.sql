-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2025 at 12:29 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `confidence_speaker`
--

-- --------------------------------------------------------

--
-- Table structure for table `analysis_results`
--

CREATE TABLE `analysis_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pronunciation_assessment` varchar(255) DEFAULT NULL,
  `most_repeated_word` varchar(255) DEFAULT NULL,
  `confident_percentage` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `filler_words` varchar(255) DEFAULT NULL,
  `not_confident_percentage` float DEFAULT NULL,
  `most_repeated_words` varchar(255) DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `analysis_results`
--

INSERT INTO `analysis_results` (`id`, `user_id`, `pronunciation_assessment`, `most_repeated_word`, `confident_percentage`, `created_at`, `filler_words`, `not_confident_percentage`, `most_repeated_words`, `suggestion`) VALUES
(1, 1, 'Bad vocabulary', 'to', 62.5, '2025-05-14 16:03:21', NULL, NULL, NULL, NULL),
(2, 1, 'Poor vocabulary', 'and', 100, '2025-05-14 16:03:21', NULL, NULL, NULL, NULL),
(3, 1, 'Poor vocabulary', 'and', 100, '2025-05-14 16:03:21', NULL, NULL, NULL, NULL),
(4, 1, 'Poor vocabulary', 'and', 100, '2025-05-14 16:03:21', NULL, NULL, NULL, NULL),
(5, 1, 'Bad vocabulary', 'you', NULL, '2025-05-14 16:03:21', NULL, NULL, NULL, NULL),
(6, 1, 'Good vocabulary', 'how', NULL, '2025-05-14 16:03:21', NULL, NULL, NULL, NULL),
(7, 1, 'Okay vocabulary', 'can', NULL, '2025-05-14 16:03:21', NULL, NULL, NULL, NULL),
(8, 1, 'Okay vocabulary', 'have', NULL, '2025-05-14 16:03:21', NULL, NULL, NULL, NULL),
(9, 1, 'Good vocabulary', 'and', 91.7472, '2025-05-17 07:45:46', NULL, NULL, NULL, NULL),
(10, 1, 'Good vocabulary', 'and', 91.7472, '2025-05-24 03:28:34', NULL, NULL, NULL, NULL),
(11, 4, 'Poor vocabulary', NULL, 100, '2025-06-18 10:20:48', 'like: 1', 19.3182, 'and, people, work', 'Focus on individual phonemes.'),
(12, 1, 'Poor vocabulary', NULL, 100, '2025-06-18 10:22:21', 'like: 1', 19.3182, 'and, people, work', 'Focus on individual phonemes.'),
(13, 1, 'Poor vocabulary', NULL, 100, '2025-06-18 10:28:50', 'like: 1', 19.3182, 'and, people, work', 'Focus on individual phonemes.');

-- --------------------------------------------------------

--
-- Table structure for table `audio_results`
--

CREATE TABLE `audio_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pronunciation` varchar(255) NOT NULL,
  `suggestion` text DEFAULT NULL,
  `most_repeated_words` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `filler_words` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audio_results`
--

INSERT INTO `audio_results` (`id`, `user_id`, `pronunciation`, `suggestion`, `most_repeated_words`, `created_at`, `filler_words`) VALUES
(1, 1, 'Good vocabulary', 'Pay attention to vowel sounds.', 'welcome', '2025-05-14 16:03:21', NULL),
(2, 1, 'Poor vocabulary', 'Pay attention to vowel sounds.', 'i', '2025-05-14 16:03:21', NULL),
(3, 1, 'Poor vocabulary', 'Focus on individual phonemes.', 'about', '2025-05-14 16:03:21', NULL),
(4, 1, 'Bad vocabulary', 'Break down complex sounds.', 'about', '2025-05-14 16:03:21', NULL),
(5, 1, 'Poor vocabulary', 'Focus on individual phonemes.', 'in', '2025-05-14 16:03:21', NULL),
(6, 1, 'Okay vocabulary', 'Work on consonant sounds.', 'bro', '2025-05-16 07:41:47', NULL),
(7, 1, 'Good vocabulary', 'Pay attention to vowel sounds.', 'how', '2025-05-16 07:44:05', NULL),
(8, 1, 'Excellent vocabulary', 'Practice stress and intonation.', 'i', '2025-05-16 07:44:19', NULL),
(9, 6, 'Okay vocabulary', 'Work on consonant sounds.', 'good', '2025-05-17 06:07:09', NULL),
(10, 1, 'Bad vocabulary', 'Break down complex sounds.', 'your, real, time', '2025-05-17 15:48:14', 'None'),
(11, 1, 'Poor vocabulary', 'Focus on individual phonemes.', 'intelligence, is, and', '2025-05-17 15:52:00', 'like'),
(12, 1, 'Poor vocabulary', 'Focus on individual phonemes.', 'intelligence, artificial, is', '2025-05-17 15:58:52', 'like'),
(13, 1, 'Poor vocabulary', 'Focus on individual phonemes.', 'is, a, charges', '2025-05-17 16:08:43', 'None'),
(14, 1, 'Excellent vocabulary', 'Practice stress and intonation.', 'i, would, work', '2025-05-17 16:14:51', 'None'),
(15, 1, 'Okay vocabulary', 'Work on consonant sounds.', 'even, a, did', '2025-05-17 16:16:35', 'like'),
(16, 1, 'Bad vocabulary', 'Break down complex sounds.', 'audio, analysis, real', '2025-05-18 16:25:59', 'None'),
(17, 1, 'Okay vocabulary', 'Work on consonant sounds.', 'good, morning, everyone', '2025-05-24 04:08:35', 'None'),
(18, 1, 'Okay vocabulary', 'Work on consonant sounds.', 'good, morning, everyone', '2025-05-29 15:50:39', 'None'),
(19, 1, 'Okay vocabulary', 'Work on consonant sounds.', 'auto, real, time', '2025-06-18 09:00:13', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `book_name`, `category_id`, `description`, `author`, `publisher`, `price`, `status`, `isbn`, `cover_image`) VALUES
(1, 'Making the Connections', 2, 'Companies know that communication with their people is vital if the energies and the efforts of their employees are to point in the same direction. Making the Connections shows how to use internal communication to turn strategy into action. Bill Quirke demonstrates practically how businesses can use internal communication to achieve differentiation, to improve their quality, customer service, and innovation, and to manage change more effectively. He describes the why, the what and the how of internal communication ', 'Bill Quirke', 'Routledge', 3560.00, 'Active', 'B06XDCYPDK', '/uploads/book_covers/book_1744006518520-107153035.jpg'),
(2, 'The Great Gatsby', 1, 'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick Carraway\'s interactions with mysterious millionaire Jay Gatsby and Gatsby\'s obsession to reunite with his former lover, Daisy Buchanan.', 'F. Scott Fitzgerald', 'Tech Tok Ltd', 876.00, 'Active', ' B0C1M7X943', '/uploads/book_covers/book_1744006710667-50015674.jpg'),
(6, 'Atomic Habits', 4, 'People think that when you want to change your life, you need to think big. But world-renowned habits expert James Clear has discovered another way. He knows that real change comes from the compound effect of hundreds of small decisions: doing two push-ups a day, waking up five minutes early, or holding a single short phone call.', 'James Clear', 'Random House Business', 799.00, 'Active', '1847941834', '/uploads/book_covers/book_1746431307347-420370793.jpg'),
(7, 'How to Build a Better Vocabulary', 1, 'Grammar book', 'Maxwell Numberg', 'xys', 400.00, 'Active', '593593ru', '/uploads/book_covers/book_1746603060019-894428867.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `id`, `book_id`, `quantity`, `price`, `created_at`) VALUES
(16, 6, 7, 1, 400.00, '2025-05-08 05:50:03'),
(17, 6, 6, 1, 799.00, '2025-05-08 05:50:19'),
(19, 1, 7, 2, 400.00, '2025-05-29 15:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `category_name`, `description`, `status`) VALUES
(1, 'English', 'English Books', 'Active'),
(2, 'Public Speaking', 'Guides for assisting in public speaking', 'Active'),
(4, 'Self improvement', 'Books on Self improvement', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('read','unread') DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `status`) VALUES
(1, 'Shreyas A', 'shreyas2002alv@gmail.com', 'A', 'hbvhi', '2025-05-08 06:00:34', 'unread'),
(2, 'Heeettt', 'shreyas2002lv@gmail.com', 'A', 'Hellooooo!!!', '2025-05-08 06:15:02', 'unread'),
(3, 'ajay', 'ajay@gmail.com', 'Confidence', 'good', '2025-05-08 09:10:37', 'unread'),
(4, 'Shreyas', 'shreyas2002alv@gmail.com', 'Confidence hahaha', 'really good', '2025-05-13 16:45:54', 'unread');

-- --------------------------------------------------------

--
-- Table structure for table `emotion_results`
--

CREATE TABLE `emotion_results` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `confident_percentage` float DEFAULT NULL,
  `visual_confidence` varchar(150) NOT NULL,
  `verbal_confidence` varchar(150) NOT NULL,
  `overall_confidence` varchar(150) NOT NULL,
  `transcribed_speech` varchar(150) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `filler_words` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emotion_results`
--

INSERT INTO `emotion_results` (`id`, `user_id`, `confident_percentage`, `visual_confidence`, `verbal_confidence`, `overall_confidence`, `transcribed_speech`, `timestamp`, `filler_words`) VALUES
(1, '1', 30.77, '30.77', '50', '30.77', '', '2025-05-12 18:47:36', NULL),
(2, '1', 50, '0', '50', '50', 'No speech detected', '2025-05-12 19:13:54', NULL),
(3, '1', 50, '0', '50', '50', 'good morning good night welcome video expression and speech using your website ', '2025-05-12 19:14:45', NULL),
(4, '1', 92, '92', '50', '92', 'No speech detected', '2025-05-12 19:29:03', NULL),
(5, '1', 97.46, '97.46', '50', '97.46', 'play music Facebook online analysis is important play music Facebook online analysis is important YouTube analysis report oral confidence visual Airte', '2025-05-12 19:31:18', NULL),
(6, '1', 96.88, '94.81', '100', '96.88', 'bro I am fine you are a i right you are a I mean hello MI AI am I a i hello how are you how are you good confident ', '2025-05-16 07:43:19', NULL),
(7, '1', 48.28, '48.28', '50', '48.28', 'No speech detected', '2025-05-17 06:57:22', NULL),
(8, '1', 50, '0', '50', '50', 'hello good morning can I is everything alright why you know actually physically ', '2025-05-18 16:39:19', 'actually'),
(9, '1', 50, '0', '50', '50', 'No speech detected', '2025-05-18 16:40:06', 'None'),
(10, '1', 40, '0', '100', '40', 'can you hear me is everything alright movie HD song confident ', '2025-05-18 16:41:01', 'None'),
(11, '1', 15.58, '15.58', '50', '15.58', 'can you say me confidence today Pawan Kalyan chatting assistant ', '2025-05-18 16:42:38', NULL),
(12, '1', 66.06, '43.43', '100', '66.06', 'hello I not confident and confident you hear me ', '2025-05-18 16:47:03', NULL),
(13, '1', 0, '0', '0', '0', 'where is the syllabus where is the syllabus actually this is very bad like you know it can get ', '2025-05-18 16:49:12', 'like, actually'),
(14, '1', 54.96, '54.96', '50', '54.96', 'namaste camera what\'s the time now most beautiful no no no that\'s not about I am looking for ', '2025-05-18 16:59:12', 'None'),
(15, '1', 50, '0', '50', '50', 'Partial speech detected', '2025-05-18 17:41:49', 'None'),
(16, '1', 98.9, '98.9', '50', '98.9', 'Maruti suzuki analysis', '2025-05-18 17:42:57', 'None'),
(17, '1', 44.38, '44.38', '50', '44.38', 'Good morning everyoneanalysis is in progress', '2025-05-24 03:31:08', 'None'),
(18, '1', 97.37, '97.37', '50', '97.37', 'Partial speech detected', '2025-05-24 03:33:49', 'None'),
(19, '1', 58.89, '98.15', '0', '58.89', 'Timer of 60 second but it will take like 50 seconds no 10 seconds to start a timer', '2025-05-24 04:10:56', 'like'),
(20, '1', 48.42, '48.42', '50', '48.42', 'Partial speech detected', '2025-05-29 15:52:24', 'None'),
(21, '1', 38.65, '38.65', '50', '38.65', 'This is a very nice daythis is a very nice day for a picnic and windows print screen windows available', '2025-05-29 15:55:17', 'None'),
(22, '1', 62.11, '62.11', '50', '62.11', 'Partial speech detected', '2025-05-29 15:55:50', 'None'),
(23, '1', 12.3, '12.3', '50', '12.3', 'Good morning everyone it\'s truly honoured to be here with you what is motivational speech speak all come from different backgrounds with unique storie', '2025-05-29 15:58:51', 'None'),
(24, '1', 65.25, '65.25', '50', '65.25', 'Everyone it\'s truly an honour to be here with you that is motivational stamina we all come from different backgrounds different stories and dreams but', '2025-05-29 16:00:17', 'None'),
(25, '1', 32.82, '32.82', '50', '32.82', 'Partial speech detected', '2025-06-18 10:24:13', 'None'),
(26, '1', 52.63, '52.63', '50', '52.63', 'Statistics exam 2nd standardcan i change it to 60 second', '2025-06-18 10:24:49', 'None'),
(27, '1', 30.75, '51.25', '0', '30.75', 'Daw uncertain if possibleall most wanted', '2025-06-18 10:27:12', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(20) NOT NULL,
  `date` date NOT NULL DEFAULT curdate(),
  `user_id` int(11) NOT NULL,
  `net_total` decimal(10,2) NOT NULL,
  `status` enum('Pending','Approved','Dispatched','Delivered','Cancelled') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `user_id`, `net_total`, `status`) VALUES
('ORD-1744222273488-50', '2025-04-09', 1, 299.99, 'Pending'),
('ORD1744214877039', '2025-04-09', 1, 1299.50, 'Pending'),
('ORD1744219979040', '2025-04-09', 2, 1299.50, 'Pending'),
('ORD202504161115', '2025-04-16', 6, 1766.00, 'Dispatched'),
('ORD202504164272', '2025-04-16', 6, 1766.00, 'Approved'),
('ORD202504166415', '2025-04-16', 6, 876.00, 'Pending'),
('ORD202504168821', '2025-04-16', 6, 1766.00, 'Pending'),
('ORD202504168874', '2025-04-16', 6, 876.00, 'Approved'),
('ORD202504177999', '2025-04-17', 6, 876.00, 'Cancelled'),
('ORDER-028618', '2025-04-18', 6, 2628.00, 'Dispatched'),
('ORDER-082294', '2025-04-21', 1, 6188.00, 'Pending'),
('ORDER-161578', '2025-04-30', 6, 1780.00, 'Cancelled'),
('ORDER-189300', '2025-04-17', 6, 876.00, 'Delivered'),
('ORDER-212710', '2025-04-17', 6, 2628.00, 'Pending'),
('ORDER-261866', '2025-05-07', 3, 876.00, 'Pending'),
('ORDER-329762', '2025-04-30', 6, 876.00, 'Cancelled'),
('ORDER-376649', '2025-05-05', 3, 799.00, 'Pending'),
('ORDER-413681', '2025-05-05', 3, 1766.00, 'Pending'),
('ORDER-430018', '2025-04-17', 6, 890.00, 'Pending'),
('ORDER-438598', '2025-05-08', 6, 799.00, 'Pending'),
('ORDER-574588', '2025-04-17', 6, 2628.00, 'Delivered'),
('ORDER-614866', '2025-04-18', 6, 890.00, 'Delivered'),
('ORDER-615058', '2025-05-07', 3, 800.00, 'Pending'),
('ORDER-722877', '2025-04-30', 6, 3504.00, 'Dispatched'),
('ORDER-748652', '2025-04-30', 6, 3560.00, 'Approved'),
('ORDER-753099', '2025-04-30', 6, 3504.00, 'Dispatched'),
('ORDER-821609', '2025-05-14', 1, 6188.00, 'Pending'),
('ORDER-896639', '2025-05-16', 1, 400.00, 'Pending'),
('ORDER-940628', '2025-04-17', 6, 876.00, 'Delivered'),
('ORDER-978112', '2025-04-17', 6, 876.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` int(11) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`id`, `order_id`, `user_id`, `book_id`, `description`, `price`) VALUES
(4, 'ORD-1744222273488-50', 1, 1, 'Book 1 description', 99.99),
(5, 'ORD-1744222273488-50', 1, 2, 'Book 2 description', 199.00),
(6, 'ORD-1744222273488-50', 1, 1, 'Book 1 description', 99.99),
(7, 'ORD-1744222273488-50', 1, 2, 'Book 2 description', 199.00),
(9, 'ORD202504161115', 6, 1, 'Making the Connections', 890.00),
(10, 'ORD202504161115', 6, 2, 'The Great Gatsby', 876.00),
(11, 'ORD202504164272', 6, 1, 'Making the Connections', 890.00),
(12, 'ORD202504164272', 6, 2, 'The Great Gatsby', 876.00),
(13, 'ORD202504168821', 6, 1, 'Making the Connections', 890.00),
(14, 'ORD202504168821', 6, 2, 'The Great Gatsby', 876.00),
(15, 'ORD202504166415', 6, 2, 'The Great Gatsby', 876.00),
(16, 'ORD202504168874', 6, 2, 'The Great Gatsby', 876.00),
(17, 'ORD202504177999', 6, 2, 'The Great Gatsby', 876.00),
(18, 'ORDER-189300', 6, 2, 'Direct purchase: The Great Gatsby', 876.00),
(19, 'ORDER-189300', 6, 2, 'Direct purchase: The Great Gatsby', 876.00),
(20, 'ORDER-430018', 6, 1, 'Direct purchase: Making the Connections', 890.00),
(21, 'ORDER-430018', 6, 1, 'Direct purchase: Making the Connections', 890.00),
(22, 'ORDER-940628', 6, 2, 'Direct purchase: The Great Gatsby', 876.00),
(23, 'ORDER-940628', 6, 2, 'Direct purchase: The Great Gatsby', 876.00),
(24, 'ORDER-978112', 6, 2, 'Direct purchase: The Great Gatsby', 876.00),
(25, 'ORDER-978112', 6, 2, 'Direct purchase: The Great Gatsby', 876.00),
(26, 'ORDER-574588', 6, 2, 'Purchase: The Great Gatsby', 876.00),
(27, 'ORDER-574588', 6, 2, 'Purchase: The Great Gatsby', 876.00),
(28, 'ORDER-212710', 6, 2, 'Purchase: The Great Gatsby', 876.00),
(29, 'ORDER-212710', 6, 2, 'Purchase: The Great Gatsby', 876.00),
(30, 'ORDER-614866', 6, 1, 'Direct purchase: Making the Connections', 890.00),
(31, 'ORDER-614866', 6, 1, 'Direct purchase: Making the Connections', 890.00),
(32, 'ORDER-028618', 6, 2, 'Purchase: The Great Gatsby', 876.00),
(33, 'ORDER-028618', 6, 2, 'Purchase: The Great Gatsby', 876.00),
(34, 'ORDER-082294', 1, 1, 'Purchase: Making the Connections', 890.00),
(35, 'ORDER-082294', 1, 2, 'Purchase: The Great Gatsby', 876.00),
(36, 'ORDER-329762', 6, 2, 'Direct purchase: The Great Gatsby', 876.00),
(37, 'ORDER-722877', 6, 2, 'Purchase: The Great Gatsby', 876.00),
(38, 'ORDER-753099', 6, 2, 'Purchase: The Great Gatsby', 876.00),
(39, 'ORDER-753099', 6, 2, 'Purchase: The Great Gatsby', 876.00),
(40, 'ORDER-748652', 6, 1, 'Purchase: Making the Connections', 890.00),
(41, 'ORDER-748652', 6, 1, 'Purchase: Making the Connections', 890.00),
(42, 'ORDER-161578', 6, 1, 'Purchase: Making the Connections', 890.00),
(43, 'ORDER-161578', 6, 1, 'Purchase: Making the Connections', 890.00),
(44, 'ORDER-376649', 3, 6, 'Direct purchase: Atomic Habits', 799.00),
(45, 'ORDER-376649', 3, 6, 'Direct purchase: Atomic Habits', 799.00),
(46, 'ORDER-413681', 3, 2, 'Purchase: The Great Gatsby', 876.00),
(47, 'ORDER-413681', 3, 1, 'Purchase: Making the Connections', 890.00),
(48, 'ORDER-413681', 3, 2, 'Purchase: The Great Gatsby', 876.00),
(49, 'ORDER-413681', 3, 1, 'Purchase: Making the Connections', 890.00),
(50, 'ORDER-261866', 3, 2, 'Direct purchase: The Great Gatsby', 876.00),
(51, 'ORDER-261866', 3, 2, 'Direct purchase: The Great Gatsby', 876.00),
(52, 'ORDER-615058', 3, 7, 'Purchase: How to Build a Better Vocabulary', 400.00),
(53, 'ORDER-615058', 3, 7, 'Purchase: How to Build a Better Vocabulary', 400.00),
(54, 'ORDER-438598', 6, 6, 'Direct purchase: Atomic Habits', 799.00),
(55, 'ORDER-438598', 6, 6, 'Direct purchase: Atomic Habits', 799.00),
(56, 'ORDER-821609', 1, 1, 'Purchase: Making the Connections', 890.00),
(57, 'ORDER-821609', 1, 2, 'Purchase: The Great Gatsby', 876.00),
(58, 'ORDER-821609', 1, 1, 'Purchase: Making the Connections', 890.00),
(59, 'ORDER-821609', 1, 2, 'Purchase: The Great Gatsby', 876.00),
(60, 'ORDER-896639', 1, 7, 'Purchase: How to Build a Better Vocabulary', 400.00),
(61, 'ORDER-896639', 1, 7, 'Purchase: How to Build a Better Vocabulary', 400.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `payment_number` varchar(25) NOT NULL,
  `status` enum('Success','Failure') DEFAULT 'Success',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `price` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `card_holder_name` varchar(100) DEFAULT NULL,
  `card_expiry_month` varchar(2) DEFAULT NULL,
  `card_expiry_year` varchar(4) DEFAULT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  `upi_id` varchar(50) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `book_id`, `payment_number`, `status`, `date`, `price`, `payment_method`, `full_name`, `phone_number`, `billing_address`, `pincode`, `card_number`, `card_holder_name`, `card_expiry_month`, `card_expiry_year`, `cvv`, `upi_id`, `bank_name`, `account_number`, `ifsc_code`) VALUES
(4, 1, 1, 'PAY-1744229999999-1122', 'Success', '2025-04-10 00:02:08', 99.99, 'Card', 'John Doe', '9876543210', '123 Street, City', '123456', '4111111111111111', 'John Doe', '08', '2028', '123', NULL, NULL, NULL, NULL),
(5, 1, 2, 'PAY-1744229999999-1122', 'Success', '2025-04-10 00:02:08', 199.00, 'Card', 'John Doe', '9876543210', '123 Street, City', '123456', '4111111111111111', 'John Doe', '08', '2028', '123', NULL, NULL, NULL, NULL),
(6, 6, 2, 'ORDER-189300', 'Success', '2025-04-17 00:00:00', 876.00, 'netbanking', 'Shreyas A', '0000000000', 'hhh', '575014', NULL, NULL, NULL, NULL, NULL, NULL, 'asd', '111789909', 'SBIN0005948'),
(7, 6, 1, 'ORDER-430018', '', '2025-04-17 00:00:00', 890.00, 'cod', 'Shreyas A', '0000000000', 'hhh', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 6, 2, 'ORDER-940628', '', '2025-04-17 00:00:00', 876.00, 'cod', 'Shreyas A', '0000000000', 'hhh', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 6, 2, 'ORDER-978112', '', '2025-04-17 00:00:00', 876.00, 'cod', 'Shreyas A', '0000000000', 'hhh', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 6, 2, 'ORDER-574588', '', '2025-04-17 00:00:00', 2628.00, 'cod', 'Shreyas A', '0000000000', 'hhh', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 6, 2, 'ORDER-212710', '', '2025-04-17 00:00:00', 2628.00, 'cod', 'Shreyas A', '0000000000', 'hhh', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 6, 1, 'ORDER-614866', '', '2025-04-18 00:00:00', 890.00, 'cod', 'Shreyas A', '0000000000', 'hhh', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 6, 2, 'ORDER-028618', '', '2025-04-18 00:00:00', 2628.00, 'cod', 'Shreyas A', '0000000000', 'hhh', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 6, 2, 'ORDER-753099', '', '2025-04-30 00:00:00', 3504.00, 'cod', 'Shreyas A', '0000000000', 'Near Kashimatha road, Surathkal', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 6, 1, 'ORDER-748652', '', '2025-04-30 00:00:00', 3560.00, 'cod', 'Shreyas A', '0000000000', 'Near Kashimatha road, Surathkal', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 6, 1, 'ORDER-161578', '', '2025-04-30 00:00:00', 1780.00, 'cod', 'Shreyas A', '0000000000', 'Near Kashimatha road, Surathkal', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 3, 6, 'ORDER-376649', '', '2025-05-05 00:00:00', 799.00, 'cod', 'John', '0000000000', 'Dooooe', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 3, 2, 'ORDER-413681', '', '2025-05-05 00:00:00', 1766.00, 'cod', 'John', '0000000000', 'qwq', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 3, 2, 'ORDER-261866', '', '2025-05-07 00:00:00', 876.00, 'cod', 'John', '0000000000', 'qqq', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 3, 7, 'ORDER-615058', '', '2025-05-07 00:00:00', 800.00, 'cod', 'Shreyas A', '0000000000', 'hhh', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 6, 6, 'ORDER-438598', '', '2025-05-08 00:00:00', 799.00, 'cod', 'Shreyas A', '0000000000', 'iop', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 1, 1, 'ORDER-821609', '', '2025-05-14 00:00:00', 6188.00, 'cod', 'Shreyas A', '0000000000', 'Near Kashimatha road, Surathkal', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 1, 7, 'ORDER-896639', '', '2025-05-16 00:00:00', 400.00, 'cod', 'Shreyas A', '0000000000', 'Near Kashimatha road, Surathkal', '575014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('Admin','User') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `otp` int(11) NOT NULL,
  `otp_expiry` datetime DEFAULT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `role`, `create_date`, `otp`, `otp_expiry`, `email`) VALUES
(1, 'Shreyas A', 'Shreyas02', 'User', '2025-03-11 16:20:27', 282530, NULL, 'shreyas2002alv@gmail.com'),
(2, 'shreyas20022', 'Shreyas23072002', 'User', '2025-03-11 17:28:11', 187493, NULL, 'shreyas2002lv@gmail.com'),
(3, 'nnm23mc145', 'nnm23mc145', 'User', '2025-03-20 07:53:14', 529690, NULL, 'nnm23mc145@nmamit.in'),
(4, 'admin123', 'Admin111', 'Admin', '2025-03-20 07:57:38', 0, NULL, 'shreyas02048@gmail.com'),
(6, 'test1', 'passtest', 'User', '2025-03-27 05:04:08', 0, NULL, 'shreyas20022048@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analysis_results`
--
ALTER TABLE `analysis_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audio_results`
--
ALTER TABLE `audio_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `id` (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emotion_results`
--
ALTER TABLE `emotion_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analysis_results`
--
ALTER TABLE `analysis_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `audio_results`
--
ALTER TABLE `audio_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `emotion_results`
--
ALTER TABLE `emotion_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD CONSTRAINT `order_transactions_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `order_transactions_ibfk_3` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
