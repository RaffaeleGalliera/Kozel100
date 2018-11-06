ALTER TABLE `commercial_proposal` ADD `user_id` INT(11) NOT NULL AFTER `company_id`;

ALTER TABLE `commercial_proposal` ADD FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
