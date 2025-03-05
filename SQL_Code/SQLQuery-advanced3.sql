use SQL_Tutorial_2
go

--subqueries
select * from EmployeeSalary

--subquery 1

select EmployeeID , Salary ,(select AVg(salary) from EmployeeSalary) as ALLAVERAGESALARY
from EmployeeSalary

--by partition by
select EmployeeID , Salary , AVg(salary) over() as ALLAVERAGESALARY
from EmployeeSalary

--why group by doesnt work

select EmployeeID , Salary , AVg(salary) as ALLAVERAGESALARY
from EmployeeSalary
group by EmployeeID , Salary
order by 1,2

--subquery from
select * 
from(select EmployeeID , Salary , AVg(salary) over() as ALLAVERAGESALARY
		from EmployeeSalary) as subquery

--subquery in where
select EmployeeID , Salary ,JobTitle
from EmployeeSalary
where EmployeeID in (
		select EmployeeID
		from EmployeesDemographics
		where age > 30
) 

