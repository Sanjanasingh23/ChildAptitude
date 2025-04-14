-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2025 at 10:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kidgenius`
--

-- --------------------------------------------------------

--
-- Table structure for table `age_categories`
--

CREATE TABLE `age_categories` (
  `category_id` int(11) NOT NULL,
  `age_range` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `age_categories`
--

INSERT INTO `age_categories` (`category_id`, `age_range`, `title`, `description`) VALUES
(1, '3-5', 'Early Learners', 'Fun picture-based activities to identify early skills and interests'),
(2, '6-8', 'Young Explorers', 'Interactive puzzles and games to uncover developing talents'),
(3, '9-12', 'Junior Achievers', 'Comprehensive tests to identify academic strengths and aptitudes');

-- --------------------------------------------------------

--
-- Table structure for table `chat_logs`
--

CREATE TABLE `chat_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_bot` tinyint(1) DEFAULT 0,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `option_text` text NOT NULL,
  `option_image` varchar(255) DEFAULT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `option_order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `question_id`, `option_text`, `option_image`, `is_correct`, `option_order`) VALUES
(23, 1, 'Circle', NULL, 1, 1),
(24, 1, 'Square', NULL, 0, 2),
(25, 1, 'Triangle', NULL, 0, 3),
(26, 1, 'Rectangle', NULL, 0, 4),
(27, 2, 'True', NULL, 1, 1),
(28, 2, 'False', NULL, 0, 2),
(29, 3, '4', NULL, 1, 1),
(30, 3, '5', NULL, 0, 2),
(31, 3, '3', NULL, 0, 3),
(32, 3, '6', NULL, 0, 4),
(33, 4, 'Triangle', NULL, 1, 1),
(34, 4, 'Square', NULL, 0, 2),
(35, 4, 'Circle', NULL, 0, 3),
(36, 4, 'Rectangle', NULL, 0, 4),
(37, 5, 'Circle', NULL, 1, 1),
(38, 5, 'Square', NULL, 0, 2),
(39, 5, 'Triangle', NULL, 0, 3),
(40, 5, 'Hexagon', NULL, 0, 4),
(41, 6, 'Square', NULL, 0, 1),
(42, 6, 'Rectangle', NULL, 0, 2),
(43, 6, 'Rhombus', NULL, 0, 3),
(44, 6, 'Square', NULL, 1, 4),
(45, 7, 'Octagon', NULL, 1, 1),
(46, 7, 'Triangle', NULL, 0, 2),
(47, 7, 'Circle', NULL, 0, 3),
(48, 7, 'Hexagon', NULL, 0, 4),
(49, 8, 'Triangle', NULL, 1, 1),
(50, 8, 'Circle', NULL, 0, 2),
(51, 8, 'Rectangle', NULL, 0, 3),
(52, 8, 'Square', NULL, 0, 4),
(53, 9, '8', NULL, 1, 1),
(54, 9, '7', NULL, 0, 2),
(55, 9, '6', NULL, 0, 3),
(56, 9, '9', NULL, 0, 4),
(57, 10, '6', NULL, 1, 1),
(58, 10, '5', NULL, 0, 2),
(59, 10, '7', NULL, 0, 3),
(60, 10, '8', NULL, 0, 4),
(61, 11, '9', NULL, 1, 1),
(62, 11, '6', NULL, 0, 2),
(63, 11, '8', NULL, 0, 3),
(64, 11, '10', NULL, 0, 4),
(65, 12, '3', NULL, 1, 1),
(66, 12, '4', NULL, 0, 2),
(67, 12, '2', NULL, 0, 3),
(68, 12, '5', NULL, 0, 4),
(69, 13, '21', NULL, 1, 1),
(70, 13, '20', NULL, 0, 2),
(71, 13, '22', NULL, 0, 3),
(72, 13, '19', NULL, 0, 4),
(73, 14, 'Blue', NULL, 1, 1),
(74, 14, 'Green', NULL, 0, 2),
(75, 14, 'Yellow', NULL, 0, 3),
(76, 14, 'Red', NULL, 0, 4),
(77, 15, 'Yellow', NULL, 1, 1),
(78, 15, 'Red', NULL, 0, 2),
(79, 15, 'Green', NULL, 0, 3),
(80, 15, 'Blue', NULL, 0, 4),
(81, 16, 'Green', NULL, 1, 1),
(82, 16, 'Blue', NULL, 0, 2),
(83, 16, 'Yellow', NULL, 0, 3),
(84, 16, 'Red', NULL, 0, 4),
(85, 17, 'Red', NULL, 1, 1),
(86, 17, 'Green', NULL, 0, 2),
(87, 17, 'Yellow', NULL, 0, 3),
(88, 17, 'Blue', NULL, 0, 4),
(89, 18, 'Orange', NULL, 1, 1),
(90, 18, 'Yellow', NULL, 0, 2),
(91, 18, 'Green', NULL, 0, 3),
(92, 18, 'Blue', NULL, 0, 4),
(93, 19, 'Dog', NULL, 1, 1),
(94, 19, 'Cat', NULL, 0, 2),
(95, 19, 'Lion', NULL, 0, 3),
(96, 19, 'Elephant', NULL, 0, 4),
(97, 20, 'Cat', NULL, 1, 1),
(98, 20, 'Dog', NULL, 0, 2),
(99, 20, 'Lion', NULL, 0, 3),
(100, 20, 'Elephant', NULL, 0, 4),
(101, 21, 'Lion', NULL, 1, 1),
(102, 21, 'Dog', NULL, 0, 2),
(103, 21, 'Cat', NULL, 0, 3),
(104, 21, 'Elephant', NULL, 0, 4),
(105, 22, 'Elephant', NULL, 1, 1),
(106, 22, 'Dog', NULL, 0, 2),
(107, 22, 'Cat', NULL, 0, 3),
(108, 22, 'Lion', NULL, 0, 4),
(109, 23, 'Kangaroo', NULL, 1, 1),
(110, 23, 'Dog', NULL, 0, 2),
(111, 23, 'Cat', NULL, 0, 3),
(112, 23, 'Lion', NULL, 0, 4),
(113, 24, '144', NULL, 1, 1),
(114, 24, '121', NULL, 0, 2),
(115, 24, '132', NULL, 0, 3),
(116, 24, '150', NULL, 0, 4),
(117, 25, '9', NULL, 1, 1),
(118, 25, '8', NULL, 0, 2),
(119, 25, '7', NULL, 0, 3),
(120, 25, '10', NULL, 0, 4),
(121, 26, '5', NULL, 1, 1),
(122, 26, '4', NULL, 0, 2),
(123, 26, '6', NULL, 0, 3),
(124, 26, '7', NULL, 0, 4),
(125, 27, '45', NULL, 1, 1),
(126, 27, '40', NULL, 0, 2),
(127, 27, '50', NULL, 0, 3),
(128, 27, '55', NULL, 0, 4),
(129, 28, '25', NULL, 1, 1),
(130, 28, '20', NULL, 0, 2),
(131, 28, '30', NULL, 0, 3),
(132, 28, '35', NULL, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `test_type_id` int(11) DEFAULT NULL,
  `question_text` text NOT NULL,
  `question_image` varchar(255) DEFAULT NULL,
  `difficulty_level` enum('easy','medium','hard') NOT NULL,
  `question_order` int(11) NOT NULL DEFAULT 1,
  `question_type` enum('multiple_choice','true_false','short_answer') NOT NULL DEFAULT 'multiple_choice'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `test_type_id`, `question_text`, `question_image`, `difficulty_level`, `question_order`, `question_type`) VALUES
