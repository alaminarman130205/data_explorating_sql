-- this shows of dying people percentage of a country in a week
select country, start_date, end_date, year, population, total_deaths,(total_deaths/population)*100 as Death_persantage
from dbo.all_weekly_excess_deaths
order by 1,2

--maximum death of a country and it's persentage in a week
select country, population, max(total_deaths) as maximum_death, max((total_deaths/population))*100 as Death_persantage
from dbo.all_weekly_excess_deaths
group by country, population
order by Death_persantage desc

-- minimum death of a country and it's persentage in a week
select country, population, min(total_deaths) as minimum_death, min((total_deaths/population))*100 as Death_persantage
from dbo.all_weekly_excess_deaths
group by country, population
order by Death_persantage 

-- total death in 2021 all country
select country, sum(total_deaths) as total_death_ina_year 
from dbo.all_weekly_excess_deaths
where year = 2021
group  by country 

-- total death in 2021,2022,2023
select  country, sum(total_deaths) as total_death_ina_year
from dbo.all_weekly_excess_deaths
group  by country
order by total_death_ina_year 

--percentage of death cause by covid in every country in a weeks
select country, total_deaths, covid_deaths, (covid_deaths/total_deaths)*100 as people_died_covid_persentage
from dbo.all_weekly_excess_deaths
where total_deaths is not null
order by people_died_covid_persentage desc 

-- average death occur in differents country
select country, round(avg(total_deaths),1) as average_deaths
from dbo.all_weekly_excess_deaths
group by country
order by 1,2

-- total deaths all over the world
select country , round(sum(total_deaths),2) as totaldeath_per_country 
from dbo.all_weekly_excess_deaths
group by country 
order by 1,2
-- to know which city has the most of data here
select count(country), country from dbo.all_weekly_excess_deaths
group by country
order by count(country) desc;

-- total deaths of each country
SELECT country, total_deaths
FROM (
    SELECT country, SUM(total_deaths) AS total_deaths
    FROM dbo.all_weekly_excess_deaths
    GROUP BY country
) AS country_deaths
ORDER BY total_deaths DESC


-- covid deaths percentage group by date
select start_date ,sum(total_deaths), sum(covid_deaths) , sum(covid_deaths)/sum(total_deaths)*100 as covid_deaths_percentage
from dbo.all_weekly_excess_deaths
group by start_date
order by 1,2




