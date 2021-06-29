-- siapa pegawai yang paling banyak kontribusinya di bulan februari?
CREATE INDEX employee_key ON WH.Employee (EmployeeKey)
CREATE INDEX time_key ON WH.Time (TimeKey)
CREATE INDEX month_number ON WH.Time(MonthNumber)
CREATE INDEX total_kontribusi ON WH.FactTable(TotalWork)


DROP INDEX employee_key ON WH.Employee
DROP INDEX time_key ON WH.Time
DROP INDEX month_number ON WH.Time
DROP INDEX total_kontribusi ON WH.FactTable

-- pada bulan maret 2014, karyawan dengan umur berapakah yang memiliki kontribusi tertinggi?
CREATE INDEX employee_key ON WH.Employee (EmployeeKey)
CREATE INDEX time_key ON WH.Time (TimeKey)
CREATE INDEX month_year_number ON WH.Time(MonthNumber, Year)
CREATE INDEX total_kontribusi ON WH.FactTable(TotalWork)

DROP INDEX employee_key ON WH.Employee
DROP INDEX time_key ON WH.Time
DROP INDEX month_year_number ON WH.Time
DROP INDEX total_kontribusi ON WH.FactTable

-- pada tahun 2014, kontribusi rata-rata terbanyak diperoleh oleh karyawan dengan status pernikahan apa?
CREATE INDEX employee_key ON WH.Employee (EmployeeKey)
CREATE INDEX time_key ON WH.Time (TimeKey)
CREATE INDEX marital_key ON WH.Marital (MaritalKey)
CREATE INDEX year_number ON WH.Time(Year)
CREATE INDEX total_kontribusi ON WH.FactTable(TotalWork)
CREATE INDEX marital_status ON WH.Marital (MaritalStatus)

DROP INDEX employee_key ON WH.Employee
DROP INDEX time_key ON WH.Time
DROP INDEX marital_key ON WH.Marital
DROP INDEX year_number ON WH.Time
DROP INDEX total_kontribusi ON WH.FactTable
DROP INDEX marital_status ON WH.Marital

-- siapa pegawai yang paling banyak kontribusinya?
CREATE INDEX employee_key ON WH.Employee (EmployeeKey)
CREATE INDEX department_key ON WH.Department (DepartmentKey)
CREATE INDEX total_kontribusi ON WH.FactTable(TotalWork)

DROP INDEX employee_key ON WH.Employee
DROP INDEX department_key ON WH.Department
drop INDEX total_kontribusi ON WH.FactTable

-- departemen yang paling banayk shift malamnya?
CREATE INDEX deparment_key ON WH.Department (DepartmentKey)
CREATE INDEX shift_key ON WH.Shift (ShiftKey)
CREATE INDEX shift_name ON WH.Shift (ShiftName)
CREATE INDEX department_name ON WH.Department (Name)

DROP INDEX deparment_key ON WH.Department
DROP INDEX shift_key ON WH.Shift
DROP INDEX shift_name ON WH.Shift
DROP INDEX department_name ON WH.Department