(1, 1, 'What shape is this?', NULL, 'easy', 1, 'multiple_choice'),
(2, 1, 'Is the sky blue?', NULL, 'easy', 2, 'true_false'),
(3, 2, 'What is 2 + 2?', NULL, 'easy', 1, 'short_answer'),
(4, 1, 'What shape has three sides?', NULL, 'easy', 3, 'multiple_choice'),
(5, 1, 'Which shape is round?', NULL, 'easy', 4, 'multiple_choice'),
(6, 1, 'What shape has four equal sides?', NULL, 'easy', 5, 'multiple_choice'),
(7, 1, 'Which shape is used in stop signs?', NULL, 'medium', 6, 'multiple_choice'),
(8, 1, 'What shape is a slice of pizza?', NULL, 'medium', 7, 'multiple_choice'),
(9, 2, 'What is 5 + 3?', NULL, 'easy', 2, 'short_answer'),
(10, 2, 'What is 10 - 4?', NULL, 'easy', 3, 'short_answer'),
(11, 2, 'What is 3 x 3?', NULL, 'medium', 4, 'short_answer'),
(12, 2, 'What is 12 ÷ 4?', NULL, 'medium', 5, 'short_answer'),
(13, 2, 'What is 15 + 6?', NULL, 'hard', 6, 'short_answer'),
(14, 3, 'What color is the sky?', NULL, 'easy', 1, 'multiple_choice'),
(15, 3, 'What color is a banana?', NULL, 'easy', 2, 'multiple_choice'),
(16, 3, 'What color is grass?', NULL, 'easy', 3, 'multiple_choice'),
(17, 3, 'What color is an apple?', NULL, 'medium', 4, 'multiple_choice'),
(18, 3, 'What color is a pumpkin?', NULL, 'medium', 5, 'multiple_choice'),
(19, 4, 'Which animal barks?', NULL, 'easy', 1, 'multiple_choice'),
(20, 4, 'Which animal meows?', NULL, 'easy', 2, 'multiple_choice'),
(21, 4, 'Which animal roars?', NULL, 'medium', 3, 'multiple_choice'),
(22, 4, 'Which animal has a trunk?', NULL, 'medium', 4, 'multiple_choice'),
(23, 4, 'Which animal hops?', NULL, 'medium', 5, 'multiple_choice'),
(24, 5, 'What is 12 x 12?', NULL, 'hard', 1, 'short_answer'),
(25, 5, 'What is the square root of 81?', NULL, 'hard', 2, 'short_answer'),
(26, 5, 'What is 25 ÷ 5?', NULL, 'medium', 3, 'short_answer'),
(27, 5, 'What is 15 x 3?', NULL, 'medium', 4, 'short_answer'),
(28, 5, 'What is 100 ÷ 4?', NULL, 'hard', 5, 'short_answer');

