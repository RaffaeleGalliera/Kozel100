-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 19, 2018 at 02:38 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

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
(4, 'Buffone', '2018-10-15 13:42:48', '0000-00-00 00:00:00');

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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active_fl` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `name`, `client_type_id`, `vat`, `address`, `city`, `email`, `created_at`, `updated_at`, `active_fl`, `user_id`) VALUES
(1, 'Allegra Garcia', 4, '3323231', 'agagaa', 'sassa', 'ruzyvidufab@mailinator.com', '2018-10-04 07:05:19', '2018-10-19 08:14:03', 1, 11),
(2, 'Martena Savage', 1, '343434', 'sdfsdf', 'fsdfsdf', 'rityluvo@mailinator.com', '2018-10-04 07:05:48', '2018-10-19 08:15:14', 0, NULL),
(3, 'Hamilton Goodman', 1, '343434', 'sadaddd', 'asdsada', 'rixujymir@mailinator.net', '2018-10-04 07:06:07', '2018-10-07 10:42:53', 1, NULL),
(4, 'Sydnee Cannon', 1, '32424', 'ddd', 'ddddd', 'zyzyxukem@mailinator.net', '2018-10-07 10:26:13', '2018-10-07 10:43:06', 1, NULL),
(5, 'Abra Petersa', 3, '1111', 'ddd', 'dddd', 'binelofumo@mailinator.com', '2018-10-07 10:29:00', '2018-10-18 14:18:04', 1, NULL),
(6, 'Adele Hancock', 1, '2222222', 'dfsddsd', 'sdfsdfsd', 'pelipyryze@mailinator.net', '2018-10-07 10:35:01', '2018-10-18 14:17:49', 0, NULL),
(7, 'ZXsxszczd', 1, 'cxczcxxc', 'aaaaa', 'aaaaaa', 'pelipyryze@mailinator.net', '2018-10-07 10:41:19', '2018-10-17 09:41:18', 0, NULL),
(8, 'Prova', 3, '2222', 'Nuoivo', 'fdlk', 'raf@gkjg.com', '2018-10-07 13:54:23', '2018-10-17 09:39:23', 0, NULL),
(9, 'DeMaio', 4, '3333', '33333', 'dfdsfds', 'mykif@mailinator.com', '2018-10-09 10:19:54', '2018-10-17 09:21:49', 0, 11),
(10, 'Leah Marks', 4, '2132132', 'fddsd', 'sfsdfsd', 'sywas@mailinator.com', '2018-10-19 09:49:26', '2018-10-19 09:49:26', 1, NULL),
(11, 'Giorgionapo', 1, '3333', 'lkjjlkj', 'lkjklj', 'rrr@ddd.com', '2018-10-19 09:55:42', '2018-10-19 09:55:42', 1, NULL),
(12, 'Garrison Baird', 3, '3333', 'sdsasda', 'sddsdsd', 'qafesibony@mailinator.net', '2018-10-19 09:57:45', '2018-10-19 09:57:45', 1, NULL),
(13, 'Balto', 3, '1234', 'sesso', 'palle', 'cane@senza.palle', '2018-10-19 12:50:46', '2018-10-19 12:50:46', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_product`
--

