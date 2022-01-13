DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`student`@`%` SQL SECURITY DEFINER VIEW `Penjualan Menu` AS 
SELECT
  `m`.`ID_MENU`    AS `ID`,
  `m`.`NAMA_MENU`  AS `Nama`,
  `m`.`HARGA_MENU` AS `Harga`,
  SUM(`db`.`QUANTITY_BELI`) AS `Terjual`
FROM (`detail_beli` `db`
   JOIN `menu` `m`)
WHERE (`db`.`ID_MENU` = `m`.`ID_MENU`)
GROUP BY `ID`
ORDER BY `Terjual` DESC$$

DELIMITER ;