-- --------------------------------------------------------

--
-- Table structure for table `question_skills`
--

CREATE TABLE `question_skills` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  `weight` float DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skill_categories`
--

CREATE TABLE `skill_categories` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill_categories`
--

INSERT INTO `skill_categories` (`skill_id`, `skill_name`, `description`) VALUES
(1, 'Mathematical Reasoning', 'Ability to identify patterns and solve number problems'),
(2, 'Logical Thinking', 'Ability to analyze situations and draw conclusions'),
(3, 'Spatial Awareness', 'Understanding of shapes and how they relate to each other'),
(4, 'Memory', 'Recall abilities and information retention'),
(5, 'Language Skills', 'Vocabulary, comprehension, and communication abilities'),
(6, 'Creative Thinking', 'Ability to think outside the box and generate new ideas');

-- --------------------------------------------------------

--
-- Table structure for table `test_attempts`
--

CREATE TABLE `test_attempts` (
  `attempt_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `test_type_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `time_taken` int(11) NOT NULL,
  `score` int(11) DEFAULT 0,
  `correct_answers` int(11) DEFAULT 0,
  `total_questions` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_attempts`
--

INSERT INTO `test_attempts` (`attempt_id`, `user_id`, `test_type_id`, `start_time`, `end_time`, `time_taken`, `score`, `correct_answers`, `total_questions`) VALUES
(2, 1, 1, '2025-04-14 12:27:09', '2025-04-14 12:32:16', 307, 50, 1, 2),
(3, 1, 1, '2025-04-14 12:32:25', '2025-04-14 12:32:31', 6, 100, 2, 2),
(4, 1, 1, '2025-04-14 12:33:38', '2025-04-14 12:33:45', 7, 100, 2, 2),
(5, 1, 1, '2025-04-14 12:35:39', '2025-04-14 12:35:44', 5, 100, 2, 2),
(6, 1, 1, '2025-04-14 12:40:47', '2025-04-14 12:40:53', 6, 100, 2, 2),
(7, 1, 1, '2025-04-14 12:41:10', '2025-04-14 12:41:19', 9, 0, 0, 2),
(8, 1, 2, '2025-04-14 12:43:17', '2025-04-14 12:43:20', 3, 100, 1, 1),
(9, 1, 1, '2025-04-14 12:43:59', '2025-04-14 12:44:06', 7, 100, 2, 2),
(10, 1, 1, '2025-04-14 13:08:24', '2025-04-14 13:08:31', 7, 100, 2, 2),
(11, 1, 1, '2025-04-14 17:30:09', '2025-04-14 17:30:17', 8, 50, 1, 2),
(12, 1, 3, '2025-04-14 22:57:22', '2025-04-14 22:57:40', 18, 80, 4, 5),
(13, 1, 1, '2025-04-14 23:00:51', '2025-04-14 23:01:18', 27, 57, 4, 7),
(14, 1, 4, '2025-04-14 23:01:51', '2025-04-14 23:02:14', 23, 100, 5, 5),
(15, 1, 3, '2025-04-14 23:48:26', '2025-04-14 23:48:45', 19, 60, 3, 5),
(16, 1, 2, '2025-04-15 00:05:56', '2025-04-15 00:06:37', 41, 100, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `test_results`
--

CREATE TABLE `test_results` (
  `result_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `test_type_id` int(11) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `max_score` int(11) NOT NULL,
  `completion_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_types`
--

CREATE TABLE `test_types` (
  `type_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `test_name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_types`
--

INSERT INTO `test_types` (`type_id`, `category_id`, `test_name`, `description`) VALUES
(1, 1, 'Basic Shapes Test', 'Identify basic shapes.'),
(2, 2, 'Math Basics', 'Simple math problems.'),
(3, 1, 'Color Identification', 'Identify different colors.'),
(4, 1, 'Animal Recognition', 'Recognize animals from pictures.'),
(5, 2, 'Advanced Math', 'Solve advanced math problems.'),
(6, 3, 'Logical Reasoning', 'Solve logical puzzles.'),
(7, 3, 'Memory Challenge', 'Test your memory skills.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `child_name` varchar(100) DEFAULT NULL,
  `child_age` int(11) DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `child_name`, `child_age`, `registration_date`) VALUES
(1, 'Shrikant Kumar', 'example@gmail.com', '$2y$10$nT.rQXu3bNxiIl4/cnsDTesDZXLyavqwNuL3BEQKHWGHTTbXdKhWK', 'sanju', 5, '2025-04-13 21:37:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `answer_id` int(11) NOT NULL,
  `attempt_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option_id` int(11) NOT NULL,
  `is_correct` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_answers`
--

INSERT INTO `user_answers` (`answer_id`, `attempt_id`, `question_id`, `selected_option_id`, `is_correct`) VALUES
(1, 2, 1, 1, 1),
(2, 2, 2, 6, 0),
(3, 3, 1, 1, 1),
(4, 3, 2, 5, 1),
(5, 4, 1, 1, 1),
(6, 4, 2, 5, 1),
(7, 5, 1, 1, 1),
(8, 5, 2, 5, 1),
(9, 6, 1, 1, 1),
(10, 6, 2, 5, 1),
(11, 7, 1, 2, 0),
(12, 7, 2, 6, 0),
(13, 8, 3, 7, 1),
(14, 9, 1, 1, 1),
(15, 9, 2, 5, 1),
(16, 10, 1, 1, 1),
(17, 10, 2, 5, 1),
(18, 11, 1, 1, 1),
(19, 11, 2, 6, 0),
(20, 12, 14, 73, 1),
(21, 12, 15, 77, 1),
(22, 12, 16, 81, 1),
(23, 12, 17, 85, 1),
(24, 12, 18, 90, 0),
(25, 13, 1, 23, 1),
(26, 13, 2, 27, 1),
(27, 13, 4, 34, 0),
(28, 13, 5, 37, 1),
(29, 13, 6, 44, 1),
(30, 13, 7, 47, 0),
(31, 13, 8, 50, 0),
(32, 14, 19, 93, 1),
(33, 14, 20, 97, 1),
(34, 14, 21, 101, 1),
(35, 14, 22, 105, 1),
(36, 14, 23, 109, 1),
(37, 15, 14, 74, 0),
(38, 15, 15, 77, 1),
(39, 15, 16, 81, 1),
(40, 15, 17, 85, 1),
(41, 15, 18, 92, 0),
(42, 16, 3, 29, 1),
(43, 16, 9, 53, 1),
(44, 16, 10, 57, 1),
(45, 16, 11, 61, 1),
(46, 16, 12, 65, 1),
(47, 16, 13, 69, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_skills`
--

CREATE TABLE `user_skills` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  `score` float NOT NULL,
  `assessment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `age_categories`
--
ALTER TABLE `age_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `chat_logs`
--
ALTER TABLE `chat_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `test_type_id` (`test_type_id`);

--
-- Indexes for table `question_skills`
--
ALTER TABLE `question_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `skill_categories`
--
ALTER TABLE `skill_categories`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `test_attempts`
--
ALTER TABLE `test_attempts`
  ADD PRIMARY KEY (`attempt_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `test_type_id` (`test_type_id`);

--
-- Indexes for table `test_results`
--
ALTER TABLE `test_results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `test_type_id` (`test_type_id`);

--
-- Indexes for table `test_types`
--
ALTER TABLE `test_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `attempt_id` (`attempt_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `selected_option_id` (`selected_option_id`);

--
-- Indexes for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `age_categories`
--
ALTER TABLE `age_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chat_logs`
--
ALTER TABLE `chat_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `question_skills`
--
ALTER TABLE `question_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skill_categories`
--
ALTER TABLE `skill_categories`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `test_attempts`
--
ALTER TABLE `test_attempts`
  MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `test_results`
--
ALTER TABLE `test_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_types`
--
ALTER TABLE `test_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_logs`
--
ALTER TABLE `chat_logs`
  ADD CONSTRAINT `chat_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`type_id`);

--
-- Constraints for table `question_skills`
--
ALTER TABLE `question_skills`
  ADD CONSTRAINT `question_skills_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `question_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill_categories` (`skill_id`);

--
-- Constraints for table `test_attempts`
--
ALTER TABLE `test_attempts`
  ADD CONSTRAINT `test_attempts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `test_attempts_ibfk_2` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`type_id`);

--
-- Constraints for table `test_results`
--
ALTER TABLE `test_results`
  ADD CONSTRAINT `test_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `test_results_ibfk_2` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`type_id`);

--
-- Constraints for table `test_types`
--
ALTER TABLE `test_types`
  ADD CONSTRAINT `test_types_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `age_categories` (`category_id`);

--
-- Constraints for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`attempt_id`) REFERENCES `test_attempts` (`attempt_id`),
  ADD CONSTRAINT `user_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `user_answers_ibfk_3` FOREIGN KEY (`selected_option_id`) REFERENCES `options` (`option_id`);

--
-- Constraints for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD CONSTRAINT `user_skills_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill_categories` (`skill_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
