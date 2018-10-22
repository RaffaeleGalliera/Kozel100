SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `appointment_user` (
  `appointment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `company`
  ADD `product_category_id` int(11) NOT NULL,
  ADD KEY `product_category_id` (`product_category_id`),
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`);

DROP TABLE `company_product`;

CREATE TABLE `company_tag` (
  `company_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `conversation` (
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `reason` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `conversation_note` (
  `conversation_note_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `conversation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

---

ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `company_id` (`company_id`);

ALTER TABLE `appointment_user`
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `company_tag`
  ADD KEY `company_id` (`company_id`),
  ADD KEY `tag_id` (`tag_id`);

ALTER TABLE `conversation`
  ADD PRIMARY KEY (`conversation_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `conversation_note`
  ADD PRIMARY KEY (`conversation_note_id`),
  ADD KEY `conversation_id` (`conversation_id`);

ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`);

---

ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `conversation`
  MODIFY `conversation_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `conversation_note`
  MODIFY `conversation_note_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tag`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `company_tag`
--
ALTER TABLE `company_tag`
  ADD CONSTRAINT `company_tag_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `conversation_note_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`conversation_id`) ON DELETE CASCADE ON UPDATE CASCADE;
