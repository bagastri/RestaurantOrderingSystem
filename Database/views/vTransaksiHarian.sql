DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`student`@`%` SQL SECURITY DEFINER VIEW `Transaksi_Harian` AS 
SELECT
  `transaksi_beli`.`TANGGAL_TRANSAKSI` AS `Tanggal`,
  COUNT(0)                             AS `Jumlah Transaksi`,
  CONCAT(FORMAT(SUM((`transaksi_beli`.`TOTAL_BAYAR` - `transaksi_beli`.`ONGKIR`)),2)) AS `Pemasukan`
FROM `transaksi_beli`
WHERE (`transaksi_beli`.`STATUS_PESANAN` <> 'Cancelled')
GROUP BY `Tanggal`
ORDER BY `Tanggal` DESC$$

DELIMITER ;