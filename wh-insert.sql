--Gender
insert into AdventureWH6.WH.Gender (Gender) select DISTINCT Gender from AdventureWorks2019.HumanResources.Employee;

--Title
insert into AdventureWH6.WH.Title (JobTitle) select DISTINCT JobTitle from AdventureWorks2019.HumanResources.Employee;

--Marital
insert into AdventureWH6.WH.Marital (MaritalStatus) select DISTINCT MaritalStatus from AdventureWorks2019.HumanResources.Employee;

--Bio
insert into AdventureWH6.WH.Bio (BusinessEntityID, BirthDate, HireDate, FirstName, MiddleName, LastName, GenderKey, MaritalKey, TitleKey)
select E.BusinessEntityID, BirthDate, HireDate, FirstName, MiddleName, LastName, GenderKey, MaritalKey, TitleKey from AdventureWorks2019.HumanResources.Employee E
join AdventureWorks2019.Person.Person P on E.BusinessEntityID = P.BusinessEntityID
join AdventureWH6.WH.Gender G on G.Gender = E.Gender
join AdventureWH6.WH.Marital M on M.MaritalStatus = E.MaritalStatus
join AdventureWH6.WH.Title T on T.JobTitle = E.JobTitle
;

select BusinessEntityID, Rate, PayFrequency from AdventureWorks2019.HumanResources.EmployeePayHistory a WHERE ModifiedDate = (SELECT MAX(ModifiedDate) FROM AdventureWorks2019.HumanResources.EmployeePayHistory b WHERE a.BusinessEntityID = b.BusinessEntityID) ORDER BY BusinessEntityID;

--Department
insert into AdventureWH6.WH.Department (DepartmentID, Name, GroupName) select DepartmentID, Name, GroupName from AdventureWorks2019.HumanResources.Department;

--Shift
insert into AdventureWH6.WH.Shift (ShiftID, ShiftName, StartTime, EndTime)
select shiftid, name, starttime, endtime from AdventureWorks2019.HumanResources.Shift;

-- Territory
insert into AdventureWH6.WH.Territory (TerritoryID, TerritoryName, CountryRegionCode, [Group])
select TerritoryID, Name, CountryRegionCode, [Group] from AdventureWorks2019.Sales.SalesTerritory;

-- Employee
insert into AdventureWH6.WH.Employee (BusinessEntityID, SalesQuota, SalesYTD, CommissionPct, PayRate, PayFrequency, SickLeaveHours, VacationHours, ShiftKey, DepartmentKey, BioKey, TerritoryKey)
select E.BusinessEntityID, SalesQuota, SalesYTD, CommissionPct, Rate, PayFrequency, SickLeaveHours, VacationHours, ShiftKey, DepartmentKey, BioKey, TerritoryKey from AdventureWorks2019.HumanResources.Employee E
join (select * from AdventureWorks2019.HumanResources.EmployeeDepartmentHistory where EndDate is null) EDH on E.BusinessEntityID = EDH.BusinessEntityID
left join AdventureWorks2019.Sales.SalesPerson SP on E.BusinessEntityID = SP.BusinessEntityID
join (select BusinessEntityID, Rate, PayFrequency from AdventureWorks2019.HumanResources.EmployeePayHistory a WHERE ModifiedDate = (SELECT MAX(ModifiedDate) FROM AdventureWorks2019.HumanResources.EmployeePayHistory b WHERE a.BusinessEntityID = b.BusinessEntityID)) PA on E.BusinessEntityID = PA.BusinessEntityID
join WH.Shift S on S.ShiftID = EDH.ShiftID
join WH.Department D on D.DepartmentID = EDH.DepartmentID
left join WH.Territory T on T.TerritoryID = SP.TerritoryID
join WH.Bio B on B.BusinessEntityID = E.BusinessEntityID
;