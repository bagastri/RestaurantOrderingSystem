DELIMITER $$

USE `KMMI5`$$

DROP TRIGGER /*!50032 IF EXISTS */ `tpoin`$$

CREATE
    /*!50017 DEFINER = 'student'@'%' */
    TRIGGER `tpoin` BEFORE INSERT ON `detail_beli` 
    FOR EACH ROW BEGIN
	DECLARE poinpembeli INT;
    
    SELECT poin INTO poinpembeli
    FROM pembeli
    WHERE ID_PEMBELI = new.ID_PEMBELI;
    
    UPDATE pembeli
    SET poin = new.subtotal * 0.1 + poinpembeli
    WHERE id_pembeli = new.id_pembeli;
END;
$$

DELIMITER ;