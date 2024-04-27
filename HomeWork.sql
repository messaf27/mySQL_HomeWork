DROP DATABASE IF EXISTS homework_db;
CREATE DATABASE homework_db;
USE homework_db;

DROP FUNCTION IF EXISTS getDataTime;
DELIMITER //
CREATE FUNCTION getDataTime (value INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE sec, min, hours, days INT DEFAULT 0;
	SET days = value / (24 * 3600); 
	SET value = value % (24 * 3600); 
	SET hours = value / 3600;
	SET value = value % 3600;
	SET min = value / 60;
	SET value = value % 60;
	SET sec =  value;

	RETURN CONCAT(days, '.', hours, ':', min, ':', sec);
END //
DELIMITER ;	

SELECT getDataTime(123456);

DROP PROCEDURE IF EXISTS getEvenNum;
DELIMITER //
CREATE PROCEDURE getEvenNum (IN num INT)
BEGIN
  DECLARE i INT DEFAULT 1;
  IF (num > 0) THEN
	WHILE i < (num + 1) DO
	  IF i%2 = 0 THEN SELECT i;
      END IF;
  	  SET i = i + 1;
	END WHILE;
  END IF;
END//
DELIMITER ;	
CALL getEvenNum(10);
