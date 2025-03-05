Create table EmployeesDemographics(
EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

Insert into EmployeesDemographics Values
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

select * from EmployeesDemographics

Create table EmployeeSalary(
EmployeeID int,
JobTitle varchar(50),
Salary int)

Insert into EmployeeSalary values
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

select * from EmployeeSalary

select * from EmployeesDemographics
left outer join EmployeeSalary on EmployeesDemographics.EmployeeID = EmployeeSalary.EmployeeID


Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

select EmployeeID , FirstName , Age from EmployeesDemographics
Union 
select EmployeeID, JobTitle , Salary  from EmployeeSalary
order by EmployeeID

----select FirstName , LastName, Age,
----case
----	when Age = 38 Then 'Stanley'
----	when age Between 27 and 30 Then 'young'
----	else 'Baby'
----	End
----from EmployeesDemographics
----where Age is not null
----order by Age


select FirstName , LastName, JobTitle , Salary,
Case 
	when JobTitle = 'Salesman' then salary + (Salary * .10)
	when JobTitle = 'Accountant' then Salary+ (Salary * .5)
	when JobTitle = 'HR' then Salary + (Salary * .000001)
	else Salary + (Salary * .03)
	end as SalaryAfterRaise
from EmployeesDemographics
Join EmployeeSalary on EmployeesDemographics.EmployeeID = EmployeeSalary.EmployeeID

