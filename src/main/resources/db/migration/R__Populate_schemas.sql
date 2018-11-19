SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
SET FOREIGN_KEY_CHECKS = 0;
START TRANSACTION;
SET time_zone = "+00:00";

# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: den1.mysql4.gear.host (MySQL 5.7.19-log)
# Database: kozel100
# Generation Time: 2018-11-19 10:37:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table appointment
# ------------------------------------------------------------

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;

INSERT INTO `appointment` (`appointment_id`, `company_id`, `note`, `date`, `time`, `created_at`, `updated_at`)
VALUES
	(1,3,'Test Appointment','2018-11-14','09:00:00','2018-11-13 10:18:23','2018-11-13 10:18:23'),
	(2,4,'Primary Topic: New Commercial Proposals','2018-11-13','00:30:00','2018-11-13 10:20:02','2018-11-13 10:20:02'),
	(3,8,'Tyrell?','2018-11-21','09:00:00','2018-11-15 03:34:43','2018-11-15 03:34:43'),
	(4,8,'I\'ll be alone this time','2018-11-22','10:30:00','2018-11-15 03:35:14','2018-11-15 03:35:14'),
	(5,9,'We\'ll discuss about security issues','2018-11-15','08:30:00','2018-11-15 03:39:28','2018-11-15 03:39:28'),
	(6,1,'Discussing why the new iPad pro isn\'t equipped with an oled display','2018-11-15','06:30:00','2018-11-15 06:20:48','2018-11-15 06:20:48');

/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table appointment_user
# ------------------------------------------------------------

LOCK TABLES `appointment_user` WRITE;
/*!40000 ALTER TABLE `appointment_user` DISABLE KEYS */;

