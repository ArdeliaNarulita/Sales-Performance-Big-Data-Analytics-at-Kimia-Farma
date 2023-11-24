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