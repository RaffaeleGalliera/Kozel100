CREATE TABLE `kozel100`.`audit_log` ( `audit_log_id` INT(50) NOT NULL AUTO_INCREMENT , `user_id` INT(11) NOT NULL , `company_id` INT(11) NULL , `method` VARCHAR(4) NOT NULL , `ip` VARCHAR(50) NOT NULL , `details` VARCHAR(500) NOT NULL , `action` VARCHAR(50) NOT NULL , `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (`audit_log_id`)) ENGINE = InnoDB;


ALTER TABLE `audit_log` CHANGE `user_id` `user_email` VARCHAR(50) NOT NULL, CHANGE `company_id` `company_name` VARCHAR(50) NULL DEFAULT NULL;

ALTER TABLE `audit_log` ADD `requested_resource` VARCHAR(100) NOT NULL AFTER `company_name`;
