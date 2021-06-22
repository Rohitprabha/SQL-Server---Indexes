select * from EMPLOYEE

--to create index on a table of specific column
create index IX_Employee_Salary on Employee(Salary ASC)

--to see the all indexes of a particular table
SP_HelpIndex Employee

--to drop the index
drop index Employee.IX_Employee_Salary

--Clustered Index
insert into Department values(11,'HR')
insert into Department values(10,'DBA')
insert into Department values(14,'.NET')
insert into Department values(12,'QA')
select * from Department					--Data is arranged automatically in an asc order
SP_HelpIndex Department

--Composite cluster Index
create clustered index IX_Employee_Salary_DeptID on Employee(DeptID DESC, Salary ASC)

SP_HelpIndex Employee
select * from EMPLOYEE						--Data is arranged based on DeptID first and then salary

drop index Employee.IX_Employee_Salary_DeptID

--NonClustered Index
create NonClustered index IX_Employee_Salary_DeptID on Employee(Salary)

--Unique CLUSTERED Index
create table Department(DeptID int PRIMARY KEY, DeptName varchar(50))		--PRIMARY KEY creates a unique clustered index
SP_HelpIndex Department
insert into Department values(10,'DBA'),(11,'HR'),(12,'QA')

--Unique NON-CLUSTERED Index
create unique NonClustered index UIX_Employee_EmployeeID on Employee(EmpID)		--must be unique
select * from EMPLOYEE															

--Filtered index
CREATE INDEX IX_DiffIndexTypesDemo_Name ON DiffIndexTypesDemo (Name) WHERE NAME IS NOT NULL
create index IX_Employee_Salary on Employee(Salary) where Salary >40000
drop index Employee.IX_Employee_Salary

--Index in GROUP BY Clause
SELECT PS.ProductID, SUM(PS.QunatitSold) AS TotalQuantitySold FROM ProductSales AS PS GROUP BY PS.ProductID
CREATE    NONCLUSTERED    INDEX    IX_ProductSales_ProductID ON ProductSales(ProductID)
SELECT PS.ProductID,  SUM(PS.QuantitySold) AS TotalQuantitySold FROM ProductSales AS PS  GROUP BY PS.ProductID
CREATE NONCLUSTERED INDEX IX_ProductSales_ProductID_QunatitySold ON ProductSales(ProductID, QuantitySold)
SELECT PS.ProductID,  SUM(PS.QuantitySold) AS TotalQuantitySold FROM ProductSales AS PS  GROUP BY PS.ProductID

--Covering query
SELECT ProductID, QuantitySold FROM ProductSales
