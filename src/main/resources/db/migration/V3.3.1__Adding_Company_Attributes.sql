ALTER TABLE `company` ADD `zip_code` INT(10) NOT NULL DEFAULT '44124' AFTER `city`, ADD `country` VARCHAR(50) NOT NULL DEFAULT 'Italy' AFTER `zip_code`;

ALTER TABLE `company` ADD `state` VARCHAR(50) NOT NULL DEFAULT 'Emilia-Romagna' AFTER `country`;

ALTER TABLE `contact_person` CHANGE `phone_number` `phone_number` VARCHAR(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL; 
