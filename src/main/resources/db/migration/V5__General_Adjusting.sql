ALTER TABLE `contact_person` DROP FOREIGN KEY `contact_person_ibfk_1`; ALTER TABLE `contact_person` ADD CONSTRAINT `contact_person_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company`(`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `proposal_service` DROP FOREIGN KEY `proposal_service_ibfk_1`; ALTER TABLE `proposal_service` ADD CONSTRAINT `proposal_service_ibfk_1` FOREIGN KEY (`commercial_proposal_id`) REFERENCES `commercial_proposal`(`commercial_proposal_id`) ON DELETE CASCADE ON UPDATE CASCADE; ALTER TABLE `proposal_service` DROP FOREIGN KEY `proposal_service_ibfk_2`; ALTER TABLE `proposal_service` ADD CONSTRAINT `proposal_service_ibfk_2` FOREIGN KEY (`consulting_service_id`) REFERENCES `consulting_service`(`consulting_service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `proposal_service` DROP FOREIGN KEY `proposal_service_ibfk_1`; ALTER TABLE `proposal_service` ADD CONSTRAINT `proposal_service_ibfk_1` FOREIGN KEY (`commercial_proposal_id`) REFERENCES `commercial_proposal`(`commercial_proposal_id`) ON DELETE CASCADE ON UPDATE CASCADE; ALTER TABLE `proposal_service` DROP FOREIGN KEY `proposal_service_ibfk_2`; ALTER TABLE `proposal_service` ADD CONSTRAINT `proposal_service_ibfk_2` FOREIGN KEY (`consulting_service_id`) REFERENCES `consulting_service`(`consulting_service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `company` ADD `start_date` DATE NOT NULL AFTER `vat`; 


