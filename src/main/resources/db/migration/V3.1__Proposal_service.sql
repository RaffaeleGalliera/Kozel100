CREATE TABLE `kozel100`.`proposal_service`(
  `commercial_proposal_id` INT NOT NULL ,
  `consulting_service_id` INT NOT NULL ,
   PRIMARY KEY (`commercial_proposal_id`, `consulting_service_id`)
) ENGINE = InnoDB;

ALTER TABLE `proposal_service`
  ADD FOREIGN KEY (`commercial_proposal_id`) REFERENCES `commercial_proposal`(`commercial_proposal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `proposal_service`
  ADD FOREIGN KEY (`consulting_service_id`) REFERENCES `consulting_service`(`consulting_service_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;