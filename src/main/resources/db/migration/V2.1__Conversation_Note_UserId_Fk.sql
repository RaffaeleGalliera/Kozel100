SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


---

ALTER TABLE conversation_note ADD user_id INT(11) NOT NULL AFTER conversation_note_id;
---


--
-- Constraints for table `conversation_note`
--
ALTER TABLE conversation_note ADD FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE;

