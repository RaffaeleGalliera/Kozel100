ALTER TABLE `company` CHANGE `vat` `vat` VARCHAR(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `address` `address` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `city` `city` VARCHAR(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `email` `email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;


ALTER TABLE `company` ADD FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;



ALTER TABLE `client_type` CHANGE `updated_at` `updated_at` TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE `contact_person` CHANGE `email` `email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `phone_number` `phone_number` VARCHAR(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;



ALTER TABLE `contact_person` ADD FOREIGN KEY (`company_id`) REFERENCES `company`(`company_id`) ON DELETE CASCADE ON UPDATE CASCADE; 


ALTER TABLE `user` CHANGE `first_name` `first_name` VARCHAR(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL, CHANGE `last_name` `last_name` VARCHAR(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL, CHANGE `recruitment_date` `recruitment_date` DATE NOT NULL, CHANGE `end_working` `end_working` DATE NOT NULL, CHANGE `phone_number` `phone_number` VARCHAR(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL, CHANGE `is_admin` `is_admin` TINYINT(1) NOT NULL DEFAULT '0';


ALTER TABLE `user` ADD FOREIGN KEY (`position_id`) REFERENCES `work_position`(`position_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `user` ADD FOREIGN KEY (`work_field_id`) REFERENCES `work_field`(`work_field_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;


ALTER TABLE `work_position` CHANGE `name` `name` VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL; 


ALTER TABLE `user`
  DROP `recruitment_date`,
  DROP `end_working`,
  DROP `phone_number`





