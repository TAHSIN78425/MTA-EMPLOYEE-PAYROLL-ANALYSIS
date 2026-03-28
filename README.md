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
<img src='https://github.com/TAHSIN78425/images/blob/main/mta%20Dashboard.png'/>
### Average Payroll by Agency (Bar Chart)
   This chart compares the average total earnings per employee across different MTA agencies.
   It shows the average earnings of employees in each agency, helping identify which agencies have higher payroll costs.
### Titles with Highest Overtime Pay (Bar Chart)
   It Highlights job roles that receive the most overtime pay, indicating positions with higher workload or overtime dependency.
### Pay Distribution (Regular vs Overtime) (Stacked Bar Chart)
   Breaks down total earnings into regular pay and overtime pay, showing how employee compensation is structured.
### Top 10 Titles by Average Payroll (Bar Chart)
  Displays the highest-paying job titles based on average earnings, helping understand which roles are most expensive.
## 💡 Key Insights
- Overtime Dependency:
Certain roles rely heavily on overtime, contributing a large portion of total earnings
- High-Cost Agencies:
 Payroll expenses are concentrated in specific agencies, indicating budget concentration
- Overtime-Driven Earnings:
 Some employees earn a significant percentage of income from overtime, suggesting workload imbalance
- Role-Based Pay Differences:
 Operational roles (e.g. conductors,transit workers) show higher overtime involvement compared to administrative roles

## 📌 Recommendations
### 📉 Reduce Overtime Dependency
   Hire additional staff in overtime-heavy roles to lower excessive labor costs
### ⚙️ Optimize Workforce Allocation
   Redistribute workload across departments to improve efficiency
### 🔍 Monitor High Earners
   Investigate extreme overtime cases for potential inefficiencies or policy gaps
### 📊 Implement Overtime Controls
  Improve tracking and approval systems for overtime usage
