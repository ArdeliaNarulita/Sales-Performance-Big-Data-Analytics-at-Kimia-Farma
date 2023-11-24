/* 	
Author 	: Ardelia Narulita Sari
Date	: 20/11/2023
PROJECT BASED INTERNSHIP - KIMIA FARMA
*/

/*
-------------------------
CREATE DATABASE AND TABLE 
-------------------------
*/

-- First, Create Schema --
CREATE SCHEMA kimiafarma_project;
USE kimiafarma_project;

-- Make the 'penjualan' Table --
CREATE TABLE penjualan
(
id_distributor VARCHAR(45) NOT NULL,
id_cabang VARCHAR(45) NULL,
id_invoice VARCHAR(45) NOT NULL,
tanggal DATE NULL,
id_customer VARCHAR(45) NULL,
id_barang VARCHAR(45) NULL,
jumlah_barang INT NULL,
unit VARCHAR(45) NULL,
harga DECIMAL(45,2) NULL,
mata_uang VARCHAR(45) NULL,
brand_id VARCHAR(45) NULL,
lini VARCHAR(45) NULL,
PRIMARY KEY (id_invoice)
);


-- Make the 'pelanggan' Table --
CREATE TABLE pelanggan
(
id_customer VARCHAR(45) NOT NULL,
`level` VARCHAR(45) NULL,
nama VARCHAR(45) NULL,
id_cabang_sales VARCHAR(45) NULL,
cabang_sales VARCHAR(45) NULL,
id_group VARCHAR(45) NULL,
`group` VARCHAR(45) NULL,
PRIMARY KEY (id_customer)
);


-- Make the 'barang' Table --
CREATE TABLE barang
(
kode_barang VARCHAR(45) NOT NULL,
sektor VARCHAR(45) NULL,
nama_barang VARCHAR(45) NULL,
tipe VARCHAR(45) NULL,
nama_tipe VARCHAR(45) NULL,
kode_lini VARCHAR(45) NULL,
lini VARCHAR(45) NULL,
kemasan VARCHAR(45) NULL,
PRIMARY KEY (kode_barang)
);


/* 	Next, you have to insert the dataset from the csv file into table as follows;
	1. On the navigator section, Select the database that you want, 
	   so click on 'kimiafarma_project'
	2. Click sort down icon, beside the 'kimiafarma_project' database
    3. Right click on the table
    4. Click on Table Data Import Wizard
    5. Check use existing table and truncate table before import, 
    6. Make sure the table name matches 
	7. Make sure the column names and format type match
	8. Click next on import data
*/

-- Create the base table --
CREATE TABLE base_table (
SELECT
    s.id_invoice,
    s.tanggal,
    s.id_customer,
    c.nama,
    s.id_distributor,
    s.id_cabang,
    c.cabang_sales,
    c.id_group,
    c.group,
    s.id_barang,
    b.nama_barang,
    s.brand_id,
    b.kode_lini,
    s.lini,
    b.kemasan,
    s.jumlah_barang,
    s.harga,
    s.mata_uang
FROM penjualan s
	LEFT JOIN pelanggan c ON c.id_customer = s.id_customer
	LEFT JOIN barang b ON b.kode_barang = s.id_barang
ORDER BY s.tanggal
);
ALTER TABLE base_table ADD PRIMARY KEY(id_invoice);

-- Create the agregate table --
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
