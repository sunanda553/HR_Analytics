create database HR;
use HR;
select * from hr.hr_1;
select * from hr.hr_2;
-- --------------------------------------------
-- Average Hourly Rate of Male Research Scientists
SELECT AVG(hr_1.HourlyRate) AS AvgHourlyRate
FROM hr_1
left join hr_2 ON hr_1.EmployeeNumber = hr_2.Employee_ID
WHERE hr_1.Gender = 'Male' AND hr_1.JobRole = 'Research Scientist';

-- -----------------------------------------------------------------
-- Avg Attrition Rate by Department
select department,
sum(case when attrition = 'yes' then 1 else 0 end)/count(*) * 100 as AvgAttritionRate 
from hr_1
group by department; 

-- ----------------------------------------------------------------
-- Attrition vs Monthly income stat
select hr_1.attrition,
avg(Hr_2.MonthlyIncome) as Avg_income,
min(Hr_2.MonthlyIncome) as Min_income,
Max(hr_2.Monthlyincome) as Max_income
from Hr_2 join Hr_1 on hr_1.EmployeeNumber = hr_2.Employee_ID
group by 1
;
-- -------------------------------------------------------------
-- Avg Working Year by each department
Select avg(hr_2.yearsAtCompany) as AvgWorkingYear,
hr_1.Department
from hr_1 join Hr_2 on hr_1.EmployeeNumber = hr_2.Employee_ID
group by hr_1.Department;

-- -----------------------------------------------
-- Job Role Vs Work Life Balance
select hr_1.JobRole,
avg(hr_2.workLifeBalance) as WorkLifeBalance
from hr_1 join Hr_2 on hr_1.EmployeeNumber = hr_2.Employee_ID
group by hr_1.JobRole;
-- ---------------------------------------------------------
-- Attrition Rate by Years Since Last Promotion
SELECT hr_2.YearsSinceLastPromotion,
       SUM(CASE WHEN hr_1.Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS AttritionRate
FROM hr_1
JOIN hr_2 ON hr_1.EmployeeNumber = hr_2.Employee_ID
GROUP BY hr_2.YearsSinceLastPromotion
order by 1;
-- --------------------------------------------------------------
-- Age Group wise Employee count (Extra Kpi)
SELECT CASE 
           WHEN Age < 30 THEN 'Under 30'
           WHEN Age BETWEEN 30 AND 40 THEN '30-40'
           WHEN Age BETWEEN 40 AND 50 THEN '40-50'
           ELSE '50 and Above'
       END AS AgeGroup, 
       COUNT(*) AS EmployeeCount
FROM hr_1
GROUP BY AgeGroup
ORDER BY EmployeeCount DESC;





