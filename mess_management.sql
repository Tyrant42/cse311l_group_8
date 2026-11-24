-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2026 at 06:03 PM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mess_management`
--
CREATE DATABASE IF NOT EXISTS `mess_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mess_management`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'ADMIN', '$2y$10$HQbSG/xHaX3xHS3t1VCYHeHnmuhn0YPDLuq1VfLf1EZEajENOhERa'),
(2, 'MANAGER', '$2y$10$HQbSG/xHaX3xHS3t1VCYHeHnmuhn0YPDLuq1VfLf1EZEajENOhERa');

-- --------------------------------------------------------

--
-- Table structure for table `daily_menu`
--

DROP TABLE IF EXISTS `daily_menu`;
CREATE TABLE IF NOT EXISTS `daily_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `breakfast` text DEFAULT NULL,
  `lunch` text DEFAULT NULL,
  `dinner` text DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_menu`
--

INSERT INTO `daily_menu` (`menu_id`, `date`, `breakfast`, `lunch`, `dinner`) VALUES
(1, '2026-11-22', 'Parata, shobji torkari, shiddho dim', 'Rice, murgir mangsho, dal, salad', 'Rice, gorur mangsho, mixed vegetables'),
(2, '2026-11-23', 'Khichuri, dim vuna', 'Rice, rui mas, dal, bhaji', 'Rice, grill chicken, dal'),
(3, '2026-11-24', 'Bread, banana, omelette', 'Rice, gorur mangsho, mixed vegetables, dal', 'Rice, ilish mas, dal'),
(4, '2026-11-25', 'Luchi, alu bhaji, sweet', 'Polao, grill chicken, salad', 'Rice, dim torkari, dal, bhorta'),
(5, '2026-11-26', 'Parata, dal, shiddho dim', 'Rice, mangsho, dal, salad', 'Rice, mas vaja, mixed vegetables'),
(6, '2026-11-27', 'Khichuri, beguni, dim', 'Rice, chicken curry, dal, bhaji', 'Rice, gorur mangsho, dal'),
(7, '2026-11-28', 'Bread, jelly, banana', 'Biryani, borhani, salad', 'Rice, rui mas, dal');

-- --------------------------------------------------------

--
-- Table structure for table `meal_packages`
--

DROP TABLE IF EXISTS `meal_packages`;
CREATE TABLE IF NOT EXISTS `meal_packages` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(100) NOT NULL,
  `meal_count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `validity_days` int(11) NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal_packages`
--

INSERT INTO `meal_packages` (`package_id`, `package_name`, `meal_count`, `price`, `validity_days`) VALUES
(1, 'Weekly 14 Meals', 14, 700.00, 7),
(2, 'Basic 30 Meals', 30, 1500.00, 30),
(3, 'Standard 60 Meals', 60, 2800.00, 60),
(4, 'Premium 90 Meals', 90, 4000.00, 90),
(5, 'Student Friendly', 35, 2500.00, 30);

-- --------------------------------------------------------

--
-- Table structure for table `meal_planner`
--

DROP TABLE IF EXISTS `meal_planner`;
CREATE TABLE IF NOT EXISTS `meal_planner` (
  `planner_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `breakfast` tinyint(4) DEFAULT 1,
  `lunch` tinyint(4) DEFAULT 1,
  `dinner` tinyint(4) DEFAULT 1,
  `deducted` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`planner_id`),
  UNIQUE KEY `student_id` (`student_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal_planner`
--

INSERT INTO `meal_planner` (`planner_id`, `student_id`, `date`, `breakfast`, `lunch`, `dinner`, `deducted`) VALUES
(1, 1, '2026-11-23', 1, 1, 1, 1),
(2, 1, '2026-11-24', 1, 1, 1, 0),
(3, 1, '2026-11-25', 1, 1, 0, 0),
(4, 2, '2026-11-24', 0, 1, 1, 0),
(5, 2, '2026-11-25', 1, 1, 1, 0),
(6, 3, '2026-11-23', 1, 1, 1, 1),
(7, 3, '2026-11-24', 1, 1, 1, 0),
(8, 5, '2026-11-24', 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `meal_ratings`
--

DROP TABLE IF EXISTS `meal_ratings`;
CREATE TABLE IF NOT EXISTS `meal_ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `meal_type` varchar(20) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal_ratings`
--

INSERT INTO `meal_ratings` (`rating_id`, `student_id`, `date`, `meal_type`, `rating`, `comment`) VALUES
(1, 1, '2026-11-22', 'lunch', 4, 'murgir mangsho taste valo hoise and ranna o valo hoise'),
(2, 2, '2026-11-22', 'dinner', 3, 'Gorur mangsho shokto'),
(3, 3, '2026-11-23', 'breakfast', 5, 'Gorom gorom Khichuri'),
(4, 1, '2026-11-23', 'lunch', 4, 'mas er valo ongsho paisi'),
(5, 5, '2026-11-23', 'lunch', 5, 'Best meal this week'),
(6, 2, '2026-11-23', 'dinner', 2, 'Dupurer thanda khabar dhoray dise'),
(7, 3, '2026-11-23', 'dinner', 4, 'grill chicken ta valo moja hoise'),
(8, 5, '2026-11-22', 'dinner', 3, 'Average, shobji kom hoise');

-- --------------------------------------------------------

--
-- Table structure for table `mess_entries`
--

DROP TABLE IF EXISTS `mess_entries`;
CREATE TABLE IF NOT EXISTS `mess_entries` (
  `entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `entry_time` datetime DEFAULT NULL,
  `exit_time` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mess_entries`
--

INSERT INTO `mess_entries` (`entry_id`, `student_id`, `entry_time`, `exit_time`, `date`) VALUES
(1, 1, '2026-11-23 07:45:00', '2026-11-23 08:10:00', '2026-11-23'),
(2, 1, '2026-11-23 13:05:00', '2026-11-23 13:40:00', '2026-11-23'),
(3, 2, '2026-11-23 13:15:00', '2026-11-23 13:50:00', '2026-11-23'),
(4, 2, '2026-11-22 08:00:00', '2026-11-22 08:25:00', '2026-11-22'),
(5, 3, '2026-11-23 07:50:00', '2026-11-23 08:15:00', '2026-11-23'),
(6, 3, '2026-11-23 19:30:00', '2026-11-23 20:05:00', '2026-11-23'),
(7, 5, '2026-11-22 19:40:00', '2026-11-22 20:10:00', '2026-11-22'),
(8, 5, '2026-11-23 13:00:00', '2026-11-23 13:30:00', '2026-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` varchar(20) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `payment_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`payment_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `student_id`, `amount`, `method`, `transaction_id`, `status`, `payment_date`) VALUES
(1, 1, 2800.00, 'bKash', 'BK9F3K21A', 'approved', '2026-11-01 09:15:00'),
(2, 2, 1500.00, 'Nagad', 'NG7D2M45B', 'approved', '2026-11-05 11:30:00'),
(3, 3, 4000.00, 'bKash', 'BK4H8P77C', 'approved', '2026-11-10 14:05:00'),
(4, 4, 700.00, 'Cash', NULL, 'approved', '2026-11-10 16:20:00'),
(5, 5, 1500.00, 'bKash', 'BK2L6Q90D', 'approved', '2026-11-18 10:45:00'),
(6, 1, 700.00, 'Nagad', 'NG5T1R63E', 'approved', '2026-10-20 13:10:00'),
(7, 6, 2000.00, 'bKash', 'BK8W3Z12F', 'pending', '2026-11-23 18:40:00'),
(8, 2, 500.00, 'Nagad', 'NG1X9Y34G', 'rejected', '2026-11-12 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `room_no` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `balance` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `email`, `phone`, `room_no`, `password`, `balance`) VALUES
(1, 'Muktadir Dhrubo', 'muktadir.dhrubo@northsouth.edu', '01711000001', 'A-101', '$2y$10$oBuw8WnfsdLDTUVQNOfzdu3AeeRQYMxMF6Tx8icMivFv4yjaDi9Am', 850.00),
(2, 'Hasibur Rahman', 'hasibur.rahman@northsouth.edu', '01811000002', 'A-102', '$2y$10$oBuw8WnfsdLDTUVQNOfzdu3AeeRQYMxMF6Tx8icMivFv4yjaDi9Am', 600.00),
(3, 'Arikul Upol', 'arikul.upol@northsouth.edu', '01911000003', 'B-201', '$2y$10$oBuw8WnfsdLDTUVQNOfzdu3AeeRQYMxMF6Tx8icMivFv4yjaDi9Am', 400.00),
(4, 'Parizad Zohrabia', 'parizad.zohrabia@northsouth.edu', '01611000004', 'B-202', '$2y$10$oBuw8WnfsdLDTUVQNOfzdu3AeeRQYMxMF6Tx8icMivFv4yjaDi9Am', 650.00),
(5, 'Mokles Uddin', 'mokles.uddinm@northsouth.edu', '01511000005', 'C-301', '$2y$10$oBuw8WnfsdLDTUVQNOfzdu3AeeRQYMxMF6Tx8icMivFv4yjaDi9Am', 500.00),
(6, 'Angel Sadia', 'angel.sadia@northsouth.edu', '01311000006', 'C-302', '$2y$10$oBuw8WnfsdLDTUVQNOfzdu3AeeRQYMxMF6Tx8icMivFv4yjaDi9Am', 700.00);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `meals_remaining` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  PRIMARY KEY (`subscription_id`),
  KEY `student_id` (`student_id`),
  KEY `package_id` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`subscription_id`, `student_id`, `package_id`, `meals_remaining`, `purchase_date`, `expiry_date`, `status`) VALUES
(1, 1, 3, 41, '2026-11-01', '2026-12-31', 'active'),
(2, 2, 2, 12, '2026-11-05', '2026-12-05', 'active'),
(3, 3, 4, 70, '2026-11-10', '2027-02-08', 'active'),
(4, 4, 1, 0, '2026-11-10', '2026-11-17', 'expired'),
(5, 4, 3, 20, '2026-11-10', '2026-11-20', 'active'),
(6, 5, 2, 25, '2026-11-18', '2026-12-18', 'active'),
(7, 1, 1, 0, '2026-10-20', '2026-10-27', 'expired');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meal_planner`
--
ALTER TABLE `meal_planner`
  ADD CONSTRAINT `meal_planner_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `meal_ratings`
--
ALTER TABLE `meal_ratings`
  ADD CONSTRAINT `meal_ratings_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `mess_entries`
--
ALTER TABLE `mess_entries`
  ADD CONSTRAINT `mess_entries_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `meal_packages` (`package_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
