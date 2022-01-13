DELIMITER $$

CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    PROCEDURE `KMMI5`.`TransaksiPembeliByJumlah`(IN parJmlh INT)
    /*LANGUAGE SQL
    | [NOT] DETERMINISTIC
    | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
    | SQL SECURITY { DEFINER | INVOKER }
    | COMMENT 'string'*/
	BEGIN
	SELECT *
	FROM Transaksi_Pembeli
	WHERE Jumlah_Transaksi >= parJmlh;
	END$$

DELIMITER ;