create database AdventureWH6;
use AdventureWH6;

-- masuk ke AdventureWH6 terlebih dahulu!!! sebelum melanjutkan
create schema WH;

-- -- product category
-- create table WH.ProductCategory
-- (
-- 	ProductCategoryKey int identity
-- 		constraint ProductCategory_pk
-- 			primary key nonclustered,
-- 	ProductCategoryID int not null,
-- 	ProductCategoryName nvarchar(50)
-- )
--
-- -- product sub category
-- create table WH.ProductSubCategory
-- (
-- 	ProductSubCategoryKey int identity
-- 		constraint ProductSubCategory_pk
-- 			primary key nonclustered,
-- 	ProductSubCategoryID int not null,
-- 	ProductSubCategoryName nvarchar(50),
-- 	ProductCategoryKey int not null
-- 		constraint ProductSubCategory_ProductCategory_ProductCategoryKey_fk
-- 			references WH.ProductCategory
-- )
--
-- -- product
-- create table WH.Product
-- (
-- 	ProductKey int identity
-- 		constraint Product_pk
-- 			primary key nonclustered,
-- 	ProductID int not null,
-- 	ProductName nvarchar(50),
-- 	ProductSubCategoryKey int
-- 		constraint Product_ProductSubCategory_ProductSubCategoryKey_fk
-- 			references WH.ProductSubCategory
-- )

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
	Date datetime
)

-- territory
create table WH.Territory
(
	TerritoryKey int identity
		constraint Territory_pk
			primary key nonclustered,
	TerritoryID int,
	TerritoryName nvarchar(50),
	CountryRegionCode nvarchar(3),
	[Group] nvarchar(50)
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

-- -- Bio
-- create table WH.Bio
-- (
-- 	BioKey int identity
-- 		constraint Bio_pk
-- 			primary key nonclustered,
--     BusinessEntityID int,
-- )

-- Employee
create table WH.Employee
(
	EmployeeKey int identity
		constraint Employee_pk
			primary key nonclustered,
    BusinessEntityID int,
	SalesQuota money,
	SalesYTD money,
	CommissionPct smallmoney,
	PayRate money,
	PayFrequency int,
	SickLeaveHours int,
	VacationHours int,
	BirthDate date,
	HireDate date,
	MaritalKey int
		constraint Bio_Marital_MaritalKey_fk
			references WH.Marital,
	GenderKey int
		constraint Bio_Gender_GenderKey_fk
			references WH.Gender,
	TitleKey int
		constraint Bio_Title_TitleKey_fk
			references WH.Title,
	FirstName nvarchar(50),
	MiddleName nvarchar(50),
	LastName nvarchar(50),
	ShiftKey int
		constraint Employee_Shift_ShiftKey_fk
			references WH.Shift,
	DepartmentKey int
		constraint Employee_Department_DepartmentKey_fk
			references WH.Department,
	BioKey int
		constraint Employee_Bio_BioKey_fk
			references WH.Bio,
	TerritoryKey int
		constraint Employee_Territory_TerritoryKey_fk
			references WH.Territory
)

-- FactTable
create table WH.FactTable
(
-- 	SalesOrderID int not null,
-- 	SalesOrderDetailID int not null,
-- 	ProductKey int
-- 		constraint FactTable_Product_ProductKey_fk
-- 			references WH.Product,
	EmployeeKey int
		constraint FactTable_Employee_EmployeeKey_fk
			references WH.Employee,
	TimeKey int
		constraint FactTable_Time_TimeKey_fk
			references WH.Time,
	TotalWork money,
)

-- alter table WH.FactTable ADD CONSTRAINT PK_FACTID PRIMARY KEY (SalesOrderID, SalesOrderDetailID)
