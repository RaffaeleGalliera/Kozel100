CREATE TABLE `kozel100`.`commercial_proposal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `description` TEXT NOT NULL,
  `company_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))ENGINE = InnoDB;

ALTER TABLE `commercial_proposal`
  ADD FOREIGN KEY (`company_id`) REFERENCES `company`(`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `kozel100`.`purchase`(
  `company_id` INT NOT NULL ,
  `consulting_service_id` INT NOT NULL ,
  `purchase_date` DATE NOT NULL ,
  `start_date` DATE NOT NULL)ENGINE = InnoDB;

ALTER TABLE `purchase`
  ADD FOREIGN KEY (`company_id`) REFERENCES `company`(`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `purchase`
  ADD FOREIGN KEY (`consulting_service_id`) REFERENCES `consulting_service`(`consulting_service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

