use SQL_Tutorial_2
GO

select * from EmployeeSalary

select JobTitle , avg(salary) as AVG_Salary
from EmployeesDemographics
join EmployeeSalary on EmployeesDemographics.EmployeeID = EmployeeSalary.EmployeeID
group  by JobTitle
having avg(Salary) > 45000
order by Avg(Salary)

--updating and deleting the data from the table

select * from EmployeesDemographics

insert into EmployeesDemographics values
(null , 'Ryan' , 'Howard' , 28 , 'Male'),
(null , 'Regan' , 'Fox' , 58 , null),
(1013 , 'Denyl' , 'Philton' , null , 'Male')

select * from EmployeesDemographics

update EmployeesDemographics
set EmployeeID = 1011
where FirstName = 'Ryan' and LastName = 'Howard'

update EmployeesDemographics
set EmployeeID = 1012 ,  Gender = 'Female'
where FirstName = 'Regan' and LastName = 'Fox'

delete from EmployeesDemographics
where EmployeeID = 1011

select * from EmployeesDemographics

insert into EmployeesDemographics values
(1011 , 'Ryan','Howard',67,'Male')

select FirstName as Fname
from EmployeesDemographics

select FirstName + ' ' + Lastname as Full_name
from EmployeesDemographics

select avg(age) as Avg_age
from EmployeesDemographics

select Demo.EmployeeID , Sal.Salary
from EmployeesDemographics as Demo
join EmployeeSalary as Sal
on Demo.EmployeeID = Sal.EmployeeID


select Demo.EmployeeId , Demo.Firstname , Demo.Lastname,Sal.salary , ware.age
from EmployeesDemographics as Demo
left join EmployeeSalary as Sal
on Demo.EmployeeID = Sal.EmployeeID
left join WareHouseEmployeeDemographics as ware
on Demo.EmployeeID = Ware.EmployeeID

--partiton by
select FirstName , LastName ,Gender , Salary,
count(Gender) over(Partition by Gender) as Total_Gender
from EmployeesDemographics as Demo
join EmployeeSalary as Sal
on Demo.EmployeeID = Sal.EmployeeID

SELECT Gender, COUNT(Gender) AS Total_gender
FROM EmployeesDemographics
JOIN EmployeeSalary ON EmployeesDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY Gender;