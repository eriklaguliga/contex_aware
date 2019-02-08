-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2019 at 08:55 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ta_lagi`
--

-- --------------------------------------------------------

--
-- Table structure for table `boss_name`
--

CREATE TABLE `boss_name` (
  `id` int(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `posisi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `boss_name`
--

INSERT INTO `boss_name` (`id`, `nama`, `email`, `posisi`) VALUES
(1, 'Fikri Attamami Laguliga', 'sabarorang@gmail.com', 'network manager');

-- --------------------------------------------------------

--
-- Table structure for table `history_login`
--

CREATE TABLE `history_login` (
  `id` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_location` varchar(100) NOT NULL,
  `login_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_login`
--

INSERT INTO `history_login` (`id`, `email`, `login_location`, `login_time`) VALUES
(7, 'admin@gmail.com', 'Bandung', '12:59:58'),
(8, 'admin@gmail.com', 'Bandung', '13:01:30'),
(9, 'admin@gmail.com', 'Bandung', '13:09:23'),
(10, 'admin@gmail.com', 'Bandung', '13:16:16'),
(11, 'admin@gmail.com', 'Bandung', '13:17:52'),
(12, 'admin@gmail.com', 'Bandung', '13:26:30'),
(13, 'admin@gmail.com', 'Bandung', '13:28:16'),
(14, 'admin@gmail.com', 'Bandung', '13:31:57'),
(15, 'admin@gmail.com', 'Bandung', '13:41:10'),
(16, 'admin@gmail.com', 'Bandung', '13:42:13'),
(17, 'admin@gmail.com', 'Bandung', '14:49:35'),
(18, 'admin@gmail.com', 'Bandung', '14:50:03'),
(19, 'admin@gmail.com', 'Bandung', '14:57:41'),
(20, 'admin@gmail.com', 'Bandung', '14:57:42'),
(21, 'admin@gmail.com', 'Bandung', '14:57:42'),
(22, 'admin@gmail.com', 'Bandung', '14:57:42'),
(23, 'admin@gmail.com', 'Bandung', '16:29:16'),
(24, 'admin@gmail.com', 'Bandung', '16:44:18'),
(25, 'admin@gmail.com', 'Bandung', '16:45:16'),
(26, 'admin@gmail.com', 'Bandung', '16:46:36'),
(27, 'admin@gmail.com', 'Bandung', '12:38:16'),
(28, 'admin@gmail.com', 'Bandung', '12:42:17'),
(29, 'admin@gmail.com', 'Bandung', '12:42:43'),
(30, 'admin@gmail.com', 'Bandung', '12:43:50'),
(31, 'admin@gmail.com', 'Bandung', '12:44:21'),
(32, 'admin@gmail.com', 'Bandung', '12:44:44'),
(33, 'admin@gmail.com', 'Bandung', '12:45:07'),
(34, 'admin@gmail.com', 'Bandung', '12:46:12'),
(35, 'admin@gmail.com', 'Bandung', '15:36:43'),
(36, 'admin@gmail.com', 'Bandung', '15:39:03'),
(37, 'admin@gmail.com', 'Bandung', '15:48:37'),
(38, 'admin@gmail.com', 'Bandung', '15:50:12'),
(39, 'admin@gmail.com', 'Bandung', '15:55:09'),
(40, 'admin@gmail.com', 'Bandung', '15:55:41'),
(41, 'admin@gmail.com', 'Bandung', '16:04:35'),
(42, 'admin@gmail.com', 'Bandung', '11:34:51'),
(43, 'admin@gmail.com', 'Bandung', '11:37:22'),
(44, 'admin@gmail.com', 'Bandung', '11:42:50'),
(45, 'admin@gmail.com', 'Bandung', '11:50:30'),
(46, 'admin@gmail.com', 'Bandung', '14:09:08'),
(47, 'admin@gmail.com', 'Bandung', '20:54:54'),
(48, 'admin@gmail.com', 'Bandung', '20:56:44'),
(49, 'admin@gmail.com', 'Bandung', '11:29:08'),
(50, 'admin@gmail.com', 'Bandung', '11:30:15'),
(51, 'admin@gmail.com', 'Bandung', '15:01:27'),
(52, 'admin@gmail.com', 'Bandung', '15:05:54'),
(53, 'admin@gmail.com', 'Bandung', '15:07:41'),
(54, 'admin@gmail.com', 'Bandung', '15:08:17'),
(55, 'admin@gmail.com', 'Bandung', '15:08:38'),
(56, 'admin@gmail.com', 'Bandung', '15:32:32'),
(57, 'admin@gmail.com', 'Bandung', '15:36:05'),
(58, 'admin@gmail.com', 'Bandung', '15:46:24'),
(59, 'admin@gmail.com', 'Bandung', '15:48:09'),
(60, 'admin@gmail.com', 'Bandung', '15:52:34'),
(61, 'admin@gmail.com', 'Bandung', '15:54:22'),
(62, 'admin@gmail.com', 'Bandung', '15:54:46'),
(63, 'admin@gmail.com', 'Bandung', '16:01:02'),
(64, 'admin@gmail.com', 'Bandung', '16:02:57'),
(65, 'admin@gmail.com', 'Bandung', '09:25:07'),
(66, 'admin@gmail.com', 'Bandung', '09:25:22'),
(67, 'admin@gmail.com', 'Bandung', '09:25:53'),
(68, 'admin@gmail.com', 'Bandung', '09:43:33'),
(69, 'admin@gmail.com', 'Bandung', '09:44:30'),
(70, 'admin@gmail.com', 'Bandung', '10:30:37'),
(71, 'admin@gmail.com', 'Bandung', '10:33:49'),
(72, 'admin@gmail.com', 'Bandung', '10:34:11'),
(73, 'admin@gmail.com', 'Bandung', '10:36:01'),
(74, 'admin@gmail.com', 'Bandung', '10:36:37'),
(75, 'admin@gmail.com', 'Bandung', '10:38:19'),
(76, 'admin@gmail.com', 'Bandung', '10:38:41'),
(77, 'admin@gmail.com', 'Bandung', '10:39:20'),
(78, 'admin@gmail.com', 'Bandung', '10:42:16'),
(79, 'admin@gmail.com', 'Bandung', '10:46:31'),
(80, 'admin@gmail.com', 'Bandung', '10:47:40'),
(81, 'admin@gmail.com', 'Bandung', '10:49:31'),
(82, 'admin@gmail.com', 'Bandung', '10:50:20'),
(83, 'admin@gmail.com', 'Bandung', '10:50:52'),
(84, 'admin@gmail.com', 'Bandung', '10:52:07'),
(85, 'admin@gmail.com', 'Bandung', '10:52:24'),
(86, 'admin@gmail.com', 'Bandung', '10:59:28'),
(87, 'admin@gmail.com', 'Bandung', '11:02:17'),
(88, 'admin@gmail.com', 'Bandung', '11:03:05'),
(89, 'admin@gmail.com', 'Bandung', '11:03:28'),
(90, 'admin@gmail.com', 'Bandung', '11:12:35'),
(91, 'admin@gmail.com', 'Bandung', '11:13:05'),
(92, 'admin@gmail.com', 'Bandung', '11:21:54'),
(93, 'admin@gmail.com', 'Bandung', '11:23:18'),
(94, 'admin@gmail.com', 'Bandung', '11:23:43'),
(95, 'admin@gmail.com', 'Bandung', '11:24:07'),
(96, 'admin@gmail.com', 'Bandung', '11:24:28'),
(97, 'admin@gmail.com', 'Bandung', '11:25:09'),
(98, 'admin@gmail.com', 'Bandung', '11:25:31'),
(99, 'admin@gmail.com', 'Bandung', '11:25:46'),
(100, 'admin@gmail.com', 'Bandung', '11:25:59'),
(101, 'admin@gmail.com', 'Bandung', '11:28:15'),
(102, 'admin@gmail.com', 'Bandung', '11:28:45'),
(103, 'admin@gmail.com', 'Bandung', '11:29:19'),
(104, 'admin@gmail.com', 'Bandung', '11:29:59'),
(105, 'admin@gmail.com', 'Bandung', '11:30:19'),
(106, 'admin@gmail.com', 'Bandung', '11:31:47'),
(107, 'admin@gmail.com', 'Bandung', '11:32:12'),
(108, 'admin@gmail.com', 'Bandung', '14:21:44'),
(109, 'admin@gmail.com', 'Bandung', '15:45:01'),
(110, 'admin@gmail.com', 'Bandung', '09:54:37'),
(111, 'admin@gmail.com', 'Bandung', '13:52:04'),
(112, 'admin@gmail.com', 'Bandung', '13:52:41'),
(113, 'admin@gmail.com', 'Bandung', '14:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `history_score`
--

CREATE TABLE `history_score` (
  `score_identity` int(100) NOT NULL,
  `score_time` int(100) NOT NULL,
  `score_calender` int(100) NOT NULL,
  `score_lokasi` int(100) NOT NULL,
  `No` int(11) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_score`
--

INSERT INTO `history_score` (`score_identity`, `score_time`, `score_calender`, `score_lokasi`, `No`, `email`) VALUES
(40, 30, 20, 10, 1, 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `klasifikasi_level`
--

CREATE TABLE `klasifikasi_level` (
  `email` varchar(100) NOT NULL,
  `level_1` int(100) NOT NULL,
  `level_2` int(100) NOT NULL,
  `level_3` int(100) NOT NULL,
  `level_4` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `klasifikasi_level`
--

INSERT INTO `klasifikasi_level` (`email`, `level_1`, `level_2`, `level_3`, `level_4`) VALUES
('admin@gmail.com', 100, 80, 41, 0);

-- --------------------------------------------------------

--
-- Table structure for table `otp_history`
--

CREATE TABLE `otp_history` (
  `id` int(11) NOT NULL,
  `otp_kode` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otp_history`
--

INSERT INTO `otp_history` (`id`, `otp_kode`) VALUES
(1, '3508'),
(2, '7702'),
(3, '4165'),
(4, '7788');

-- --------------------------------------------------------

--
-- Table structure for table `user_context`
--

CREATE TABLE `user_context` (
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `latitude` varchar(10000) NOT NULL,
  `longtitude` varchar(10000) NOT NULL,
  `waktu_awal` time NOT NULL,
  `waktu_akhir` time NOT NULL,
  `kota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_context`
--

INSERT INTO `user_context` (`email`, `password`, `latitude`, `longtitude`, `waktu_awal`, `waktu_akhir`, `kota`) VALUES
('admin@gmail.com', 'admin', '-6.9222', '107.6069', '09:00:00', '17:00:00', 'Bandung');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boss_name`
--
ALTER TABLE `boss_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_login`
--
ALTER TABLE `history_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_score`
--
ALTER TABLE `history_score`
  ADD PRIMARY KEY (`No`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `klasifikasi_level`
--
ALTER TABLE `klasifikasi_level`
  ADD PRIMARY KEY (`email`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `otp_history`
--
ALTER TABLE `otp_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_context`
--
ALTER TABLE `user_context`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boss_name`
--
ALTER TABLE `boss_name`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `history_login`
--
ALTER TABLE `history_login`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `history_score`
--
ALTER TABLE `history_score`
  MODIFY `No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `otp_history`
--
ALTER TABLE `otp_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history_score`
--
ALTER TABLE `history_score`
  ADD CONSTRAINT `history_score_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user_context` (`email`);

--
-- Constraints for table `klasifikasi_level`
--
ALTER TABLE `klasifikasi_level`
  ADD CONSTRAINT `klasifikasi_level_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user_context` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