INSERT INTO `appointment_user` (`appointment_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,14,'2018-11-13 10:18:23','2018-11-13 10:18:23'),
	(1,22,'2018-11-13 10:18:23','2018-11-13 10:18:23'),
	(1,23,'2018-11-13 10:18:23','2018-11-13 10:18:23'),
	(1,24,'2018-11-13 10:18:24','2018-11-13 10:18:24'),
	(1,25,'2018-11-13 10:18:24','2018-11-13 10:18:24'),
	(2,14,'2018-11-13 10:20:02','2018-11-13 10:20:02'),
	(2,11,'2018-11-13 10:20:02','2018-11-13 10:20:02'),
	(2,22,'2018-11-13 10:20:02','2018-11-13 10:20:02'),
	(2,23,'2018-11-13 10:20:03','2018-11-13 10:20:03'),
	(3,29,'2018-11-15 03:34:43','2018-11-15 03:34:43'),
	(3,27,'2018-11-15 03:34:44','2018-11-15 03:34:44'),
	(3,28,'2018-11-15 03:34:44','2018-11-15 03:34:44'),
	(4,29,'2018-11-15 03:35:14','2018-11-15 03:35:14'),
	(5,29,'2018-11-15 03:39:28','2018-11-15 03:39:28'),
	(6,11,'2018-11-15 06:20:48','2018-11-15 06:20:48'),
	(6,14,'2018-11-15 06:20:48','2018-11-15 06:20:48');

/*!40000 ALTER TABLE `appointment_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table client_type
# ------------------------------------------------------------

LOCK TABLES `client_type` WRITE;
/*!40000 ALTER TABLE `client_type` DISABLE KEYS */;

INSERT INTO `client_type` (`client_type_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Loyal','2018-11-12 03:05:26','0000-00-00 00:00:00'),
	(2,'New','2018-11-12 03:05:26','0000-00-00 00:00:00'),
	(5,'Prospect','2018-11-13 09:17:12','2018-11-13 09:17:12'),
	(6,'At-Risk','2018-11-13 09:18:11','2018-11-13 09:18:11');

/*!40000 ALTER TABLE `client_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table commercial_proposal
# ------------------------------------------------------------

LOCK TABLES `commercial_proposal` WRITE;
/*!40000 ALTER TABLE `commercial_proposal` DISABLE KEYS */;

INSERT INTO `commercial_proposal` (`commercial_proposal_id`, `name`, `description`, `status`, `company_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,'Offert','I\'m gonna make him an offer he can\'t refuse','PENDING',2,14,'2018-11-13 10:22:01','2018-11-13 10:22:01'),
	(2,'Nice Offer','Very Nice One','PENDING',1,14,'2018-11-13 10:34:00','2018-11-14 03:36:59'),
	(3,'Bundle','Bundle with two services','ACCEPTED',2,14,'2018-11-13 10:35:24','2018-11-13 10:35:42'),
	(4,'Bundle','Bundle Proposal','REJECTED',6,14,'2018-11-14 03:31:02','2018-11-14 03:32:12'),
	(5,'Another Proposal','Nicer','REJECTED',6,14,'2018-11-14 03:31:45','2018-11-14 03:41:15'),
	(6,'Bundle','Bundle Proposal','PENDING',1,14,'2018-11-14 03:37:37','2018-11-14 03:37:37'),
	(7,'That\'s a proposal','Services\' bundle','PENDING',8,14,'2018-11-15 03:13:32','2018-11-15 03:13:32'),
	(8,'Proposal without services','Nice proposal, but this time with no services at all','PENDING',8,11,'2018-11-15 03:22:44','2018-11-15 03:22:44'),
	(9,'Proposal',':(','REJECTED',8,29,'2018-11-15 03:36:25','2018-11-15 03:36:45'),
	(10,'Nice Proposal','I can help you guys','PENDING',9,29,'2018-11-15 03:40:30','2018-11-15 03:40:30');

/*!40000 ALTER TABLE `commercial_proposal` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table company
# ------------------------------------------------------------

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;

INSERT INTO `company` (`company_id`, `name`, `client_type_id`, `vat`, `start_date`, `address`, `city`, `zip_code`, `country`, `state`, `email`, `created_at`, `updated_at`, `user_id`, `product_category_id`)
VALUES
	(1,'Apple',1,'27394762010','2018-11-06','Via delle Mele Morsicate','Cupertino',44039,'USA','California','apple@me.com','2018-11-12 09:39:49','2018-11-12 09:39:49',11,1),
	(2,'Enrian Partners a.s',1,'55512158946','2018-04-18','Street Awesome 7','Praha 2',5458,'Czech Republic','Praha','enrian@enrian.en','2018-11-12 09:42:12','2018-11-12 11:00:08',14,1),
	(3,'Westworld',1,'56465123189','2017-11-01','Earum culpa aute, 18','Ipsum dolores ',4512,'Benin','Donga','negubow@mailinator.com','2018-11-13 09:11:15','2018-11-13 09:11:15',14,2),
	(4,'Horsin\' Around',1,'89465133574','2018-11-01','Horse Street, 985','Hollywoo',894517785,'USA','California','bojack@horseman.bo','2018-11-13 09:23:38','2018-11-13 09:23:38',25,2),
	(5,'Game Of Thrones CORP',6,'89794651225','2017-11-01','White George Street 77','Randomland',897542,'Christmas Island','Christmas Island','john@snow.js','2018-11-13 09:27:43','2018-11-13 09:27:43',22,3),
	(6,'Californication SA',6,'87021564321','2018-11-01','Donno Street 88','Los Angeles',78942,'USA','California','californicazione@ca.com','2018-11-13 09:30:43','2018-11-13 09:30:43',15,2),
	(7,'HBO Inc.',5,'89765415156','2018-11-06','Example Street 89','IpsumTown',894561,'USA','Illinois','hbo@hbo.hc','2018-11-13 09:35:50','2018-11-13 09:35:50',24,1),
	(8,'E Corp',6,'62924638666','2018-11-13','Dolor Square','Amet City',44028,'USA','California','evil@corp.io','2018-11-14 03:46:13','2018-11-15 03:38:07',29,1),
	(9,'Allsafe',5,'65864769273','2018-11-01','Bar Street','Foo City',33454,'USA','California','all@nearly.safe','2018-11-14 03:51:51','2018-11-15 03:37:48',29,1),
	(10,'Netflix',1,'89796851321','2018-11-07','Chill Street 90210','Scotts Valley',564565,'USA','California','net@flix.nf','2018-11-14 04:07:33','2018-11-14 04:07:33',21,1);

/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table company_tag
# ------------------------------------------------------------

LOCK TABLES `company_tag` WRITE;
/*!40000 ALTER TABLE `company_tag` DISABLE KEYS */;

INSERT INTO `company_tag` (`company_id`, `tag_id`, `created_at`, `updated_at`)
VALUES
	(2,6,'2018-11-13 10:36:40','2018-11-13 10:36:40'),
	(2,7,'2018-11-13 10:36:40','2018-11-13 10:36:40'),
	(1,5,'2018-11-14 07:46:09','2018-11-14 07:46:09'),
	(1,6,'2018-11-14 07:46:09','2018-11-14 07:46:09'),
	(1,7,'2018-11-14 07:46:09','2018-11-14 07:46:09'),
	(8,5,'2018-11-15 03:47:01','2018-11-15 03:47:01'),
	(8,7,'2018-11-15 03:47:01','2018-11-15 03:47:01');

/*!40000 ALTER TABLE `company_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table consulting_service
# ------------------------------------------------------------

LOCK TABLES `consulting_service` WRITE;
/*!40000 ALTER TABLE `consulting_service` DISABLE KEYS */;

INSERT INTO `consulting_service` (`consulting_service_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Training Agile','2018-11-12 03:07:28','2018-11-12 03:07:28'),
	(2,'Business Process','2018-11-12 03:08:09','2018-11-12 03:08:09'),
	(3,'Advisory','2018-11-12 03:08:09','2018-11-12 03:08:09');

/*!40000 ALTER TABLE `consulting_service` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contact_person
# ------------------------------------------------------------

LOCK TABLES `contact_person` WRITE;
/*!40000 ALTER TABLE `contact_person` DISABLE KEYS */;

INSERT INTO `contact_person` (`contact_person_id`, `first_name`, `last_name`, `email`, `phone_number`, `company_id`, `created_at`, `updated_at`)
VALUES
	(30,'John','Appleseed','johnappleseed@me.com','+393487756409',1,'2018-11-12 09:39:50','2018-11-12 09:39:50'),
	(31,'Christian','Martin','test@test.te','+392234865455',2,'2018-11-12 09:42:12','2018-11-12 09:42:12'),
	(33,'Bernard','Lowe','xetu@mailinator.net','+655245456123',3,'2018-11-13 09:11:15','2018-11-13 09:11:15'),
	(34,'Princess','Caroline','princess@caroline.pc','+897156132155',4,'2018-11-13 09:23:39','2018-11-13 09:23:39'),
	(35,'Daenerys','Targaryen','tikyjysa@mailinator.net','+986587465422',5,'2018-11-13 09:27:44','2018-11-13 09:27:44'),
	(36,'Hank','Moody','hank@moody.go','+989851613222',6,'2018-11-13 09:30:43','2018-11-13 09:30:43'),
	(37,'Kieran','Villarreal','begaqizy@mailinator.net','+897894212225',7,'2018-11-13 09:35:50','2018-11-13 09:35:50'),
	(38,'Tyrell','Wellick','tyrell@wellick.ec','+989841613222',8,'2018-11-14 03:46:13','2018-11-14 03:46:13'),
	(39,'Gideon','Goddard','gideon@goddard.as','+989841613111',9,'2018-11-14 03:51:51','2018-11-14 03:51:51'),
	(40,'Marc ','Randolph','muvokusyca@mailinator.com','+965456545555',10,'2018-11-14 04:07:34','2018-11-14 04:07:34');

/*!40000 ALTER TABLE `contact_person` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table conversation
# ------------------------------------------------------------

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;

INSERT INTO `conversation` (`conversation_id`, `user_id`, `company_id`, `date`, `reason`, `created_at`, `updated_at`)
VALUES
	(6,14,2,'2018-11-15','This is a conversation','2018-11-15 03:08:35','2018-11-15 03:08:35'),
	(7,14,8,'2018-11-15','Talked about fsociety','2018-11-15 03:11:45','2018-11-15 03:11:45'),
	(8,29,9,'2018-11-05','Is it all safe?','2018-11-15 03:38:37','2018-11-15 03:38:37'),
	(9,11,1,'2018-11-15','In the reason','2018-11-15 06:16:04','2018-11-15 06:16:04');

/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table conversation_note
# ------------------------------------------------------------

LOCK TABLES `conversation_note` WRITE;
/*!40000 ALTER TABLE `conversation_note` DISABLE KEYS */;

INSERT INTO `conversation_note` (`conversation_note_id`, `user_id`, `title`, `note`, `created_at`, `updated_at`, `conversation_id`)
VALUES
	(8,14,'Nice note title','Nice things about this conversation','2018-11-15 03:09:19','2018-11-15 03:11:05',6),
	(9,14,'Another nice note title','Not nice things about this conversation','2018-11-15 03:10:43','2018-11-15 03:11:00',6),
	(10,14,'Nice note title','Nice things about this conversation','2018-11-15 03:12:30','2018-11-15 03:12:30',7),
	(11,14,'Another nice note title','Not nice things this time','2018-11-15 03:12:52','2018-11-15 03:12:52',7),
	(12,29,'Bad Things','Not so happy','2018-11-15 03:35:56','2018-11-15 03:35:56',7),
	(13,29,'Don\'t think so','Not at all','2018-11-15 03:39:03','2018-11-15 03:39:03',8),
	(14,11,'Sample Title','Lorem Ipsum Amet Dolor','2018-11-15 06:17:01','2018-11-15 06:17:01',9);

/*!40000 ALTER TABLE `conversation_note` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_category
# ------------------------------------------------------------

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;

INSERT INTO `product_category` (`product_category_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Software','2018-11-12 03:11:04','2018-11-12 03:11:04'),
	(2,'Automotive and Transport','2018-11-12 03:11:04','2018-11-12 03:11:04'),
	(3,'Hardware','2018-11-13 09:18:57','2018-11-13 09:18:57');

/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table proposal_service
# ------------------------------------------------------------

LOCK TABLES `proposal_service` WRITE;
/*!40000 ALTER TABLE `proposal_service` DISABLE KEYS */;

INSERT INTO `proposal_service` (`commercial_proposal_id`, `consulting_service_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2018-11-13 10:22:01','2018-11-13 10:22:01'),
	(1,2,'2018-11-13 10:22:02','2018-11-13 10:22:02'),
	(1,3,'2018-11-13 10:22:02','2018-11-13 10:22:02'),
	(2,2,'2018-11-13 10:34:00','2018-11-13 10:34:00'),
	(3,1,'2018-11-13 10:35:24','2018-11-13 10:35:24'),
	(3,3,'2018-11-13 10:35:24','2018-11-13 10:35:24'),
	(4,1,'2018-11-14 03:31:02','2018-11-14 03:31:02'),
	(4,2,'2018-11-14 03:31:03','2018-11-14 03:31:03'),
	(5,2,'2018-11-14 03:31:45','2018-11-14 03:31:45'),
	(5,3,'2018-11-14 03:31:46','2018-11-14 03:31:46'),
	(6,1,'2018-11-14 03:37:37','2018-11-14 03:37:37'),
	(6,3,'2018-11-14 03:37:38','2018-11-14 03:37:38'),
	(7,2,'2018-11-15 03:13:32','2018-11-15 03:13:32'),
	(7,3,'2018-11-15 03:13:32','2018-11-15 03:13:32'),
	(9,2,'2018-11-15 03:36:26','2018-11-15 03:36:26'),
	(10,1,'2018-11-15 03:40:30','2018-11-15 03:40:30'),
	(10,2,'2018-11-15 03:40:31','2018-11-15 03:40:31'),
	(10,3,'2018-11-15 03:40:31','2018-11-15 03:40:31');

/*!40000 ALTER TABLE `proposal_service` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchase
# ------------------------------------------------------------



# Dump of table tag
# ------------------------------------------------------------

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;

INSERT INTO `tag` (`tag_id`, `name`, `created_at`, `updated_at`)
VALUES
	(5,'Tag1','2018-11-13 10:15:57','2018-11-13 10:15:57'),
	(6,'Tag2','2018-11-13 10:16:01','2018-11-13 10:16:01'),
	(7,'Tag3','2018-11-13 10:16:05','2018-11-13 10:16:05');

/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`user_id`, `email`, `password`, `first_name`, `last_name`, `position_id`, `work_field_id`, `is_admin`, `created_at`, `updated_at`)
VALUES
	(11,'cappun@me.com','egXzw2hDiTqHGeIXHQkcpQ==','Matteo','Cappon',1,1,1,'2018-10-11 09:58:47','2018-10-23 04:16:07'),
	(14,'gallieraraffaele@gmail.com','qOuYP1hKVuKqw//KGUJp2w==','Raffaele','Galliera',2,2,1,'2018-11-12 09:25:46','2018-11-12 09:25:46'),
	(15,'inico1@me.com','po259/RH+9jaYIlfAWHwiA==','Niccolò','Fontana',1,2,0,'2018-11-12 09:52:30','2018-11-12 09:52:30'),
	(21,'edo@geo.com','aFUFcK62IwQJ/oEhkvpTfQ==','Edoardo','Galliera',1,1,0,'2018-11-13 04:00:52','2018-11-13 04:00:52'),
	(22,'francesca@bonora.fb','1Nt7ljRDrbjyV0fhf5EVFA==','Francesca ','Bonora',1,1,1,'2018-11-13 08:25:54','2018-11-15 03:32:09'),
	(23,'enrico@scopa.esc','SgkVRAGKRRq1JlKYQd34/w==','Enrico','Scopa',2,2,1,'2018-11-13 08:31:59','2018-11-15 03:32:10'),
	(24,'pavel@snitil.ps','6BJcaGT3dgScxix12Fx4WA==','Pavel','Snítil ',1,1,1,'2018-11-13 08:34:42','2018-11-15 03:32:10'),
	(25,'jaromir@cervenka.jc','p4Pq1ukDGTYAlCD45lFxEA==','Jaromír','Cervenka',2,2,1,'2018-11-13 08:36:23','2018-11-15 03:32:11'),
	(26,'biwycilu@mailinator.net','bi8eo5nyjXUY31e+pd+dGw==','Genevieve','Bell',2,2,0,'2018-11-14 04:18:41','2018-11-14 04:18:41'),
	(27,'nelajireh@mailinator.com','K5Odfzf83anMqhYgpX8+HA==','Shannon','York',2,2,0,'2018-11-14 04:21:53','2018-11-14 04:21:53'),
	(28,'nojox@mailinator.net','uWGhDc5TmAgOiN0DKW1Xqg==','Meghan','Fernandez',2,2,0,'2018-11-14 04:28:06','2018-11-14 04:28:06'),
	(29,'mr@robot.mr','egXzw2hDiTqHGeIXHQkcpQ==','Elliot','Alderson',1,1,1,'2018-11-15 03:29:59','2018-11-15 03:37:17'),
	(30,'dytu@mailinator.net','FBAND8qIs4ScRHlmvOePBQ==','Ivor','Knox',2,2,0,'2018-11-15 04:07:05','2018-11-15 04:07:05'),
	(31,'jevudi@mailinator.net','bi8eo5nyjXUY31e+pd+dGw==','Jaden','Todd',2,2,1,'2018-11-15 04:12:54','2018-11-15 04:12:54'),
	(32,'xerexuhet@mailinator.net','F2QeFKdtx98gPpxCt0eOyg==','Chastity','Berry',2,2,1,'2018-11-15 04:16:23','2018-11-15 04:16:23'),
	(33,'koqefev@mailinator.com','HKPKxpXBp2bJZdImZKHdog==','Hanae','Witt',2,2,0,'2018-11-15 04:17:58','2018-11-15 04:17:58'),
	(34,'admin@adminovic.com','PGytuvRI/Jmicfl8uOgxqQ==','Admin','Adminovic',1,1,1,'2018-11-18 14:30:55','2018-11-18 14:30:55');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table work_field
# ------------------------------------------------------------

LOCK TABLES `work_field` WRITE;
/*!40000 ALTER TABLE `work_field` DISABLE KEYS */;

INSERT INTO `work_field` (`work_field_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Full-Time','2018-11-12 03:13:29','2018-11-12 03:13:29'),
	(2,'Part-Time','2018-11-12 03:13:29','2018-11-12 03:13:29');

/*!40000 ALTER TABLE `work_field` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table work_position
# ------------------------------------------------------------

LOCK TABLES `work_position` WRITE;
/*!40000 ALTER TABLE `work_position` DISABLE KEYS */;

INSERT INTO `work_position` (`position_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Business','2018-11-12 03:14:28','2018-11-12 03:14:28'),
	(2,'Administrative','2018-11-12 03:14:28','2018-11-12 03:14:28');

/*!40000 ALTER TABLE `work_position` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


COMMIT;
SET FOREIGN_KEY_CHECKS = 1;