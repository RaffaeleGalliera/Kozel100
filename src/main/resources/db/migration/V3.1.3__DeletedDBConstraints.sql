ALTER TABLE `company`
  DROP `name`;

ALTER TABLE `company` ADD `name` VARCHAR(50) NOT NULL AFTER `company_id`; 
