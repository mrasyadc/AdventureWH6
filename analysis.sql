-- siapa pegawai yang paling banyak kontribusinya di bulan februari?
select FirstName, LastName, SUM(TotalWork) AS TotalKontribusi from WH.FactTable F
join WH.Employee E on E.EmployeeKey = F.EmployeeKey
join WH.Time T on T.TimeKey = F.TimeKey
WHERE MonthNumber = 2
GROUP BY E.EmployeeKey, FirstName, LastName
ORDER BY TotalKontribusi DESC

-- pada bulan maret 2015, karyawan dengan umur berapakah yang memiliki kontribusi tertinggi?
select
  (CONVERT(int,CONVERT(char(8),'20150331',112))-CONVERT(char(8),BirthDate,112))/10000 AS Umur,
    SUM(TotalWork) AS TotalKontribusi from WH.FactTable F
join WH.Employee E on E.EmployeeKey = F.EmployeeKey
join WH.Time T on T.TimeKey = F.TimeKey
WHERE MonthNumber = 3 AND Year = 2014
GROUP BY BirthDate
ORDER BY TotalKontribusi DESC

-- pada tahun 2014, kontribusi rata-rata terbanyak diperoleh oleh karyawan dengan status pernikahan apa?
select MaritalStatus, AVG(TotalWork) AS RataRataKontribusi from WH.FactTable F
join WH.Employee E on E.EmployeeKey = F.EmployeeKey
join WH.Time T on T.TimeKey = F.TimeKey
join WH.Marital M on M.MaritalKey = E.MaritalKey
WHERE Year = 2014
GROUP BY MaritalStatus
ORDER BY RataRataKontribusi DESC

-- siapa pegawai yang paling banyak kontribusinya?
select FirstName, LastName, D.Name as DepartmentName, SUM(TotalWork) AS TotalKontribusi from WH.FactTable F
join WH.Employee E on E.EmployeeKey = F.EmployeeKey
join WH.Department D on D.DepartmentKey = E.DepartmentKey
GROUP BY E.EmployeeKey, FirstName, LastName, D.Name
ORDER BY TotalKontribusi DESC

-- hubungan antara gaji yang diterima dengan kontribusi?
select PayRate, SUM(TotalWork) AS TotalKontribusi from WH.FactTable F
join WH.Employee E on E.EmployeeKey = F.EmployeeKey
GROUP BY PayRate
ORDER BY TotalKontribusi DESC

-- hubungan antara gender dengan rata-rata kontribusi?
select Gender, AVG(TotalWork) AS RataRataKontribusi from WH.FactTable F
join WH.Employee E on E.EmployeeKey = F.EmployeeKey
join WH.Gender G on G.GenderKey = E.GenderKey
GROUP BY Gender
ORDER BY RataRataKontribusi DESC

-- job title yang paling sedikit ngambil libur?
select T.JobTitle, AVG(VacationHours + SickLeaveHours) AS JatahCuti from WH.Employee E
join WH.Title T on T.TitleKey = E.TitleKey
group by JobTitle
ORDER BY JatahCuti DESC

-- departemen yang paling banayk shift malamnya?
select D.Name, COUNT( E.ShiftKey ) as JumlahShiftMalam from WH.Employee E
join WH.Department D on D.DepartmentKey = E.DepartmentKey
join WH.Shift S on S.ShiftKey = E.ShiftKey
WHERE ShiftName = 'Night'
group by D.Name
order by JumlahShiftMalam DESC

-- Hubungan antara status pernikahan dengan rata-rata gaji
select MaritalStatus, AVG(PayRate) as RataRataGaji from WH.Employee E
join WH.Marital M on M.MaritalKey = E.MaritalKey
group by MaritalStatus
order by RataRataGaji DESC

