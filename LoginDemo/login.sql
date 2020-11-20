CREATE DATABASE IF NOT EXISTS ase_db;
USE ase_db;

DROP TABLE users;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ase_db`.`users` (username, password) VALUES ('mac', 'mac123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('nick', 'nick123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('junlong', 'jl123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('alice', 'alice123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('bob', 'bob123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('charlie', 'charlie123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('user', 'user123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('daniel', 'daniel123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('ellen', 'ellen123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('frank', 'frank123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('ase', 'ase123');
INSERT INTO `ase_db`.`users` (username, password) VALUES ('cz3002', 'cz3002');

DELIMITER $$

DROP PROCEDURE user_auth;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_auth`(IN name CHAR(32), IN pass CHAR(64), OUT status INT)
BEGIN
SELECT users.username, users.password INTO @name, @password FROM users WHERE users.username = name;
	IF (SELECT COUNT(users.username) FROM users WHERE users.username = name AND users.password = pass) != 1 THEN
		#SET @message_text = CONCAT('Login incorrect for user \'', @name, '\'');
        SET status = 0;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Failed';
	ELSE
		#SELECT @name AS name;
        SET status = 1;
	END IF;
END$$
DELIMITER ;









