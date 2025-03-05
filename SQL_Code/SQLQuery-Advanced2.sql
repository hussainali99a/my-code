use SQL_Tutorial_2
go

--select * from EmployeesDemographics

--stored procedures

create procedure test
as 
select * 
from EmployeesDemographics


exec test


CREATE PROCEDURE temp_employee2
as
create table #temp_employee2(
jobtitle varchar(100),
employeeperjob int ,
avgage int,
avgsalary int
)

insert into #temp_employee2
select jobtitle,count(jobtitle) , Avg(age) , Avg(salary)
from EmployeesDemographics emp
join EmployeeSalary sal
on emp.EmployeeID = sal.EmployeeID
group by JobTitle

select * from #temp_employee2

exec temp_employee2


