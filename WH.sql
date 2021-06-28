create database AdventureWH6;
use AdventureWH6;

-- masuk ke AdventureWH6 terlebih dahulu!!! sebelum melanjutkan
create schema WH;

-- time
create table WH.Time
(
	TimeKey int identity
		constraint Time_pk
			primary key nonclustered,
	Year int,
	MonthNumber int,
	MonthName nvarchar(10),
	DayOfMonth int,
	DayName nvarchar(10),
	Date datetime unique
)

-- Department
create table WH.Department
(
	DepartmentKey int identity
		constraint Department_pk
			primary key nonclustered,
	DepartmentID int not null,
	Name nvarchar(50),
	GroupName nvarchar(50)
)

-- Title
create table WH.Title
(
	TitleKey int identity
		constraint Title_pk
			primary key nonclustered,
	JobTitle nvarchar(50)
)

-- Gender
create table WH.Gender
(
    GenderKey int identity
		constraint Gender_pk
			primary key nonclustered,
	Gender nchar(1)
)

-- Marital
create table WH.Marital
(
    MaritalKey int identity
		constraint Marital_pk
			primary key nonclustered,
	MaritalStatus nchar(1)
)

-- Shift
create table WH.Shift
(
	ShiftKey int identity
		constraint Shift_pk
			primary key nonclustered,
	ShiftID int not null,
	ShiftName nvarchar(50),
	StartTime time(7),
	EndTime time(7)
)

-- Employee
create table WH.Employee
(
	EmployeeKey int identity
		constraint Employee_pk
			primary key nonclustered,
    BusinessEntityID int,
	PayRate money,
	PayFrequency int,
	SickLeaveHours int,
	VacationHours int,
	BirthDate date,
	HireDate date,
	MaritalKey int
		constraint Employee_Marital_MaritalKey_fk
			references WH.Marital,
	GenderKey int
		constraint Employee_Gender_GenderKey_fk
			references WH.Gender,
	TitleKey int
		constraint Employee_Title_TitleKey_fk
			references WH.Title,
	FirstName nvarchar(50),
	MiddleName nvarchar(50),
	LastName nvarchar(50),
	ShiftKey int
		constraint Employee_Shift_ShiftKey_fk
			references WH.Shift,
	DepartmentKey int
		constraint Employee_Department_DepartmentKey_fk
			references WH.Department
)

-- FactTable
create table WH.FactTable
(
	EmployeeKey int
		constraint FactTable_Employee_EmployeeKey_fk
			references WH.Employee,
	TimeKey int
		constraint FactTable_Time_TimeKey_fk
			references WH.Time,
	TotalWork money,
)
