DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`student`@`%` SQL SECURITY DEFINER VIEW `Transaksi_Pembeli` AS 
SELECT
  `tb`.`ID_PEMBELI` AS `ID Pembeli`,
  CONCAT(`pb`.`FIRST_NAME`,' ',`pb`.`LAST_NAME`) AS `Nama`,
  COUNT(`tb`.`ID_TB`) AS `Jumlah_Transaksi`,
  CONCAT(FORMAT(SUM((`tb`.`TOTAL_BAYAR` - `tb`.`ONGKIR`)),2)) AS `Jumlah_Bayar`
FROM (`transaksi_beli` `tb`
   JOIN `pembeli` `pb`)
WHERE ((`tb`.`STATUS_PESANAN` <> 'Cancelled')
       AND (`pb`.`ID_PEMBELI` = `tb`.`ID_PEMBELI`))
GROUP BY `tb`.`ID_PEMBELI`
ORDER BY `Nama`$$

DELIMITER ;