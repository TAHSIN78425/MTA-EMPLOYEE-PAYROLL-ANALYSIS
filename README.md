# 🚇 MTA EMPLOYEE Payroll Analysis (2025)
## 🎯 Business Problem

Public transportation agencies like the MTA manage large payroll budgets, including significant overtime expenses. Understanding how payroll is distributed across agencies, roles, and employees is critical to:

- Identify high-cost departments
- Detect overtime dependency
- Improve workforce efficiency and budgeting

This project aims to analyze payroll data to uncover cost drivers, inefficiencies, and compensation patterns across MTA agencies.
## 📊 Project Overview

This project analyzes the MTA Employee Payroll: Beginning 2025 dataset from New York Open Data.

The dataset contains detailed employee-level payroll information including:

- Regular Pay
- Overtime Pay
- Other Pay
- Total Earnings

Source: <a href='https://data.ny.gov/Transportation/MTA-Employee-Payroll-Beginning-2025/kcjb-nf3e/about_data'>MTA Employee Payroll Dataset (2025)</a>

According to the dataset description, it provides salary, overtime, and total earnings at the employee level, published under New York State transparency laws.
### 🛠 Tools Used
- SQL (MySQL) → Data cleaning, transformation, EDA
- Tableau → Dashboard & visualization
### 🧹 Data Cleaning

Performed in SQL:

- Converted text fields to proper date format (Start Date, Separation Date)
- Handled missing and invalid values (NULL, empty strings)
- Created derived column:
**Employee Status** → Current vs Past employees
- Addressed data limitations:
  No unique employee ID → used row-level records

### Exploratory Data Analysis (EDA)

Key analyses performed:

- Employee distribution across agencies and titles
- Payroll distribution (Total Earnings, Overtime Pay)
- Top earning employees per agency (using window functions)
    - Overtime-heavy roles and employees
    - Overtime ratio analysis:
    - % of earnings from overtime
- Agency-level comparisons:
   - Average payroll
   - Overtime contribution

 ## 📈 Dashboard

Built an interactive dashboard in Tableau with:
