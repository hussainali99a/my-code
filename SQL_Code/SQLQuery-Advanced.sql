--temp table
Use SQL_Tutorial_2
go

create Table #Temp_employee(
EmployeeID int ,
JobTitle Varchar(100),
Salary int
)

select * from #Temp_employee

insert into #Temp_employee values
(1001 , 'HR' , 45000)

insert into #Temp_employee
select * from EmployeeSalary

select * from #Temp_employee

update #Temp_employee 
set EmployeeID = 1002 , Salary = 48000
where JobTitle = 'Salesman'


drop Table if exists #temp_Employee2
create table #temp_Employee2(
JobTitle varchar(50),
EmployeePerJob int ,
AvgAge int ,
AvgSalary int
)

insert Into #temp_Employee2
select JobTitle ,  count(JobTitle) , Avg(Age) , Avg(Salary)
from EmployeesDemographics as emp
join EmployeeSalary as sal 
on emp.EmployeeID = sal.EmployeeID
group by JobTitle

select * from #temp_Employee2

--string 

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

select * from EmployeeErrors

--using trim , ltrim , rtrim

--trim
select employeeID , trim(EmployeeID) as IDTRIM
from EmployeeErrors

select employeeID , ltrim(EmployeeID) as IDTRIM
from EmployeeErrors

select employeeID , rtrim(EmployeeID) as IDTRIM
from EmployeeErrors

--using Replace 

select LastName,Replace(LastName , '- Fired' , '') as Lastname_fixed
from EmployeeErrors

--using substring
select SUBSTRING(FirstName,3,3)
from EmployeeErrors

select err.Firstname ,SUBSTRING(err.FirstName,1,3), dem.firstname ,SUBSTRING(dem.FirstName,1, 3)
from EmployeeErrors err
join EmployeesDemographics dem
on SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1, 3)
 

--lower and upper 
select  FirstName , LOWER(firstname)
from EmployeeErrors

select  FirstName , UPPER(firstname)
from EmployeeErrors

