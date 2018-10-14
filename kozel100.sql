-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 12, 2018 at 06:06 PM
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
-- Table structure for table `client_type`
--

CREATE TABLE `client_type` (
  `client_type_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_type`
--

INSERT INTO `client_type` (`client_type_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'sssss', '2018-09-27 16:06:14', '0000-00-00 00:00:00'),
(2, 'sdfsdfsdf', '2018-10-07 10:09:27', '0000-00-00 00:00:00'),
(3, 'Nuovo', '2018-10-07 13:53:37', '0000-00-00 00:00:00'),
(4, 'Super', '2018-10-12 10:59:27', '0000-00-00 00:00:00'),
(5, 'Super', '2018-10-12 10:59:27', '0000-00-00 00:00:00'),
(6, 'Supersss', '2018-10-12 11:00:31', '0000-00-00 00:00:00'),
(7, 'Supersss', '2018-10-12 11:00:31', '0000-00-00 00:00:00'),
(8, 'supersantos', '2018-10-12 11:01:35', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `client_type_id` int(11) NOT NULL,
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

INSERT INTO `company` (`company_id`, `name`, `client_type_id`, `vat`, `address`, `city`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Allegra Garcia', 1, '332323', 'asas', 'sassa', 'ruzyvidufa@mailinator.com', '2018-10-04 07:05:19', '2018-10-07 10:42:45'),
(2, 'Martena Savage', 1, '343434', 'sdfsdf', 'fsdfsdf', 'rityluvo@mailinator.com', '2018-10-04 07:05:48', '2018-10-07 10:42:59'),
(3, 'Hamilton Goodman', 1, '343434', 'sadaddd', 'asdsada', 'rixujymir@mailinator.net', '2018-10-04 07:06:07', '2018-10-07 10:42:53'),
(4, 'Sydnee Cannon', 1, '32424', 'ddd', 'ddddd', 'zyzyxukem@mailinator.net', '2018-10-07 10:26:13', '2018-10-07 10:43:06'),
(5, 'Abra Peters', 1, '1111', 'ddd', 'dddd', 'binelofumo@mailinator.com', '2018-10-07 10:29:00', '2018-10-07 10:43:13'),
(6, 'Adele Hancock', 1, '2222222', 'dfsddsd', 'sdfsdfsd', 'pelipyryze@mailinator.net', '2018-10-07 10:35:01', '2018-10-07 10:43:18'),
(7, 'ZXsxszczd', 1, 'cxczcxxc', 'aaaaa', 'aaaaaa', 'pelipyryze@mailinator.net', '2018-10-07 10:41:19', '2018-10-07 10:41:19'),
(8, 'Prova', 3, '2222', 'Nuoivo', 'fdlk', 'raf@gkjg.com', '2018-10-07 13:54:23', '2018-10-07 13:54:23'),
(9, 'DeMaio', 3, '3333', '33333', 'dfdsfds', 'mykif@mailinator.com', '2018-10-09 10:19:54', '2018-10-09 10:19:54'),
(10, 'Gloria Valentine', 3, '3333', 'fdfdfdf', 'fdfdfdfdf', 'kojap@mailinator.com', '2018-10-12 10:24:05', '2018-10-12 10:24:05'),
(11, 'Shad Chan', 2, 'ghghggh', 'ghghghg', 'ghghgh', 'xerusow@mailinator.com', '2018-10-12 10:40:11', '2018-10-12 10:40:11'),
(12, 'Latifah Hood', 3, '111111', 'jkhkjhkj', 'jkhkjhkjh', 'bubemo@mailinator.com', '2018-10-12 10:41:55', '2018-10-12 10:41:55'),
(13, 'Echo Harrington', 3, '22222', 'sdfsfsdf', 'sdfsdfdf', 'wiwa@mailinator.net', '2018-10-12 10:42:25', '2018-10-12 10:42:25'),
(14, 'Madeline Hebert', 2, '22222', 'fgdfgdfg', 'dfgdfgdf', 'nuqebeqoj@mailinator.com', '2018-10-12 10:54:53', '2018-10-12 10:54:53'),
(15, 'Kylynn Oliver', 3, '11111', 'dffsdf', 'sdfgsdfs', 'vahedot@mailinator.net', '2018-10-12 10:55:21', '2018-10-12 10:55:21'),
(16, 'Finn Santos', 2, 'dffsdf', 'sdfsdfsdf', 'sdfsdf', 'tetybex@mailinator.net', '2018-10-12 10:55:39', '2018-10-12 10:55:39');

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
(15, 'Iona', 'Daugherty', 'hudyte@mailinator.net', '8168486', 1, '2018-10-04 07:05:19', '2018-10-04 07:05:19'),
(16, 'Hayes', 'Ray', 'fovagiduh@mailinator.net', '1939057', 2, '2018-10-04 07:05:48', '2018-10-04 07:05:48'),
(17, 'Jack', 'Sweet', 'hepe@mailinator.com', '8953734', 3, '2018-10-04 07:06:07', '2018-10-04 07:06:07'),
(18, 'Lilah', 'Oconnor', 'xugamynek@mailinator.com', '7932496', 4, '2018-10-07 10:26:13', '2018-10-07 10:26:13'),
(19, 'Dara', 'Jimenez', 'hohizylu@mailinator.com', '555555', 5, '2018-10-07 10:29:00', '2018-10-07 10:29:00'),
(20, 'Samuel', 'Norton', 'mysas@mailinator.com', '222222', 6, '2018-10-07 10:35:01', '2018-10-07 10:35:01'),
(21, 'cccc', 'fdfd', 'fuck@gmail.com', '3333', 7, '2018-10-07 10:41:19', '2018-10-07 10:41:19'),
(22, 'ddfsfs', 'sdffsdf', 'rafffff@raff.it', '3333333', 8, '2018-10-07 13:54:23', '2018-10-07 13:54:23'),
(23, 'Dominic', 'Fowler', 'tose@mailinator.net', '4444444', 9, '2018-10-09 10:19:54', '2018-10-09 10:19:54'),
(24, 'Zenaida', 'Mueller', 'tebozewuz@mailinator.com', '886905', 1, '2018-10-12 09:22:40', '2018-10-12 09:22:40'),
(25, 'Lee', 'Duke', 'gabizo@mailinator.com', '9826468', 5, '2018-10-12 09:26:30', '2018-10-12 09:26:30'),
(26, 'Martina', 'Good', 'gutaxolezi@mailinator.net', '6644466', 10, '2018-10-12 10:24:05', '2018-10-12 10:24:05'),
(27, 'Emily', 'Potter', 'rajuqiky@mailinator.com', '6925335', 11, '2018-10-12 10:40:11', '2018-10-12 10:40:11'),
(28, 'Victoria', 'Cruz', 'xunipes@mailinator.com', '3545419', 12, '2018-10-12 10:41:55', '2018-10-12 10:41:55'),
(29, 'Dominic', 'Santana', 'kedysabowy@mailinator.com', '9319151', 13, '2018-10-12 10:42:25', '2018-10-12 10:42:25'),
(30, 'Sybil', 'Willis', 'vimija@mailinator.com', '5673861', 14, '2018-10-12 10:54:53', '2018-10-12 10:54:53'),
(31, 'Henry', 'Clemons', 'gelubyl@mailinator.net', '5052997', 15, '2018-10-12 10:55:21', '2018-10-12 10:55:21'),
(32, 'Candice', 'Livingston', 'maqoluca@mailinator.com', '8820388', 16, '2018-10-12 10:55:39', '2018-10-12 10:55:39'),
(33, 'Merrill', 'Pruitt', 'qysadu@mailinator.net', '645501', 13, '2018-10-12 11:04:46', '2018-10-12 11:04:46'),
(34, 'Cedric', 'Sutton', 'nukyqi@mailinator.net', '667657', 16, '2018-10-12 11:13:23', '2018-10-12 11:13:23'),
(35, 'Alfonso', 'Soto', 'dukyton@mailinator.net', '77313', 2, '2018-10-12 11:13:57', '2018-10-12 11:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `product_category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'GGGGGG', '2018-10-04 09:52:36', '2018-10-04 09:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `password` varchar(42) NOT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `recruitment_date` date DEFAULT NULL,
  `end_working` date DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `work_field_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `is_admin`, `password`, `first_name`, `last_name`, `recruitment_date`, `end_working`, `phone_number`, `position_id`, `work_field_id`, `created_at`, `updated_at`) VALUES
(1, 'cewug@mailinator.net', 0, 'Pa$$w0rd!', 'Ahmed', 'Guzman', NULL, NULL, NULL, 1, 1, '2018-10-03 13:47:32', '2018-10-03 13:47:32'),
(2, 'silepifoqe@mailinator.com', 0, 'Pa$$w0rd!', 'Abra', 'Rodriguez', NULL, NULL, NULL, 1, 1, '2018-10-03 13:47:42', '2018-10-03 13:47:42'),
(3, 'tija@mailinator.com', 0, 'Pa$$w0rd!', 'Jayme', 'Ryan', NULL, NULL, NULL, 5, 5, '2018-10-03 13:48:15', '2018-10-03 13:48:15'),
(4, 'tija@mailinator.com', 0, 'Pa$$w0rd!', 'Jayme', 'Ryan', NULL, NULL, NULL, 5, 5, '2018-10-03 13:50:39', '2018-10-03 13:50:39'),
(5, 'micobaga@mailinator.com', 0, 'Pa$$w0rd!', 'Lev', 'Ayala', NULL, NULL, NULL, 1, 1, '2018-10-03 13:55:44', '2018-10-03 13:55:44'),
(6, 'rafforx@gmail.com', 0, 'mW/OE3Yu+KcHvJoVCh0Gpw==', 'Raffae;e', 'Galliera', NULL, NULL, NULL, 1, 1, '2018-10-07 20:17:49', '2018-10-07 20:17:49'),
(10, 'wumazajy@mailinator.net', 0, '6RjA0YeAQRaiZANru36n0Q==', 'Veda', 'Waters', NULL, NULL, NULL, 17, 5, '2018-10-10 11:56:00', '2018-10-10 11:56:00'),
(11, 'qypi@mailinator.net', 0, 'FjNwYM+7oIG6IJN6Cfzebw==', 'Abigail', 'Padilla', NULL, NULL, NULL, 19, 3, '2018-10-12 11:33:16', '2018-10-12 11:33:16'),
(12, 'admin@adminovic.it', 0, 'PGytuvRI/Jmicfl8uOgxqQ==', 'Aurora', 'Calderon', NULL, NULL, NULL, 22, 4, '2018-10-12 15:50:46', '2018-10-12 15:50:46'),
(13, 'admin@adminovic.com', 1, 'PGytuvRI/Jmicfl8uOgxqQ==', 'Admin', 'Adminovic', NULL, NULL, NULL, 17, 3, '2018-10-12 16:04:48', '2018-10-12 16:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `work_field`
--

CREATE TABLE `work_field` (
  `work_field_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_field`
--

INSERT INTO `work_field` (`work_field_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'dddd', '2018-09-27 15:58:04', '0000-00-00 00:00:00'),
(2, 'gggg', '2018-09-27 15:58:04', '0000-00-00 00:00:00'),
(3, 'ggggg', '2018-09-27 15:58:04', '0000-00-00 00:00:00'),
(4, 'vcvxcvxc', '2018-09-27 15:58:04', '0000-00-00 00:00:00'),
(5, 'vcvxcvxchhhhccccccccc', '2018-10-05 10:55:33', '2018-10-05 10:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `work_position`
--

CREATE TABLE `work_position` (
  `position_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_position`
--

INSERT INTO `work_position` (`position_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'gggggg', '2018-09-27 15:57:20', '2018-09-27 15:57:20'),
(3, 'asdafg', '2018-09-27 15:57:20', '2018-09-27 15:57:20'),
(5, 'sdasd', '2018-10-10 11:45:21', '2018-10-10 11:45:21'),
(17, 'aaaaffff', '2018-10-09 10:41:58', '2018-10-09 10:41:58'),
(18, NULL, '2018-10-12 11:16:34', '2018-10-12 11:16:34'),
(19, 'rtyhhfghfgh', '2018-10-12 11:16:38', '2018-10-12 11:16:38'),
(20, 'rtyhhfghfgh', '2018-10-12 11:16:38', '2018-10-12 11:16:38'),
(21, 'gfhfghgfh', '2018-10-12 11:16:55', '2018-10-12 11:16:55'),
(22, 'gfhfghgfh', '2018-10-12 11:16:55', '2018-10-12 11:16:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_type`
--
ALTER TABLE `client_type`
  ADD PRIMARY KEY (`client_type_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `client_type_id` (`client_type_id`);

--
-- Indexes for table `contact_person`
--
ALTER TABLE `contact_person`
  ADD PRIMARY KEY (`contact_person_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `work_field_id` (`work_field_id`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexes for table `work_field`
--
ALTER TABLE `work_field`
  ADD PRIMARY KEY (`work_field_id`);

--
-- Indexes for table `work_position`
--
ALTER TABLE `work_position`
  ADD PRIMARY KEY (`position_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_type`
--
ALTER TABLE `client_type`
  MODIFY `client_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `contact_person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `work_field`
--
ALTER TABLE `work_field`
  MODIFY `work_field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `work_position`
--
ALTER TABLE `work_position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`client_type_id`) REFERENCES `client_type` (`client_type_id`);

--
-- Constraints for table `contact_person`
--
ALTER TABLE `contact_person`
  ADD CONSTRAINT `contact_person_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`work_field_id`) REFERENCES `work_field` (`work_field_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `work_position` (`position_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
