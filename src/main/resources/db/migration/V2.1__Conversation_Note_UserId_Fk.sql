ALTER TABLE conversation_note ADD user_id INT(11) NOT NULL AFTER conversation_note_id;

ALTER TABLE conversation_note ADD FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE;

