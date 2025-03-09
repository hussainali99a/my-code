use Portfolio_project
go

-- checking the imported data  
select * from CovidDeaths$ 
 
select * 
from CovidDeaths$
order by 3,4

select * 
from CovidVaccinations$
order by 3,4

-- select data that we are going to be using

select location,date,total_cases,new_cases,total_deaths,population 
from CovidDeaths$
order by 1,2

-- looking at total_cases vs total_deaths
-- shows the likelihood of dying if you contract covid in your country
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths$
order by 1,2

select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths$
where location like '%states%'
and continent is not null
order by 1,2


select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths$
where location = 'India'
order by 1,2

-- looking at the total_cases vs population
-- shows what percentage of population got covid
select location,date,total_cases,population,(total_deaths/population)*100 as DeathPercentage
from CovidDeaths$
where location like '%states%'
order by 1,2

select location,date,total_cases,population,(total_deaths/population)*100 as DeathPercentage
from CovidDeaths$
where location like '%India%'
order by 1,2

--looking at countries with highest infection rate compared to population
-- highest infection rate

select location,max(total_cases) as HighestInfectionCount ,population,Max((total_deaths/population))*100 as PercentPopulationInfected
from CovidDeaths$
--where location like '%India%'
where continent is not null
group by location , population
order by PercentPopulationInfected desc

-- showing the countries with highest death count perpopulation
select location , max(total_cases) as TotalDeathCount
from CovidDeaths$  
--where location like '%India%'
where continent is not null
group by location
order by TotalDeathCount desc

--select * 
--from CovidDeaths$
--where continent is not null
--order by 3,4


-- lets break things down by continent


select continent, max(total_cases) as TotalDeathCount
from CovidDeaths$  
--where location like '%India%'
where continent is not null
group by continent
order by TotalDeathCount desc

 


select location, max(total_cases) as TotalDeathCount
from CovidDeaths$  
where continent is null
group by location
order by TotalDeathCount desc 


-- by continents
 select continent, max(total_cases) as TotalDeathCount
from CovidDeaths$  
--where location like '%India%'
where continent is not null 
group by continent
order by TotalDeathCount desc 


-- Showing the continents with the highest death counts
select continent, max(total_cases) as TotalDeathCount
from CovidDeaths$  
where continent is not null
group by continent
order by TotalDeathCount desc


--Globals numbers(Across the world)
SELECT 
    date, 
    SUM(new_cases) as total_cases, 
    SUM(CAST(new_deaths AS INT)) as total_deaths ,
	SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 as DeathPercentage
FROM CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY date
order by 1,2



--Total deaths over the world
SELECT 
     
    SUM(new_cases) as total_cases, 
    SUM(CAST(new_deaths AS INT)) as total_deaths ,
	SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 as DeathPercentage
FROM CovidDeaths$
WHERE continent IS NOT NULL
--GROUP BY date
order by 1,2


--looking at total population vs vaccinatin
select dea.continent , dea.location , dea.date , dea.population , vac.new_vaccinations
from CovidDeaths$ dea
join CovidVaccinations$ vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3


select dea.continent , dea.location , dea.date , dea.population , vac.new_vaccinations
,sum(cast(vac.new_vaccinations as int)) over(partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccinated
from CovidDeaths$ dea
join CovidVaccinations$ vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3

-- use cte

with popvsva(continent , location , date , population ,New_vaccinations, RollingPeopleVaccinated)
as
(
select dea.continent , dea.location , dea.date , dea.population , vac.new_vaccinations
,sum(cast(vac.new_vaccinations as int)) over(partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccinated
from CovidDeaths$ dea
join CovidVaccinations$ vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
select * , (RollingPeopleVaccinated/population)*100
from popvsva 

-- temp table
drop table if exists #PercentPopulationVaccinated2
Create Table #PercentPopulationVaccinated2
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated2
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths$ dea
Join CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated2


--creating view to store data for later visualization

create view PercentPopulationVaccinated2 as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths$ dea
Join CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

select * from 
PercentPopulationVaccinated2

