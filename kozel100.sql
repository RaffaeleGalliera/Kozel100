-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 24, 2018 at 05:39 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kozel100`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `vat` varchar(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `name`, `vat`, `address`, `city`, `email`, `created_at`, `updated_at`) VALUES
(1, 'sssss', 'cxczcxxc', 'aaaaa', 'czcxczcxzx', 'czcxccxccz', '2018-09-23 15:27:24', '2018-09-23 15:27:24'),
(2, NULL, NULL, NULL, NULL, NULL, '2018-09-23 15:31:48', '2018-09-23 15:31:48'),
(3, 'ZXsxszczd', 'aaaa', 'ccxczczx', 'ggg', 'fsdfsdf', '2018-09-23 15:32:00', '2018-09-23 15:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact_person`
--

CREATE TABLE `contact_person` (
  `contact_person_id` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_person`
--

INSERT INTO `contact_person` (`contact_person_id`, `first_name`, `last_name`, `email`, `phone_number`, `company_id`, `created_at`, `updated_at`) VALUES
(3, 'dfgdfgd', 'vbvbv', 'bcdfggdgf', '3333', 1, '2018-09-24 15:35:32', '2018-09-24 15:35:32'),
(4, 'dfsf', 'dfdf', 'sdsadad', '3333', 1, '2018-09-24 15:35:38', '2018-09-24 15:35:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `contact_person`
--
ALTER TABLE `contact_person`
  ADD PRIMARY KEY (`contact_person_id`),
  ADD KEY `company_id` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `contact_person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_person`
--
ALTER TABLE `contact_person`
  ADD CONSTRAINT `contact_person_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
