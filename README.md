# AdventureWH6
Proyek ini merupakan tugas akhir mata kuliah Manajemen Basis Data untuk melakukan ETL (Extract, Transform, Load) dari database AdventureWorks2019 milik Microsoft dan membuat Data Warehouse
# Tahap untuk replikasi:
*Pastikan AdventureWorks2019.bak sudah terpasang di MSSQL Server*

1. Mulai dari WH.sql untuk pembuatan skema awal dan tabel
2. Lanjut ke wh-insert.sql untuk melakukan ETL
3. gunakan functions.sql untuk membuat function
4. gunakan index.sql untuk membuat index agar mempercepat query
5. gunakan analysis.sql sesuka hati

*Cara Lain menggunakan Procedure*

1. Mulai dari WH.sql untuk pembuatan skema awal dan tabel
2. lanjut ke procedure.sql untuk membuat procedure
3. exec procedure di dalam procedure.sql paling bawah
4. gunakan index.sql untuk membuat index agar mempercepat query
5. gunakan analysis.sql sesuka hati

# Keterangan file
- index.sql -> membuat index
- procedure.sql -> insert fact dan dimensi namun versi procedure
- analysis.sql -> query untuk memunculkan informasi yang dicari atau analisis data
- functions.sql -> membuat function getUmur
- wh-insert.sql -> insert fact dan dimensi
- WH.sql -> create table
