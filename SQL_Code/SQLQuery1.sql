--USE SQL_Tutorial;
--GO
--select * from EmployeeDemographics 

--select firstname from EmployeeDemographics

--group by , order by

--select Gender ,count(Gender)
--from EmployeeDemographics
--group by  Gender

select Gender , age
from EmployeeDemographics
group by  Gender , Age


select Gender , count(Gender) as CountGender
from EmployeeDemographics
where Age>31
group by Gender
order by CountGender 