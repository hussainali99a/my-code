use Portfolio_project
go

select continent ,avg(new_cases) as avg_case 
from CovidDeaths
where location = 'India'
group by continent

select * from CovidDeaths


select * from CovidDeaths
where location like 'A%'

select * from CovidDeaths
where continent like 'A_ia'

select * from CovidDeaths
where continent like '%a%'

--Return all customers that ends with the pattern 'a':
select * from CovidDeaths
where location like '%a'

--Return all customers that contains the pattern 'dia':
select * from CovidDeaths
where location like '%dia%'

--Using the _ Wildcard
--The _ wildcard represents a single character.

--It can be any character or number, but each _ represents one, and only one, character.

select * from CovidDeaths
where location like '_ndia'

select * from CovidDeaths
where location like 'I___a'

select * from CovidDeaths
where location like '[AIC]%'

select * from CovidDeaths
where location like '%[and]'

--The - wildcard allows you to specify a range of characters inside the [] wildcard.
select * from CovidDeaths
where location like '[a-f]%'

select * from CovidDeaths
where location in ('India' , 'Afghanistan','Burundi')


select * from CovidDeaths
where location  not in ('India' , 'Afghanistan','Burundi')

select * from CovidDeaths
where location in (select location from CovidVaccinations$)

select * from CovidDeaths
where new_cases between 50 and 100

select * from CovidDeaths
where new_cases NOT between 50 and 100

select * from CovidDeaths
where new_cases between 50 and 100
and location in ('India')

select * from CovidDeaths
where 'date' between 2020-03-20 and 2020-03-28

--Then, we can create the following SQL statement (that contains an INNER JOIN), that selects records that have matching values in both tables:

select d.location , d.continent,v.new_tests
from CovidDeaths as d
inner join CovidVaccinations$  as v on d.location = v.location


select d.location,d.new_cases from CovidDeaths as d 
left outer join CovidVaccinations$ as v on 
d.continent = v.continent

select location from CovidDeaths
union ALL
select location from CovidVaccinations$


SELECT count(DISTINCT LOCATION) as total_loc FROM CovidDeaths

select distinct(continent) , sum(total_cases)
from CovidDeaths
group by continent

select distinct(location) , avg(cast((new_deaths) as int)) AS DEATHS
from CovidDeaths
group by location

SELECT * FROM  CovidDeaths

SELECT continent , SUM(total_cases) AS TOTAL_CASES
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent


SELECT location , Sum(total_cases) as TOTAL_CASES , count(location) as TOTAL_LOC
from CovidDeaths
group by location
having sum(total_cases) > 10000
order by location desc


create procedure select_all
as
select * from CovidDeaths
go

exec select_all


create procedure select_all_customer @location nvarchar(30)
as
select * from CovidDeaths where location = @location
go

exec select_all_customer @location = 'India'



create database Customers

use Customers
go


create table Customer_info(
personID int,
FirstName varchar(30),
LastName varchar(30),
Address nvarchar(30),
City varchar(30)
)

insert into Customer_info values 
(2, 'Jane', 'Smith', '456 Elm St', 'Los Angeles'),
(3, 'Michael', 'Johnson', '789 Oak St', 'Chicago'),
(4, 'Emily', 'Davis', '321 Pine St', 'Houston'),
(5, 'Daniel', 'Martinez', '654 Cedar St', 'Phoenix'),
(6, 'Sarah', 'Garcia', '987 Birch St', 'Philadelphia'),
(7, 'David', 'Rodriguez', '147 Walnut St', 'San Antonio'),
(8, 'Emma', 'Lopez', '258 Maple St', 'San Diego'),
(9, 'James', 'Hernandez', '369 Cherry St', 'Dallas'),
(10, 'Olivia', 'Gonzalez', '741 Spruce St', 'San Jose'),
(11, 'Ethan', 'Wilson', '852 Ash St', 'Austin'),
(12, 'Sophia', 'Anderson', '963 Magnolia St', 'Jacksonville'),
(13, 'Alexander', 'Thomas', '159 Sycamore St', 'San Francisco'),
(14, 'Isabella', 'Taylor', '357 Palm St', 'Columbus'),
(15, 'Mason', 'Moore', '753 Willow St', 'Charlotte'),
(16, 'Mia', 'Jackson', '951 Redwood St', 'Indianapolis'),
(17, 'Lucas', 'White', '159 Cypress St', 'Seattle'),
(18, 'Ava', 'Harris', '357 Juniper St', 'Denver'),
(19, 'Benjamin', 'Clark', '753 Poplar St', 'Washington'),
(20, 'Charlotte', 'Lewis', '951 Fir St', 'Boston'),
(21, 'Liam', 'Walker', '159 Alder St', 'Nashville'),
(22, 'Amelia', 'Hall', '357 Dogwood St', 'El Paso'),
(23, 'Noah', 'Allen', '753 Mahogany St', 'Detroit'),
(24, 'Harper', 'Young', '951 Bamboo St', 'Memphis'),
(25, 'Elijah', 'King', '159 Banyan St', 'Oklahoma City'),
(26, 'Abigail', 'Wright', '357 Hickory St', 'Las Vegas'),
(27, 'William', 'Scott', '753 Sequoia St', 'Louisville'),
(28, 'Evelyn', 'Green', '951 Acacia St', 'Baltimore'),
(29, 'Henry', 'Adams', '159 Cottonwood St', 'Milwaukee'),
(30, 'Grace', 'Baker', '357 Sassafras St', 'Portland');

select * from Customer_info

ALTER TABLE Customer_info
Alter COLUMN Address VARCHAR(50);



