USE mta_employee;
-- INSPECT TABLE
SELECT
*
FROM
mta_employee;

-- UPDATE TEXT TO DATE
UPDATE  `mta_employee`
SET `Start Date`=str_to_date(`Start Date`,'%m/%d/%Y');

-- CREATING A COLUMN EMPLOYEE STATUS
with STATUS as(SELECT 
    *,
    CASE 
         WHEN `Separation Date` IS NULL 
                 OR `Separation Date` = '' 
            THEN 'Current Employee'
        ELSE 'Past Employee'
    END AS `EMPLOYEE STATUS`
FROM `mta_employee`)
-- how many employees with different title are in each Agency,
SELECT `Working Agency`,`Title`,count(*) as Total
from
STATUS
WHERE
`EMPLOYEE STATUS`='Current Employee'
group by `Working Agency`,`Title`
LIMIT 100;

CREATE VIEW employee_status AS
SELECT *,
       CASE 
         WHEN `Separation Date` IS NULL OR `Separation Date` = '' 
         THEN 'Current Employee'
         ELSE 'Past Employee'
       END AS `EMPLOYEE STATUS`
FROM `mta_employee`;

-- CHECKING ONLY how many employee are in each agency
SELECT
`Working Agency`, COUNT(*) AS Present_Employee_No
FROM
employee_status
WHERE
`EMPLOYEE STATUS`='Current Employee'
group by `Working Agency`;

-- WHICH WORKING TITLE MAKES THE HIGHEST MONEY
SELECT `TITLE`, round(SUM(`Total Earnings`),2) AS `Total Earnings`
FROM
mta_employee
group by TITLE
ORDER BY SUM(`Total Earnings`) DESC
LIMIT 1;

-- CONDUCTORS MAKE THE MOST MONEY


-- which agency pays most overtime to employee
SELECT 
`Working Agency`, count(*) as Total_Over_Time_paid
FROM
mta_employee
where `Overtime Pay` >0
group by `Working Agency`
order by count(*)  DESC;
-- NYC TRANSIT AUTHORITY GIVES MOST OVER TIME TO THEIR EMPLOYEE

-- Overtime Dependency by Agency
SELECT 
    `Working Agency`,
    ROUND(SUM(`Overtime Pay`) / SUM(`Total Earnings`) * 100, 2) AS overtime_pct
FROM mta_employee
GROUP BY `Working Agency`
ORDER BY overtime_pct DESC;

-- WHICH WORKING TITLE GETS THE MOST OVER TIME 
SELECT 
`TITLE`, count(*) as NUMBER_OF_EMPLOYEES_GOT_OVERTIME
FROM
mta_employee
where `Overtime Pay` >0
group by `TITLE`
order by count(*)  DESC;

-- Most Conductor gets overtime

-- Find which Title gets the most payment from overtime
SELECT 
`TITLE`, ROUND(avg(`Overtime Pay`),2) AS `Overtime Pay`

FROM
mta_employee
group by `TITLE`
order by avg(`Overtime Pay`) DESC;

-- 'Asst Supervisor 5% Diffl' makes most money from  overtime pay than any other title 


-- find top three employee for each agency who gets highest salary 
SELECT 
*
FROM(
SELECT 
NAME,`Working Agency`,`TITLE`,`Total Earnings`,
row_number() OVER(PARTITION BY `Working Agency` ORDER BY `Total Earnings` DESC) as Ranking
FROM
mta_employee) t
where Ranking <=3;

-- which employee gets high ratio of overtime payment from total pay for each agency
SELECT *
FROM 
(SELECT 
NAME,`Working Agency`,`TITLE`,`Total Earnings`,`Overtime Pay`, round( `Overtime Pay`*100/`Total Earnings`,2) as Ratio_Overtime_Payment,
row_number() over(partition by `Working Agency` order by ( `Overtime Pay`*100/`Total Earnings`) DESC) AS Ranking
from
mta_employee) T 
WHERE Ranking =1;

--  which employee is earning more from overtime earning than actual earning
SELECT 
NAME,`Working Agency`,`TITLE`,`Total Earnings`,
 ROUND((`Total Earnings`-`Overtime Pay`)*100/(`Total Earnings`),2) AS PERCENT_ACTUALPAY,
 ROUND((`Overtime Pay`)*100/(`Total Earnings`),2) AS PERCENT_OVERPAY
 FROM
 mta_employee

 order by (`Overtime Pay`*100/`Total Earnings`) desc;
 -- Certain employees derive a significant portion of their income from overtime
 --  indicating heavy reliance on extended working hours and potential staffing inefficiencies.

 