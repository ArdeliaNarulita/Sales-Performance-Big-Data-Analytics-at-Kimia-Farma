
# **Project Based Internship : Big Data Analytics – Kimia Farma**

Tool : MySQL - [Look at the script]( https://github.com/ArdeliaNarulita/Sales-Performance-Big-Data-Analytics-at-Kimia-Farma/blob/main/KimiaFarma_Project.sql) <br>
Visualization : Google Looker Studio - [Look at the dashboard]( https://lookerstudio.google.com/reporting/6fe21ae0-860a-4061-bf05-ddacb7cb68ac) <br>

---

## 📂 **Introduction**
In the Project Based Internship activity to become Big Data Analytics at Kimia Farma, there is a project related to a data warehouse, data lake and data mart. So I can understand the material, apart from that I am also becoming more proficient in creating databases, tables and making other queries using My SQL, I can also visualize company data using Google Data Studio/Google Looker Studio. <br>

### **Problem Statement**
The source is from Rakamin, there is Kimia Farma data which provides a CSV file consisting of 3 datasets. From this CSV file, I was asked to create a database consisting of a base table and aggregate table and create a sales dashboard using Google Looker Studio. <br>

### **Objective**
- Create data mart designs in the form of base tables and aggregate tables
- Create a sales report dashboard
<br>

### **Dataset** <br>
The dataset provided consists of the following tables:
- Penjualan
- Pelanggan
- Barang
<br>

<details>
  <summary>Click to see ‘Penjualan Table’</summary>

<p align="center">
  <kbd> <img width="400" alt="Sample Penjualan Table" src="https://github.com/ArdeliaNarulita/Sales-Performance-Big-Data-Analytics-at-Kimia-Farma/blob/main/Gambar/Sample%20Penjualan%20Table.png"></kbd> <br>
</p>

</details>
<br>

<details>
  <summary> Click to see ‘Pelanggan Table’</summary>

<p align="center">
  <kbd> <img width="400" alt="Sample Pelanggan Table" src="https://github.com/ArdeliaNarulita/Sales-Performance-Big-Data-Analytics-at-Kimia-Farma/blob/main/Gambar/Sample%20Pelanggan%20Table.png"></kbd> <br>
</p>

</details>
<br>

<details>
  <summary> Click to see ‘Barang Table’ </summary>

<p align="center">
  <kbd> <img width="400" alt="Sample Barang Table" src="https://github.com/ArdeliaNarulita/Sales-Performance-Big-Data-Analytics-at-Kimia-Farma/blob/main/Gambar/Sample%20Barang%20Table.png"></kbd> <br>
</p>

</details>
<br>

<details>
  <summary> Click to see Entity Relational Diagram</summary>

<p align="center">
  <kbd> <img width="400" alt="Entity Relational Diagram" src="https://github.com/ArdeliaNarulita/Sales-Performance-Big-Data-Analytics-at-Kimia-Farma/blob/main/Gambar/ERD.png"></kbd> <br>
</p>

</details>
<br>

---

## 📂 **Design Datamart**
### **Base Table**
The base table is a table that contains raw data collected from various sources. The base table in this project is a combination of several columns from the three tables above with the primary key, namely`invoice_id`. <br>

<details>
  <summary> Klik untuk melihat Query </summary>
    <br>
    
```sql
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
  
<br>
</details>
<br>

<p align="center">
    <kbd> <img width="1000" alt="sample base table" src="https://github.com/ArdeliaNarulita/Sales-Performance-Big-Data-Analytics-at-Kimia-Farma/blob/main/Gambar/Sample%20of%20Base%20Table.png"> </kbd> <br>
    Figure 1 — Sample of The Output Base Table 
</p>
<br>

### Tabel Aggregat
After creating the base table, I created an aggregate table that SUM the `price` and `product_sold` columns. Then create a new column to find the `total_revenue` value. An aggregate table is a table created to collect and calculate data from a base table. This table contains more concise data so that the process of analyzing and visualizing data is faster and easier.
<details>
  <summary> Klik untuk melihat Query </summary>
    <br>
    
```sql
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
```   
<br>
</details>
<br>

<p align="center">
    <kbd> <img width="750" alt="sample aggregate table" src="https://github.com/ArdeliaNarulita/Sales-Performance-Big-Data-Analytics-at-Kimia-Farma/blob/main/Gambar/Sample%20of%20Aggregate%20Table.png"> </kbd> <br>
    Figure 2 — Sample of The Output Base Table
</p>
<br>

---

## 📂 **Data Visualization**
Lastly, I creates a dashboard using data source from aggregate table in Google Data Studio.

[Look at the Looker Data Studio]( https://lookerstudio.google.com/reporting/6fe21ae0-860a-4061-bf05-ddacb7cb68ac).

<p align="center">
    <kbd> <img width="1000" alt="Dashboard Kimia Farma" src="https://github.com/ArdeliaNarulita/Sales-Performance-Big-Data-Analytics-at-Kimia-Farma/blob/main/Gambar/Dashboard%20Section%201.png"> </kbd> <br>
    Figure 3 — Section 1 Dashboard Kimia Farma
</p>
<br>

<p align="center">
    <kbd> <img width="1000" alt="Dashboard Kimia Farma" src="https://github.com/ArdeliaNarulita/Sales-Performance-Big-Data-Analytics-at-Kimia-Farma/blob/main/Gambar/Dashboard%20Section%202.png"> </kbd> <br>
    Figure 4 — Section 2 Dashboard Kimia Farma
</p>
<br>

<p align="center">
    <kbd> <img width="1000" alt="Dashboard Kimia Farma" src="https://github.com/ArdeliaNarulita/Sales-Performance-Big-Data-Analytics-at-Kimia-Farma/blob/main/Gambar/Dashboard%20Section%203.png"> </kbd> <br>
    Figure 5 — Section 3 Dashboard Kimia Farma
</p>
<br>

---

