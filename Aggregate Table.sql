CREATE TABLE aggregate_table
(
SELECT
	tanggal AS date_sales,
	id_invoice,
	nama AS customer_name,
	cabang_sales AS location_Branchshop,
	nama_barang AS product,
	lini AS brand,
	SUM(harga) AS price,
	SUM(jumlah_barang) AS product_sold,
	(jumlah_barang * harga) AS total_revenue
from base_table
group by
	tanggal,
	id_invoice,
	cabang_sales,
	nama_barang,
	Nama,
	lini,
	(jumlah_barang * harga) 
);


