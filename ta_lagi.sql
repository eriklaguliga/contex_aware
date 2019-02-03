-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2019 at 03:53 AM
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
  `level_3` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `klasifikasi_level`
--

INSERT INTO `klasifikasi_level` (`email`, `level_1`, `level_2`, `level_3`) VALUES
('admin@gmail.com', 100, 50, 0);

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
  `waktu_akhir` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_context`
--

INSERT INTO `user_context` (`email`, `password`, `latitude`, `longtitude`, `waktu_awal`, `waktu_akhir`) VALUES
('admin@gmail.com', 'admin', '-6.9222', '107.6069', '09:00:00', '17:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boss_name`
--
ALTER TABLE `boss_name`
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
  ADD KEY `email` (`email`);

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `history_score`
--
ALTER TABLE `history_score`
  MODIFY `No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
