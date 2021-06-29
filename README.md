# AdventureWH6
Proyek ini merupakan tugas akhir mata kuliah Manajemen Basis Data untuk melakukan ETL (Extract, Transform, Load) dari database AdventureWorks2019 milik Microsoft dan membuat Data Warehouse
# Tahap untuk replikasi:
*Pastikan AdventureWorks2019.bak sudah terpasang di MSSQL Server*

1. Mulai dari WH.sql untuk pembuatan skema awal dan tabel
2. Lanjut ke wh-insert.sql untuk melakukan ETL
3. Terakhir gunakan index.sql untuk membuat index agar mempercepat query

# Keterangan file
- index.sql -> membuat index
- procedure.sql -> insert fact dan dimensi namun versi procedure
- analysis.sql -> query untuk memunculkan informasi yang dicari atau analisis data
