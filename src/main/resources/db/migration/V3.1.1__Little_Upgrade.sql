ALTER TABLE `purchase`
  ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ADD `updated_at` TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `proposal_service`
  ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ADD `updated_at` TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `commercial_proposal`
  ADD `status` VARCHAR(10) NOT NULL AFTER `description`;