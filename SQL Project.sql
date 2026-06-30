select* from HR_Data

--Total No. pf employees
select count(*) employee
from HR_Data;

--No. of active employees vs terminated employees
select count(*) employees
from HR_Data
where employeestatus = 'active';

select count(*) employees
from HR_Data
where employeestatus = 'Terminated';

--employee distribution by department
SELECT
    departmentType,
    COUNT(*) AS employee_count
FROM HR_Data
GROUP BY departmentType
ORDER BY employee_count DESC;

--Employee distribution by job role
select 
Title,
count(*) AS Title_count
from HR_Data
group by Title
order by Title_count DESC;

--Gender distribution across the company 
select 
gendercode,
count(*) AS gender_count
from HR_Data
group by gendercode
order by gender_count desc;

--Which departments have the highest employee count?
select 
departmentType,
count(*) AS department_count
from HR_Data
group by departmentType
order by department_count desc;

--Average engagement score by department
SELECT DepartmentType,
       ROUND(AVG([Engagement_Score]),2) AS Avg_Engagement
FROM HR_Data
GROUP BY DepartmentType
ORDER BY Avg_Engagement DESC;

--Top 10 Highest training costs

SELECT TOP 10 Employee_ID,
       [Training_Cost]
FROM HR_Data
ORDER BY [Training_Cost] DESC;

--Avereage satisfaction score by gender
SELECT GenderCode,
       ROUND(AVG([Satisfaction_Score]),2) Avg_Satisfaction
FROM HR_Data
GROUP BY GenderCode;

--employees with highest performance
SELECT Employee_ID,
       Title,
       [Performance_Score]
FROM HR_Data
WHERE [Performance_Score]='Exceeds';

--Rank employees based on enagegement score 
SELECT Employee_ID,
       DepartmentType,
       [Engagement_Score],
       RANK() OVER(ORDER BY [Engagement_Score] DESC) Ranking
FROM HR_Data;

--Average training cost by training type
SELECT [Training_Type],
       ROUND(AVG([Training_Cost]),2) Avg_Cost
FROM HR_Data
GROUP BY [Training_Type];

--Employees whose engagement is above company average
SELECT Employee_ID,
       [Engagement_Score]
FROM HR_Data
WHERE [Engagement_Score] >
(
SELECT AVG([Engagement_Score])
FROM HR_Data
);

