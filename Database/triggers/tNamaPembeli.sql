DELIMITER $$

USE `KMMI5`$$

DROP TRIGGER /*!50032 IF EXISTS */ `tNamaPembeli`$$

CREATE
    /*!50017 DEFINER = 'student'@'%' */
    TRIGGER `tNamaPembeli` BEFORE INSERT ON `pembeli` 
    FOR EACH ROW BEGIN
SET new.first_name = UPPER(new.substring(first_name,1,1));
SET new.last_name = UPPER(new.substring(last_name,1,1));
END;
$$

DELIMITER ;