CREATE TABLE `company_product` (
  `id` int(11) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_product`
--

INSERT INTO `company_product` (`id`, `company_id`, `product_category_id`) VALUES
(1, 9, 2),
(2, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `consulting_service`
--

CREATE TABLE `consulting_service` (
  `consulting_service_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_fl` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consulting_service`
--

INSERT INTO `consulting_service` (`consulting_service_id`, `name`, `active_fl`, `created_at`, `updated_at`) VALUES
(1, 'Ciao', 1, '2018-10-19 13:53:28', '2018-10-19 13:53:28'),
(2, 'Pippo', 1, '2018-10-19 13:57:33', '2018-10-19 13:57:33');

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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active_fl` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_person`
--

INSERT INTO `contact_person` (`contact_person_id`, `first_name`, `last_name`, `email`, `phone_number`, `company_id`, `created_at`, `updated_at`, `active_fl`) VALUES
(15, 'Iona', 'Daugherty', 'hudyte@mailinator.net', '8168486', 1, '2018-10-04 07:05:19', '2018-10-04 07:05:19', 1),
(16, 'Hayes', 'Ray', 'fovagiduh@mailinator.net', '1939057', 2, '2018-10-04 07:05:48', '2018-10-19 08:15:14', 0),
(17, 'Jack', 'Sweet', 'hepe@mailinator.com', '8953734', 3, '2018-10-04 07:06:07', '2018-10-04 07:06:07', 1),
(18, 'Lilah', 'Oconnor', 'xugamynek@mailinator.com', '7932496', 4, '2018-10-07 10:26:13', '2018-10-07 10:26:13', 1),
(19, 'Dara', 'Jimenez', 'hohizylu@mailinator.com', '555555', 5, '2018-10-07 10:29:00', '2018-10-07 10:29:00', 1),
(20, 'Samuel', 'Norton', 'mysas@mailinator.com', '222222', 6, '2018-10-07 10:35:01', '2018-10-18 14:17:49', 0),
(21, 'cccc', 'fdfd', 'fuck@gmail.com', '3333', 7, '2018-10-07 10:41:19', '2018-10-17 09:41:18', 0),
(22, 'ddfsfs', 'sdffsdf', 'rafffff@raff.it', '3333333', 8, '2018-10-07 13:54:23', '2018-10-17 09:39:23', 0),
(23, 'Dominic', 'Fowler', 'tose@mailinator.net', '4444444', 9, '2018-10-09 10:19:54', '2018-10-17 09:21:49', 0),
(24, 'Lisandra', 'Padilla', 'nizaky@mailinator.com', '1476444', 1, '2018-10-19 08:23:37', '2018-10-19 08:23:37', 1),
(25, 'Gwendolyn', 'Christian', 'rekefukan@mailinator.net', '5699243', 10, '2018-10-19 09:49:26', '2018-10-19 09:49:26', 1),
(26, 'asdsad', 'sddd', 'eddd@re.er', '33333', 11, '2018-10-19 09:55:42', '2018-10-19 09:55:42', 1),
(27, 'Nicole', 'Simpson', 'zuhi@mailinator.com', '197375', 12, '2018-10-19 09:57:45', '2018-10-19 09:57:45', 1),
(28, 'Balto', 'Cappon', 'matssd@gmail.cazzo', '3345678', 13, '2018-10-19 12:50:46', '2018-10-19 12:50:46', 1);

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
(1, 'GGGGGG', '2018-10-04 09:52:36', '2018-10-04 09:52:36'),
(2, 'Cazzi di Gomma', '2018-10-15 10:59:42', '2018-10-15 10:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(42) NOT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `recruitment_date` date DEFAULT NULL,
  `end_working` date DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `work_field_id` int(11) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `first_name`, `last_name`, `recruitment_date`, `end_working`, `phone_number`, `position_id`, `work_field_id`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 'cewug@mailinator.net', 'Pa$$w0rd!', 'Ahmed', 'Guzman', NULL, NULL, NULL, 1, 1, 0, '2018-10-03 13:47:32', '2018-10-03 13:47:32'),
(2, 'silepifoqe@mailinator.com', 'Pa$$w0rd!', 'Abra', 'Rodriguez', NULL, NULL, NULL, 1, 1, 0, '2018-10-03 13:47:42', '2018-10-03 13:47:42'),
(3, 'tija@mailinator.com', 'Pa$$w0rd!', 'Jayme', 'Ryan', NULL, NULL, NULL, 5, 5, 0, '2018-10-03 13:48:15', '2018-10-03 13:48:15'),
(4, 'tija@mailinator.com', 'Pa$$w0rd!', 'Jayme', 'Ryan', NULL, NULL, NULL, 5, 5, 0, '2018-10-03 13:50:39', '2018-10-03 13:50:39'),
(5, 'micobaga@mailinator.com', 'Pa$$w0rd!', 'Lev', 'Ayala', NULL, NULL, NULL, 1, 1, 0, '2018-10-03 13:55:44', '2018-10-03 13:55:44'),
(6, 'rafforx@gmail.com', 'mW/OE3Yu+KcHvJoVCh0Gpw==', 'Raffae;e', 'Galliera', NULL, NULL, NULL, 1, 1, 0, '2018-10-07 20:17:49', '2018-10-07 20:17:49'),
(10, 'wumazajy@mailinator.net', '6RjA0YeAQRaiZANru36n0Q==', 'Veda', 'Waters', NULL, NULL, NULL, 17, 5, 0, '2018-10-10 11:56:00', '2018-10-10 11:56:00'),
(11, 'cappun@me.com', 'egXzw2hDiTqHGeIXHQkcpQ==', 'Matteo', 'Cappon', NULL, NULL, NULL, 1, 1, 0, '2018-10-11 15:58:47', '2018-10-11 15:58:47'),
(12, 'muigi@gov.5s', 'IyDBZt1kNEmzKp51YWKYSQ==', 'Luigi', 'Di Maio', NULL, NULL, NULL, 22, 6, 0, '2018-10-12 07:13:04', '2018-10-12 07:13:04'),
(13, 'cappun@me.com', '2IUr3i1lOo8KDJZ+ytmUlA==', 'awef', 'awef', NULL, NULL, NULL, 1, 1, 0, '2018-10-15 10:29:48', '2018-10-15 10:29:48');

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
(5, 'vcvxcvxchhhhccccccccc', '2018-10-05 10:55:33', '2018-10-05 10:55:33'),
(6, 'Satana', '2018-10-12 07:12:18', '2018-10-12 07:12:18');

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
(21, NULL, '2018-10-12 07:11:51', '2018-10-12 07:11:51'),
(22, 'Ministro dello sviluppo economico', '2018-10-12 07:12:08', '2018-10-12 07:12:08'),
(23, NULL, '2018-10-12 10:28:42', '2018-10-12 10:28:42'),
(24, NULL, '2018-10-15 10:29:06', '2018-10-15 10:29:06'),
(25, 'Nuovo', '2018-10-15 10:29:17', '2018-10-15 10:29:17');

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
  ADD KEY `client_type_id` (`client_type_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `company_product`
--
ALTER TABLE `company_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_category_id` (`product_category_id`);

--
-- Indexes for table `consulting_service`
--
ALTER TABLE `consulting_service`
  ADD PRIMARY KEY (`consulting_service_id`);

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
  MODIFY `client_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company_product`
--
ALTER TABLE `company_product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `consulting_service`
--
ALTER TABLE `consulting_service`
  MODIFY `consulting_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `contact_person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `work_field`
--
ALTER TABLE `work_field`
  MODIFY `work_field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `work_position`
--
ALTER TABLE `work_position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`client_type_id`) REFERENCES `client_type` (`client_type_id`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company_product`
--
ALTER TABLE `company_product`
  ADD CONSTRAINT `company_product_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_product_ibfk_2` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
