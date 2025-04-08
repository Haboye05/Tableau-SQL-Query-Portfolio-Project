**COVID-19 Data Exploration with SQL**

This project explores global COVID-19 trends using real-world data. Using SQL, I extracted meaningful insights about case numbers, deaths, and vaccination progress by country and over time. The analysis answers key public health questions through structured queries and organized views.

**🗂️ Dataset**

The data used for this project comes from: [Our World in Data - COVID-19](https://ourworldindata.org/covid-deaths)

- **CovidDeaths$**
- **CovidVaccinations$**

These datasets were cleaned, filtered, and queried to answer key public health questions.

**🔍 Key Analyses**

**✅ General Data Cleaning**
- Removed `NULL` values in the `continent` column for accurate filtering.
- Sorted and organized by date and country for trend analysis.

**📈 Infection and Mortality Rates**
- **Total Cases vs Total Deaths:** Shows the likelihood of dying if infected in a country.
- **Total Cases vs Population:** Percentage of the population infected over time.
- **Highest Infection Rates:** Countries with highest infection per capita.
- **Death Count by Country & Continent:** Aggregated total deaths.


**🌍 Global Numbers**
- Global case and death totals.
- Overall global death rate percentage.


**💉 Vaccination Analysis**
- Rolling vaccination totals per country.
- Percentage of population vaccinated using:
  - CTEs (Common Table Expressions)
  - Temp Tables
  - SQL Views


**🧪 SQL Techniques Used**
- Joins and subqueries
- Window functions (`OVER`, `PARTITION BY`)
- CTEs
- Temp Tables
- Views
- Aggregate functions (`SUM`, `MAX`)
- Type casting and data conversion


**🛠️ Tools**
- **Microsoft SQL Server**
- **SQL Server Management Studio (SSMS)** or **Azure Data Studio**

*Optional Data Visualization*:
- Tableau
- Power BI


**🧾 Output Example**
- % Population Infected
- Death Rates by Country
- Rolling Vaccination Totals
- Cleaned SQL Views ready for dashboard integration


**🚀 Getting Started**

**Requirements**
- Microsoft SQL Server installed locally
- Datasets: `CovidDeaths$` and `CovidVaccinations$` imported into a database called `Portfolio project`

**To Run**
- Open the `.sql` file
- Run queries section by section
- Use created views for visualization or reporting


**📌 Future Improvements**
- Integrate with Power BI or Tableau dashboards
- Automate data ingestion pipelines
- Use stored procedures for dynamic reporting


**🧑‍💻 Author**
**Habeeb Oyediran**  
This project is part of my data analytics portfolio, showcasing practical SQL techniques and real-world public health insights.
