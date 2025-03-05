--CTE's (Common Table Expressions)
use SQL_Tutorial_2
Go
  
with CTE_Employee as 
(select FirstName , LastName ,Gender , Salary,
count(Gender) over(Partition by Gender) as Total_Gender,
Avg(Salary) over(Partition by Gender) as Avd_salary
from EmployeesDemographics as Demo
join EmployeeSalary as Sal
on Demo.EmployeeID = Sal.EmployeeID
where Salary > 45000
)

select * from CTE_Employee

--Temp Tables 

