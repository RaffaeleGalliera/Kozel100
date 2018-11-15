-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 12, 2018 at 12:18 PM
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
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_user`
--

CREATE TABLE `appointment_user` (
  `appointment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `audit_log_id` int(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `requested_resource` varchar(100) NOT NULL,
  `method` varchar(4) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `details` varchar(500) NOT NULL,
  `action` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`audit_log_id`, `user_email`, `company_name`, `requested_resource`, `method`, `ip`, `details`, `action`, `created_at`) VALUES
(1, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-09 22:39:53'),
(2, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-09 22:39:54'),
(3, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-09 22:39:55'),
(4, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-09 22:40:02'),
(5, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-09 22:40:06'),
(6, 'cappun@me.com', 'Allegra Garcia', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'name : Allegra Garciavat : 12345678984companyStartDate : 2018-11-08companyEmail : ruzyvidufab@mailinator.comclientTypeId : 4productCategoryId : 1userId : 11country : Italystate : Emilia-Romagnacity : Horselandzip : 44124address : Via dei cavallifirstName : LisandralastName : PadillaphoneNumber : +393925421638contactEmail : nizaky@mailinator.comcompanyId : 1', 'updateCompany', '2018-11-09 22:41:21'),
(7, 'cappun@me.com', 'Allegra Garcia', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'name : Allegra Garciavat : 12345678984companyStartDate : 2018-11-08companyEmail : ruzyvidufab@mailinator.comclientTypeId : 4productCategoryId : 1userId : 11country : Italystate : Emilia-Romagnacity : Horselandzip : 44124address : Via dei cavallifirstName : LisandralastName : PadillaphoneNumber : +393925421638contactEmail : nizaky@mailinator.comcompanyId : 1', 'updateCompany', '2018-11-09 22:41:39'),
(8, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-09 22:41:51'),
(9, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-09 22:42:10'),
(10, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'selectedFields : nameselectedCompanies : 1', 'exportCompanies', '2018-11-09 22:42:21'),
(11, 'cappun@me.com', 'Allegra Garcia', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'name : Allegra Garciavat : 12345678985companyStartDate : 2018-11-08companyEmail : ruzyvidufab@mailinator.comclientTypeId : 4productCategoryId : 1userId : 11country : Italystate : Emilia-Romagnacity : Horselandzip : 44124address : Via dei cavallifirstName : LisandralastName : PadillaphoneNumber : +393925421638contactEmail : nizaky@mailsinator.comcompanyId : 1', 'updateCompany', '2018-11-09 22:45:11'),
(12, 'cappun@me.com', 'Allegra Garcia', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 1', 'view', '2018-11-09 22:45:19'),
(13, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-09 22:45:28'),
(14, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-09 22:45:30'),
(15, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 10:53:33'),
(16, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 10:53:37'),
(17, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 10:53:51'),
(18, 'cappun@me.com', 'Martena Savage', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'deleteCompany', '2018-11-10 10:54:02'),
(19, 'cappun@me.com', 'Hamilton Goodman', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 3', 'deleteCompany', '2018-11-10 10:54:03'),
(20, 'cappun@me.com', 'Sydnee Cannon', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 4', 'deleteCompany', '2018-11-10 10:54:05'),
(21, 'cappun@me.com', 'Abra Petersa', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 5', 'deleteCompany', '2018-11-10 10:54:07'),
(22, 'cappun@me.com', 'Adele Hancock', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 6', 'deleteCompany', '2018-11-10 10:54:09'),
(23, 'cappun@me.com', 'CacioCavalloSRL', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 7', 'deleteCompany', '2018-11-10 10:54:12'),
(24, 'cappun@me.com', 'Prova', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 8', 'deleteCompany', '2018-11-10 10:54:14'),
(25, 'cappun@me.com', 'DiMaio', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 9', 'deleteCompany', '2018-11-10 10:54:15'),
(26, 'cappun@me.com', 'Leah Marks', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 10', 'deleteCompany', '2018-11-10 10:54:18'),
(27, 'cappun@me.com', 'Napo Orso Capo', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 11', 'deleteCompany', '2018-11-10 10:54:19'),
(28, 'cappun@me.com', 'Garrison Baird', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 12', 'deleteCompany', '2018-11-10 10:54:21'),
(29, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'name : McKenzievat : 12345678912companyStartDate : 2018-11-09companyEmail : fuck@gmail.comclientTypeId : 1productCategoryId : 1userId : 1country : Bangladeshstate : Rangamaticity : PaneLandzip : 12346address : Via del Pane 8firstName : FelicialastName : BurtphoneNumber : +393925421638contactEmail : begaqizy@mailinator.net', 'insertCompany', '2018-11-10 10:56:11'),
(30, 'cappun@me.com', 'Allegra Garcia', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 1', 'deleteCompany', '2018-11-10 10:56:17'),
(31, 'cappun@me.com', 'Allegra Garcia', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'companyId : 1', 'deleteCompany', '2018-11-10 12:07:22'),
(32, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 12:07:24'),
(33, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 12:08:56'),
(34, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:08:59'),
(35, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 12:09:00'),
(36, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:09:17'),
(37, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 12:09:18'),
(38, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'tagIds : 3companyId : 2', 'addTag', '2018-11-10 12:09:42'),
(39, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:09:49'),
(40, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:09:51'),
(41, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:10:44'),
(42, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:10:49'),
(43, 'cappun@me.com', 'McKenzie', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'name : McKenzievat : 12345678912companyStartDate : 2018-11-09companyEmail : fuck@gmail.comclientTypeId : 1productCategoryId : 1userId : 1country : Bangladeshstate : Rangamaticity : PaneLand 9zip : 12346address : Via del Pane 8firstName : FelicialastName : BurtphoneNumber : +393925421638contactEmail : begaqizy@mailinator.netcompanyId : 2', 'updateCompany', '2018-11-10 12:11:04'),
(44, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:11:46'),
(45, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 12:11:47'),
(46, 'cappun@me.com', 'McKenzie', '/Company/ViewCompanies.jsp', 'POST', '127.0.0.1', 'name : McKenzievat : 12345678912companyStartDate : 2018-11-09companyEmail : fuck@gmail.comclientTypeId : 1productCategoryId : 1userId : 1country : Bangladeshstate : Rangamaticity : PaneLand 9zip : 12346address : Via del Pane 8firstName : FelicialastName : BurtaphoneNumber : +393925421638contactEmail : begaqizy@mailinator.netcompanyId : 2', 'updateCompany', '2018-11-10 12:12:01'),
(47, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 12:12:09'),
(48, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:12:20'),
(49, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:12:22'),
(50, 'cappun@me.com', 'McKenzie', '/Agenda.jsp', 'POST', '127.0.0.1', 'companyId : 2appointmentDate : 2018-11-14appointmentTime : 7:30amappointmentNote : CIaoneuserIds : 2appointmentUserId : 11', 'addAppointment', '2018-11-10 12:12:38'),
(51, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:12:42'),
(52, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:13:34'),
(53, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:13:36'),
(54, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:13:43'),
(55, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:13:45'),
(56, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:13:48'),
(57, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:15:33'),
(58, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:15:34'),
(59, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:15:36'),
(60, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:16:52'),
(61, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:17:49'),
(62, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:17:56'),
(63, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:18:40'),
(64, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:20:30'),
(65, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:20:33'),
(66, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:20:42'),
(67, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:20:54'),
(68, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:20:55'),
(69, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:23:00'),
(70, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:23:07'),
(71, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:23:12'),
(72, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:24:05'),
(73, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:24:06'),
(74, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:24:07'),
(75, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:24:11'),
(76, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:24:13'),
(77, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:24:16'),
(78, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:24:20'),
(79, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:24:21'),
(80, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:24:27'),
(81, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:24:29'),
(82, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:26:10'),
(83, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:26:14'),
(84, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:26:17'),
(85, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:26:22'),
(86, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:26:25'),
(87, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:27:02'),
(88, 'cappun@me.com', 'None', '/Company/assets/css/material-dashboard.css', 'GET', '127.0.0.1', 'v : 2.1.0', 'view', '2018-11-10 12:27:03'),
(89, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:27:14'),
(90, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:27:17'),
(91, 'cappun@me.com', 'None', '/Company/assets/css/material-dashboard.css', 'GET', '127.0.0.1', 'v : 2.1.0', 'view', '2018-11-10 12:27:17'),
(92, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:27:20'),
(93, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:27:21'),
(94, 'cappun@me.com', 'None', '/Company/assets/css/material-dashboard.css', 'GET', '127.0.0.1', 'v : 2.1.0', 'view', '2018-11-10 12:27:21'),
(95, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:28:17'),
(96, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:28:18'),
(97, 'cappun@me.com', 'None', '/Company/assets/css/material-dashboard.css', 'GET', '127.0.0.1', 'v : 2.1.0', 'view', '2018-11-10 12:28:19'),
(98, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:28:27'),
(99, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:28:48'),
(100, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:28:50'),
(101, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:28:54'),
(102, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:28'),
(103, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:36'),
(104, 'cappun@me.com', 'None', '/Admin/assets/css/material-dashboard.css', 'GET', '127.0.0.1', 'v : 2.1.0', 'view', '2018-11-10 12:53:36'),
(105, 'cappun@me.com', 'None', '/Admin/assets/img/apple-icon.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:37'),
(106, 'cappun@me.com', 'None', '/Admin/assets/img/favicon.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:37'),
(107, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:52'),
(108, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:53'),
(109, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:54'),
(110, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:56'),
(111, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:59'),
(112, 'cappun@me.com', 'None', '/Admin/assets/css/material-dashboard.css', 'GET', '127.0.0.1', 'v : 2.1.0', 'view', '2018-11-10 12:53:59'),
(113, 'cappun@me.com', 'None', '/Admin/assets/img/apple-icon.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:59'),
(114, 'cappun@me.com', 'None', '/Admin/assets/img/favicon.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:53:59'),
(115, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:54:32'),
(116, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:54:34'),
(117, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:54:53'),
(118, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:54:55'),
(119, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:55:16'),
(120, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:55:19'),
(121, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:55:20'),
(122, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:56:32'),
(123, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:56:37'),
(124, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:56:44'),
(125, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:56:48'),
(126, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:57:17'),
(127, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:57:19'),
(128, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:58:13'),
(129, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:58:15'),
(130, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:58:16'),
(131, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 12:58:23'),
(132, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:00:55'),
(133, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:01:11'),
(134, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:32'),
(135, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:34'),
(136, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:34'),
(137, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:34'),
(138, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:44'),
(139, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:47'),
(140, 'cappun@me.com', 'None', '/Admin/Audit.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:49'),
(141, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:52'),
(142, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:54'),
(143, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:54'),
(144, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:05:54'),
(145, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 13:05:55'),
(146, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:06:42'),
(147, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:06:42'),
(148, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:06:42'),
(149, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:06:44'),
(150, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:06:44'),
(151, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:06:44'),
(152, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:06:46'),
(153, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:06:47'),
(154, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:06:47'),
(155, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:06:47'),
(156, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 13:07:04'),
(157, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:07:07'),
(158, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:07:08'),
(159, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:07:08'),
(160, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 13:07:12'),
(161, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:07:13'),
(162, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:14:35'),
(163, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:14:38'),
(164, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:14:38'),
(165, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:14:38'),
(166, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:14:39'),
(167, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:16'),
(168, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:19'),
(169, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:19'),
(170, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:19'),
(171, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 13:15:21'),
(172, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:34'),
(173, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:38'),
(174, 'cappun@me.com', 'None', '/Admin/Audit.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:42'),
(175, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:44'),
(176, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:45'),
(177, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:45'),
(178, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 13:15:45'),
(179, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 13:15:54'),
(180, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:01:21'),
(181, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:01:41'),
(182, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:01:41'),
(183, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:01:41'),
(184, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:01:42'),
(185, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:01:57'),
(186, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:01:58'),
(187, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:01:58'),
(188, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:01:58'),
(189, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:02:00'),
(190, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:03:45'),
(191, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:03:48'),
(192, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:04:19'),
(193, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:04:19'),
(194, 'cappun@me.com', 'None', '/Company/resources/logoS.png', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:04:19'),
(195, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:05:33'),
(196, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:05:35'),
(197, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:06:08'),
(198, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:06:09'),
(199, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:06:25'),
(200, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:06:35'),
(201, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'reason : Affari conversationDate : 2018-11-08companyId : 2conversationUserId : 11', 'addConversation', '2018-11-10 14:06:58'),
(202, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'conversationId : 2title : Penso chenote : hhjhjjcompanyId : 2companyNoteId : conversationNoteUserId : 11', 'addNote', '2018-11-10 14:07:06'),
(203, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'purchasedServiceId : 1purchaseDate : 2018-11-06startDate : 2018-11-21companyId : 2', 'purchaseService', '2018-11-10 14:07:18'),
(204, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'proposalName : DarylproposalDescription : bellacommercialProposalUserId : 11companyId : 2', 'addCommercialProposal', '2018-11-10 14:07:26'),
(205, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:08:08'),
(206, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:08:09'),
(207, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:08:10'),
(208, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:08:20'),
(209, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'proposalName : DarylproposalDescription : bellacommercialProposalUserId : 11companyId : 2', 'addCommercialProposal', '2018-11-10 14:08:27'),
(210, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:09:03'),
(211, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:09:04'),
(212, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:09:06'),
(213, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'proposalName : DarylproposalDescription : bellacommercialProposalUserId : 11companyId : 2', 'addCommercialProposal', '2018-11-10 14:09:11'),
(214, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'proposalStatus : ACCEPTEDproposalName : DarylproposalDescription : bellacompanyId : 2commercialProposalId : 1', 'updateCommercialProposal', '2018-11-10 14:10:04'),
(215, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'proposalStatus : REJECTEDproposalName : DarylproposalDescription : bellacompanyId : 2commercialProposalId : 1', 'updateCommercialProposal', '2018-11-10 14:10:12'),
(216, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'proposalStatus : ACCEPTEDproposalName : DarylproposalDescription : bellacompanyId : 2commercialProposalId : 1', 'updateCommercialProposal', '2018-11-10 14:10:16'),
(217, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:10:19'),
(218, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:16:22'),
(219, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:16:27'),
(220, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:16:28'),
(221, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:17:15'),
(222, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:17:16'),
(223, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:17:18'),
(224, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:17:20'),
(225, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:17:30'),
(226, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:17:31'),
(227, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:18:13'),
(228, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:18:15'),
(229, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:18:19'),
(230, 'cappun@me.com', 'McKenzie', '/Agenda.jsp', 'POST', '127.0.0.1', 'companyId : 2appointmentDate : 2018-11-14appointmentTime : 7:30amappointmentNote : fghhhappointmentUserId : 11', 'addAppointment', '2018-11-10 14:18:40'),
(231, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:19:07'),
(232, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:19:14'),
(233, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:24:29'),
(234, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:24:30'),
(235, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:24:30'),
(236, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:24:31'),
(237, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:24:35'),
(238, 'cappun@me.com', 'McKenzie', '/Agenda.jsp', 'POST', '127.0.0.1', 'companyId : 2appointmentDate : 2018-11-22appointmentTime : 7:30amappointmentNote : hhhappointmentUserId : 11', 'addAppointment', '2018-11-10 14:24:45'),
(239, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:25:22'),
(240, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:25:23'),
(241, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:25:24'),
(242, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:25:27'),
(243, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:25:29'),
(244, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:25:35'),
(245, 'cappun@me.com', 'McKenzie', '/Agenda.jsp', 'POST', '127.0.0.1', 'companyId : 2appointmentDate : 2018-11-24appointmentTime : 7:30amappointmentNote : hjhjjhappointmentUserId : 11', 'addAppointment', '2018-11-10 14:25:46'),
(246, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:26:38'),
(247, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:26:50'),
(248, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:27:33'),
(249, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:27:37'),
(250, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:27:43'),
(251, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:29:27'),
(252, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:29:28'),
(253, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:29:29'),
(254, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:29:30'),
(255, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:29:33'),
(256, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:29:42'),
(257, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'appointmentDate : 2018-11-10appointmentTime : 7:30amappointmentNote : hhhcompanyId : 2appointmentUserId : 11', 'addAppointment', '2018-11-10 14:29:56'),
(258, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:30:17'),
(259, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:51:34'),
(260, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:51:35'),
(261, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:51:36'),
(262, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:52:00'),
(263, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:52:05'),
(264, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:52:47'),
(265, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:53:27'),
(266, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:53:28'),
(267, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:53:28'),
(268, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:55:23'),
(269, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:55:25'),
(270, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:55:27'),
(271, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:55:41'),
(272, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:56:14'),
(273, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:56:15'),
(274, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:56:15'),
(275, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:56:18'),
(276, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:56:21'),
(277, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:56:23'),
(278, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:56:50'),
(279, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:56:51'),
(280, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:58:28'),
(281, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:58:32'),
(282, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:58:44'),
(283, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:58:46'),
(284, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:58:48'),
(285, 'cappun@me.com', 'McKenzie', '/Company/ViewCompany.jsp', 'POST', '127.0.0.1', 'companyId : 2', 'view', '2018-11-10 14:58:50'),
(286, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-10 14:58:57'),
(287, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:19:47'),
(288, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:19:48'),
(289, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:19:49'),
(290, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:19:51'),
(291, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:19:55'),
(292, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:19:56'),
(293, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:19:58'),
(294, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:19:59'),
(295, 'cappun@me.com', 'None', '/Company/ViewCompanies.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:20:02'),
(296, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:20:16'),
(297, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 10:20:30'),
(298, 'cappun@me.com', 'None', '/Agenda.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:09:37'),
(299, 'cappun@me.com', 'None', '/Admin/Audit.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:09:39'),
(300, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:09:40'),
(301, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:10:19'),
(302, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:10:20'),
(303, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:10:22'),
(304, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:10:29'),
(305, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:10:32'),
(306, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:11:42'),
(307, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:11:44'),
(308, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:11:45'),
(309, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:12:41'),
(310, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:13:31'),
(311, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:15:11'),
(312, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:15:12'),
(313, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:15:13'),
(314, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:15:18'),
(315, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:15:19'),
(316, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:15:23'),
(317, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:16:53'),
(318, 'Not Logged', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:16:54'),
(319, 'cappun@me.com', 'None', '/', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:16:55'),
(320, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:17:16'),
(321, 'cappun@me.com', 'None', '/Admin/AdminPanel.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:17:19'),
(322, 'cappun@me.com', 'None', '/Dashboard.jsp', 'GET', '127.0.0.1', '', 'view', '2018-11-12 11:17:28');

-- --------------------------------------------------------

--
-- Table structure for table `client_type`
--

CREATE TABLE `client_type` (
  `client_type_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_type`
--

INSERT INTO `client_type` (`client_type_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Loyal', '2018-11-12 10:05:26', '0000-00-00 00:00:00'),
(2, 'New', '2018-11-12 10:05:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `commercial_proposal`
--

CREATE TABLE `commercial_proposal` (
  `commercial_proposal_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active_fl` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `client_type_id` int(11) NOT NULL,
  `vat` varchar(11) NOT NULL,
  `start_date` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(60) NOT NULL,
  `zip_code` int(10) NOT NULL DEFAULT '44124',
  `country` varchar(50) NOT NULL DEFAULT 'Italy',
  `state` varchar(50) NOT NULL DEFAULT 'Emilia-Romagna',
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active_fl` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_tag`
--

CREATE TABLE `company_tag` (
  `company_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'Training Agile', 1, '2018-11-12 10:07:28', '2018-11-12 10:07:28'),
(2, 'Business Process', 1, '2018-11-12 10:08:09', '2018-11-12 10:08:09'),
(3, 'Advisory', 1, '2018-11-12 10:08:09', '2018-11-12 10:08:09');

-- --------------------------------------------------------

--
-- Table structure for table `contact_person`
--

CREATE TABLE `contact_person` (
  `contact_person_id` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active_fl` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `reason` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conversation_note`
--

CREATE TABLE `conversation_note` (
  `conversation_note_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `conversation_id` int(11) NOT NULL,
  `active_fl` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flyway_schema_history`
--

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flyway_schema_history`
--

INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(1, '1', 'Base version', 'SQL', 'V1__Base_version.sql', -322072636, 'root', '2018-11-09 22:39:05', 694, 1),
(2, '2', 'Conversation and tag', 'SQL', 'V2__Conversation_and_tag.sql', -260328813, 'root', '2018-11-09 22:39:05', 498, 1),
(3, '2.1', 'Conversation Note UserId Fk', 'SQL', 'V2.1__Conversation_Note_UserId_Fk.sql', -1336157414, 'root', '2018-11-09 22:39:05', 132, 1),
(4, '2.2', 'Add time to appointment', 'SQL', 'V2.2__Add_time_to_appointment.sql', 1755058639, 'root', '2018-11-09 22:39:05', 24, 1),
(5, '3', 'Proposal and purchase', 'SQL', 'V3__Proposal_and_purchase.sql', 801620664, 'root', '2018-11-09 22:39:05', 116, 1),
(6, '3.0.1', 'Modify id name', 'SQL', 'V3.0.1__Modify_id_name.sql', -1297055543, 'root', '2018-11-09 22:39:05', 3, 1),
(7, '3.1', 'Proposal service', 'SQL', 'V3.1__Proposal_service.sql', -642314759, 'root', '2018-11-09 22:39:06', 69, 1),
(8, '3.1.1', 'Little Upgrade', 'SQL', 'V3.1.1__Little_Upgrade.sql', 1316650414, 'root', '2018-11-09 22:39:06', 65, 1),
(9, '3.1.2', 'AddedActiveFlToSomeTables', 'SQL', 'V3.1.2__AddedActiveFlToSomeTables.sql', -929122320, 'root', '2018-11-09 22:39:06', 24, 1),
(10, '3.1.3', 'DeletedDBConstraints', 'SQL', 'V3.1.3__DeletedDBConstraints.sql', -1449042492, 'root', '2018-11-09 22:39:06', 54, 1),
(11, '3.2', 'added PENDING default to proposal status', 'SQL', 'V3.2__added_PENDING_default_to_proposal_status.sql', 270043889, 'root', '2018-11-09 22:39:06', 26, 1),
(12, '3.2.1', 'active fl to proposal', 'SQL', 'V3.2.1__active_fl_to_proposal.sql', -1628818953, 'root', '2018-11-09 22:39:06', 24, 1),
(13, '3.3', 'audit log', 'SQL', 'V3.3__audit_log.sql', 1287676063, 'root', '2018-11-09 22:39:06', 55, 1),
(14, '3.3.1', 'Adding Company Attributes', 'SQL', 'V3.3.1__Adding_Company_Attributes.sql', -2086081775, 'root', '2018-11-09 22:39:06', 73, 1),
(15, '4', 'Add UserId To CommerciaProposal', 'SQL', 'V4__Add_UserId_To_CommerciaProposal.sql', 1190362850, 'root', '2018-11-09 22:39:06', 51, 1),
(16, '4.1', 'General Adjusting', 'SQL', 'V4.1__General_Adjusting.sql', -282814704, 'root', '2018-11-09 22:39:06', 26, 1),
(17, '5', 'General Adjusting', 'SQL', 'V5__General_Adjusting.sql', 2093138505, 'root', '2018-11-09 22:39:06', 2, 0);

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
(1, 'Software', '2018-11-12 10:11:04', '2018-11-12 10:11:04'),
(2, 'Automotive and Transport', '2018-11-12 10:11:04', '2018-11-12 10:11:04');

-- --------------------------------------------------------

--
-- Table structure for table `proposal_service`
--

CREATE TABLE `proposal_service` (
  `commercial_proposal_id` int(11) NOT NULL,
  `consulting_service_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `company_id` int(11) NOT NULL,
  `consulting_service_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `start_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tag_id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'Vendita al Dettaglio', '2018-10-22 16:37:22', '2018-10-23 07:04:21'),
(4, 'Hacker', '2018-10-23 07:04:48', '2018-10-23 07:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(42) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `recruitment_date` date NOT NULL,
  `end_working` date NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `position_id` int(11) NOT NULL,
  `work_field_id` int(11) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `first_name`, `last_name`, `recruitment_date`, `end_working`, `phone_number`, `position_id`, `work_field_id`, `is_admin`, `created_at`, `updated_at`) VALUES
(11, 'cappun@me.com', 'egXzw2hDiTqHGeIXHQkcpQ==', 'Matteo', 'Cappon', '0000-00-00', '0000-00-00', '', 1, 1, 1, '2018-10-11 15:58:47', '2018-10-23 10:16:07');

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
(1, 'Full-Time', '2018-11-12 10:13:29', '2018-11-12 10:13:29'),
(2, 'Part-Time', '2018-11-12 10:13:29', '2018-11-12 10:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `work_position`
--

CREATE TABLE `work_position` (
  `position_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_position`
--

INSERT INTO `work_position` (`position_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Business', '2018-11-12 10:14:28', '2018-11-12 10:14:28'),
(2, 'Administrative', '2018-11-12 10:14:28', '2018-11-12 10:14:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `appointment_user`
--
ALTER TABLE `appointment_user`
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`audit_log_id`);

--
-- Indexes for table `client_type`
--
ALTER TABLE `client_type`
  ADD PRIMARY KEY (`client_type_id`);

--
-- Indexes for table `commercial_proposal`
--
ALTER TABLE `commercial_proposal`
  ADD PRIMARY KEY (`commercial_proposal_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `client_type_id` (`client_type_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_category_id` (`product_category_id`);

--
-- Indexes for table `company_tag`
--
ALTER TABLE `company_tag`
  ADD KEY `company_id` (`company_id`),
  ADD KEY `tag_id` (`tag_id`);

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
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`conversation_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `conversation_note`
--
ALTER TABLE `conversation_note`
  ADD PRIMARY KEY (`conversation_note_id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `flyway_schema_history`
--
ALTER TABLE `flyway_schema_history`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `flyway_schema_history_s_idx` (`success`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `proposal_service`
--
ALTER TABLE `proposal_service`
  ADD PRIMARY KEY (`commercial_proposal_id`,`consulting_service_id`),
  ADD KEY `proposal_service_ibfk_2` (`consulting_service_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD KEY `company_id` (`company_id`),
  ADD KEY `consulting_service_id` (`consulting_service_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`);

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
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `audit_log_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `client_type`
--
ALTER TABLE `client_type`
  MODIFY `client_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `commercial_proposal`
--
ALTER TABLE `commercial_proposal`
  MODIFY `commercial_proposal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `consulting_service`
--
ALTER TABLE `consulting_service`
  MODIFY `consulting_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `contact_person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `conversation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `conversation_note`
--
ALTER TABLE `conversation_note`
  MODIFY `conversation_note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment_user`
--
ALTER TABLE `appointment_user`
  ADD CONSTRAINT `appointment_user_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commercial_proposal`
--
ALTER TABLE `commercial_proposal`
  ADD CONSTRAINT `commercial_proposal_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commercial_proposal_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`client_type_id`) REFERENCES `client_type` (`client_type_id`),
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`),
  ADD CONSTRAINT `company_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `company_tag`
--
ALTER TABLE `company_tag`
  ADD CONSTRAINT `company_tag_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact_person`
--
ALTER TABLE `contact_person`
  ADD CONSTRAINT `contact_person_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `conversation_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conversation_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversation_note`
--
ALTER TABLE `conversation_note`
  ADD CONSTRAINT `conversation_note_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`conversation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conversation_note_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposal_service`
--
ALTER TABLE `proposal_service`
  ADD CONSTRAINT `proposal_service_ibfk_1` FOREIGN KEY (`commercial_proposal_id`) REFERENCES `commercial_proposal` (`commercial_proposal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_service_ibfk_2` FOREIGN KEY (`consulting_service_id`) REFERENCES `consulting_service` (`consulting_service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`consulting_service_id`) REFERENCES `consulting_service` (`consulting_service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `work_position` (`position_id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`work_field_id`) REFERENCES `work_field` (`work_field_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
