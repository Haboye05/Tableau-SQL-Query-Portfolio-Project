🗂️ Dataset
The data used for this project comes from:

CovidDeaths$

CovidVaccinations$

These datasets were cleaned, filtered, and queried to answer key public health questions.

🔍 Key Analyses
✅ General Data Cleaning
Removed nulls in continent for more accurate filtering.

Sorted and organized data for trend analysis.

📈 Infection and Mortality Rates
Total Cases vs Total Deaths
Shows the likelihood of dying if infected per country.

Total Cases vs Population
Identifies what percentage of a population got infected over time.

Highest Infection Rates
Countries with the highest case count relative to their population.

Highest Death Count by Country & Continent
Raw and aggregated death numbers by location.

🌍 Global Numbers
Global total cases, deaths, and overall death rate percentage.

💉 Vaccination Analysis
Rolling vaccination totals by country using:

CTE (Common Table Expressions)

Temp Tables

SQL Views

Percentage of population vaccinated based on cumulative vaccine data.

🧪 SQL Techniques Used
Joins and subqueries

Window functions (OVER, PARTITION BY)

CTEs

Temp Tables

Views

Aggregate functions (SUM, MAX)

Type casting and conversion

🛠️ Tools
Microsoft SQL Server

SQL Server Management Studio (SSMS) or Azure Data Studio

Data visualization can be done using:

Tableau / Power BI (optional extension)

🧾 Output Example
The results provide:

Percentage of population infected

Death rates by country

Vaccination progress

Cleaned and ready-to-use views for visualization

🚀 Getting Started
Requirements
SQL Server installed locally

CovidDeaths$ and CovidVaccinations$ datasets imported into a database named Portfolio project

To Run:
Open the .sql file.

Execute section by section.

Use final views and queries for dashboarding or reporting.

📌 Future Improvements
Integration with visualization tools (Power BI or Tableau)

Automating data ingestion

Using stored procedures for automation

🧑‍💻 Author
Habeeb Oyediran
This project is part of my data analytics portfolio showcasing SQL-based data exploration.
