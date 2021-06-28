create or alter procedure etl

AS

BEGIN TRANSACTION
    --Gender
    insert into AdventureWH6.WH.Gender (Gender) select DISTINCT Gender from AdventureWorks2019.HumanResources.Employee;

    --Title
    insert into AdventureWH6.WH.Title (JobTitle) select DISTINCT JobTitle from AdventureWorks2019.HumanResources.Employee;

    --Marital
    insert into AdventureWH6.WH.Marital (MaritalStatus) select DISTINCT MaritalStatus from AdventureWorks2019.HumanResources.Employee;

    --Department
    insert into AdventureWH6.WH.Department (DepartmentID, Name, GroupName) select DepartmentID, Name, GroupName from AdventureWorks2019.HumanResources.Department;

    --Shift
    insert into AdventureWH6.WH.Shift (ShiftID, ShiftName, StartTime, EndTime)
    select shiftid, name, starttime, endtime from AdventureWorks2019.HumanResources.Shift;

    -- Employee
    insert into AdventureWH6.WH.Employee (BusinessEntityID, PayRate, PayFrequency, SickLeaveHours, VacationHours, ShiftKey, DepartmentKey, BirthDate, HireDate, FirstName, MiddleName, LastName, GenderKey, MaritalKey, TitleKey)
    select E.BusinessEntityID, Rate, PayFrequency, SickLeaveHours, VacationHours, ShiftKey, DepartmentKey, BirthDate, HireDate, FirstName, MiddleName, LastName, GenderKey, MaritalKey, TitleKey from AdventureWorks2019.HumanResources.Employee E
    join (select * from AdventureWorks2019.HumanResources.EmployeeDepartmentHistory where EndDate is null) EDH on E.BusinessEntityID = EDH.BusinessEntityID
    left join AdventureWorks2019.Sales.SalesPerson SP on E.BusinessEntityID = SP.BusinessEntityID
    join (select BusinessEntityID, Rate, PayFrequency from AdventureWorks2019.HumanResources.EmployeePayHistory a WHERE ModifiedDate = (SELECT MAX(ModifiedDate) FROM AdventureWorks2019.HumanResources.EmployeePayHistory b WHERE a.BusinessEntityID = b.BusinessEntityID)) PA on E.BusinessEntityID = PA.BusinessEntityID
    join WH.Shift S on S.ShiftID = EDH.ShiftID
    join WH.Department D on D.DepartmentID = EDH.DepartmentID
    join AdventureWorks2019.Person.Person P on E.BusinessEntityID = P.BusinessEntityID
    join AdventureWH6.WH.Gender G on G.Gender = E.Gender
    join AdventureWH6.WH.Marital M on M.MaritalStatus = E.MaritalStatus
    join AdventureWH6.WH.Title T on T.JobTitle = E.JobTitle
    ;

    -- Time
    insert into AdventureWH6.WH.Time(Year, MonthNumber, DayOfMonth, Date, MonthName, DayName)
    select DISTINCT
        DATEPART(Year, OrderDate) as Year,
        DATEPART(Month, OrderDate) as MonthNumber,
        DATEPART(day,OrderDate) as DayOfMonth,
        OrderDate,
        DATENAME(Month, OrderDate) as MonthName,
        DATENAME(DW,OrderDate) as DayName
    from AdventureWorks2019.Sales.SalesOrderHeader

    UNION

    select DISTINCT
        DATEPART(Year, OrderDate) as Year,
        DATEPART(Month, OrderDate) as MonthNumber,
        DATEPART(day,OrderDate) as DayOfMonth,
        OrderDate,
        DATENAME(Month, OrderDate) as MonthName,
        DATENAME(DW,OrderDate) as DayName
    from AdventureWorks2019.Purchasing.PurchaseOrderHeader;

    -- Fact Table dari Sales
    insert into WH.FactTable (EmployeeKey, TimeKey, TotalWork)
    select EmployeeKey, TimeKey, LineTotal from AdventureWorks2019.Sales.SalesOrderDetail SOD
    join AdventureWorks2019.Sales.SalesOrderHeader SOH on SOD.SalesOrderID = SOH.SalesOrderID
    join WH.Time T on T.Date = SOH.OrderDate
    join WH.Employee E on E.BusinessEntityID = SOH.SalesPersonID

    -- Fact Table dari Purchase
    insert into WH.FactTable (EmployeeKey, TimeKey, TotalWork)
    select EmployeeKey, TimeKey, LineTotal from AdventureWorks2019.Purchasing.PurchaseOrderDetail POD
    join AdventureWorks2019.Purchasing.PurchaseOrderHeader POH on POD.PurchaseOrderID = POH.PurchaseOrderID
    join WH.Time T on T.Date = POH.OrderDate
    join WH.Employee E on E.BusinessEntityID = POH.EmployeeID
COMMIT TRANSACTION
GO

--contoh etl
exec etl