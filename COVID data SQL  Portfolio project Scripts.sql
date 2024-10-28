
SELECT * 
FROM [Portfolio project]..['CovidDeaths $']
WHERE Continent is not NULL
ORDER BY 3,4

--Select *
--FROM [Portfolio project]..CovidVaccinations$
--ORDER BY 3,4

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM [Portfolio project]..['CovidDeaths $']
WHERE continent is not NULL
ORDER BY 1,2


-- Focus on Total Cases vs Total Deaths
--Displays the likelihood of contracting COVID-19 in your country.

SELECT Location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM [Portfolio project]..['CovidDeaths $']
WHERE Location LIKE '%states%'
And continent is not NULL
ORDER BY 1,2


--Focus on Total Cases vs Population
--Display percentage of population that contracted covid

SELECT Location, date, population, total_cases, (total_cases/population)*100 as PercentagePopulationInfected 
FROM [Portfolio project]..['CovidDeaths $']
--WHERE Location LIKE '%states%'
ORDER BY 1,2

--Focus on Countries with highest infection rate compared to Population

SELECT Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentagePopulationInfected
FROM [Portfolio project]..['CovidDeaths $']
--WHERE Location LIKE '%states%'
GROUP BY Location, Population
ORDER BY PercentagePopulationInfected desc;

--Display Countries with Highest Death Count per Population

SELECT Location, MAX(CAST(Total_deaths AS INT)) AS TotalDeathCount 
FROM [Portfolio project]..['CovidDeaths $']
--WHERE Location LIKE '%states%'
WHERE Continent is not NULL
GROUP BY Location
ORDER BY TotalDeathCount desc;



--Let'a organise the data by Continent

--Dispaly Continents with the highest death count per population

SELECT continent, MAX(CAST(Total_deaths AS INT)) as TotalDeathCount 
FROM [Portfolio project]..['CovidDeaths $']
--WHERE Location LIKE '%states%'
WHERE continent is not NULL
GROUP BY continent
ORDER BY TotalDeathCount desc;


--GLOBAL NUMBERS


SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths as int)) AS total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 AS DeathPercentage
FROM [Portfolio project]..['CovidDeaths $']
--Where location like '%states%'
WHERE continent is not null 
--Group By date
ORDER BY 1,2



-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
CONVERT(BIGINT, SUM(CASE 
WHEN vac.new_vaccinations IS NOT NULL 
THEN CONVERT(int, vac.new_vaccinations) 
    ELSE 0 
END) OVER (PARTITION BY dea.location ORDER BY dea.date)) AS RollingPeopleVaccinated
--, (CONVERT(BIGINT, RollingPeopleVaccinated) / dea.population) * 100 AS VaccinationPercentage
FROM [Portfolio project]..['CovidDeaths $'] dea
JOIN [Portfolio Project]..[CovidVaccinations$] vac
   ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL 
ORDER BY 2, 3;


--USE CTE

WITH PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated) AS
(
    SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
        SUM(CONVERT(BIGINT, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
    FROM [Portfolio project]..['CovidDeaths $'] dea
    JOIN [Portfolio Project]..[CovidVaccinations$] vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
)
SELECT *, (CONVERT(BIGINT, RollingPeopleVaccinated) / CONVERT(BIGINT, Population)) * 100 AS VaccinationPercentage
FROM PopvsVac;


--TEMP TABLE

DROP TABLE IF EXISTS #PercentagePopulationVaccinated;

CREATE TABLE #PercentagePopulationVaccinated
(
    Continent NVARCHAR(255),
    Location NVARCHAR(255),
    Date DATETIME,
    Population BIGINT,
    New_Vaccinations BIGINT,
    RollingPeopleVaccinated BIGINT
);

INSERT INTO #PercentagePopulationVaccinated
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(CONVERT(BIGINT, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
FROM [Portfolio project]..['CovidDeaths $'] dea
JOIN [Portfolio Project]..[CovidVaccinations$] vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL;

SELECT *, (RollingPeopleVaccinated / Population) * 100 AS VaccinationPercentage
FROM #PercentagePopulationVaccinated;


--Creating diplay to store data for later visulaisations

CREATE VIEW PercentPopulationVaccinated as
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(CONVERT(BIGINT, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
FROM [Portfolio project]..['CovidDeaths $'] dea
JOIN [Portfolio Project]..[CovidVaccinations$] vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL;
--ORDER BY 2,3


SELECT *
FROM PercentPopulationVaccinated