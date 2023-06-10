/*Import the DATASET Human Resource.csv into MYSQL under projects*/

SELECT * FROM projects.hr;
/*Correcting Column Heading*/
ALTER TABLE projects.hr
CHANGE COLUMN id emp_id VARCHAR(20) NULL;
/*To see changes in the Column name of table*/
DESCRIBE projects.hr

SELECT birthdate FROM projects.hr;
/*Setting Security Feature to 0 so when amending certain things in database*/
SET sql_safe_updates = 0;
/*Formatting the Date Format from DD-MM-YYY to YYYY-MM-DD*/
UPDATE projects.hr
SET birthdate = CASE 
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%d/%m/%Y'),'%Y-%m-%d')
ELSE NULL
END;

SELECT birthdate FROM projects.hr
/*Amend the data type birthdate column*/
ALTER TABLE projects.hr
MODIFY COLUMN birthdate DATE NULL
/*Check the results*/
DESCRIBE projects.hr

SELECT * FROM projects.hr;

UPDATE projects.hr
SET hire_date = CASE 
WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%d/%m/%Y'),'%Y-%m-%d')
ELSE NULL
END;

ALTER TABLE projects.hr
MODIFY COLUMN hire_date DATE NULL

SELECT * FROM projects.hr;

SELECT termdate 
FROM projects.hr;

UPDATE projects.hr
SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate !='';

UPDATE projects.hr
SET termdate = '0000-00-00'
WHERE termdate IS NULL OR termdate = '';

DESCRIBE projects.hr;

ALTER TABLE projects.hr
MODIFY column termdate date;

ALTER TABLE projects.hr
ADD COLUMN age INT;

UPDATE projects.hr
SET age = TIMESTAMPDIFF(YEAR,birthdate,CURDATE());

SELECT birthdate, age
FROM projects.hr

SELECT 
MIN(age) AS youngest,
MAX(age) AS oldest
FROM projects.hr;

SELECT count(*) FROM projects.hr
WHERE age<18;

/*QUESTIONS*/

-- Q1. What is the gender breakdown of employees?

SELECT gender,
COUNT(*) AS TotalCount
FROM projects.hr
GROUP BY gender;

SELECT gender,
COUNT(*) AS TotalCount
FROM projects.hr
WHERE age>18 AND termdate = '0000-00-00'
GROUP BY gender;

SELECT * FROM projects.hr;

-- Q2. What is the race ethnicity breakdown of employees in the company?
SELECT race,
COUNT(*) AS TotalCount
FROM projects.hr
WHERE age>18 AND termdate = '0000-00-00'
GROUP BY race
ORDER BY race DESC;

-- Q3. What is the age distribution of employees in the company?
SELECT 
MIN(age) AS youngest,
MAX(age) AS oldest 
FROM projects.hr
WHERE age>18 and termdate = '0000-00-00';

SELECT 
CASE
WHEN age >= 18 AND age<=24 THEN '18-24'
WHEN age >=25 AND age <=34 THEN '25-34'
WHEN age >= 35 AND age <=44 THEN '35-44'
WHEN age >= 45 AND age <=54 THEN '45-54'
WHEN age >= 55 AND age <=64 THEN '55-64'
ELSE '65+'
END AS age_group,
COUNT(*) AS count
FROM projects.hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY age_group
ORDER BY age_group;

-- GENDER
SELECT 
CASE
WHEN age >= 18 AND age<=24 THEN '18-24'
WHEN age >=25 AND age <=34 THEN '25-34'
WHEN age >= 35 AND age <=44 THEN '35-44'
WHEN age >= 45 AND age <=54 THEN '45-54'
WHEN age >= 55 AND age <=64 THEN '55-64'
ELSE '65+'
END AS age_group, gender,
COUNT(*) AS count
FROM projects.hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY age_group, gender
ORDER BY age_group, gender;

SELECT * FROM projects.hr;

-- Q4. How many employees work at headquarters versus remote locations?
SELECT location,
COUNT(*) AS COUNT
FROM projects.hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY location

-- Q5. What is the average length of employment for employees who have been terminated?

SELECT 
ROUND(AVG(DATEDIFF(termdate, hire_date))/365,0) AS avg_length_employement
FROM projects.hr
WHERE termdate <= CURDATE() AND termdate <> '0000-00-00' AND age >=18;

-- Q6. How does the gender distribution vary across departments and job titles?

SELECT department,gender,jobtitle,
COUNT(*) AS count
FROM projects.hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY 1,2,3
ORDER BY 1;

SELECT department,gender,
COUNT(*) AS count
FROM projects.hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY 1,2
ORDER BY 1;

-- Q7. What id the distribution of job titles across the company?

SELECT jobtitle,
COUNT(*) AS count
FROM projects.hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY 1
ORDER BY 1 DESC;

-- Q8. Which department has the highest turnover rate?

SELECT * FROM projects.hr;

SELECT department,
total_count,
terminated_count,
terminated_count/total_count AS Termination_Rate
FROM ( SELECT department,
COUNT(*) AS TOTAL_COUNT,
SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminated_count
FROM projects.hr
WHERE age>18
GROUP BY department
)
AS subquery
ORDER BY termination_rate DESC;

-- Q9. What is the distribution of employees across locations by city and state?
SELECT location_city,
location_state,
COUNT(*) AS COUNT
FROM projects.hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY location_state
ORDER BY count DESC;

-- Q10. How has the company's employee count changed over time based on hire and term dates?
SELECT * FROM projects.hr
/* This Code is not running beacuse of either of Outdated MySQL version or due to syntax issue 1064 near SELECT*/

SELECT 
year,
hires,
terminations,
hires - termination AS net_change,
((hires - terminations) / terminations * 100) AS net_change_percent
FROM(
SELECT 
year(hire_date) AS year,
COUNT(*) AS hires,
SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations
FROM projects.hr
WHERE age >= 18
GROUP BY year(hire_date)
) AS subquery
ORDER BY year ASC;

SELECT
  year,
  hires,
  terminations,
  hires - terminations AS net_change,
  ((hires - terminations) / hires * 100) AS net_change_percent
FROM (
  SELECT
    YEAR(hire_date) AS year,
    COUNT(*) AS hires,
    SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations
  FROM projects.hr
  WHERE age >= 18
  GROUP BY YEAR(hire_date)
) AS subquery
ORDER BY year ASC;

-- Q11. What is the tenure distribution for each department?

SELECT * FROM projects.hr

/* Same code but not running beacuse of Error Code 1064 near SELECT*/
SELECT
department,
DATEDIFF(termdate, hire_date)/365 * 100
FROM projects.hr
WHERE termdate <= CURDATE() AND termdate <> '0000-00-00'
GROUPY BY department;

SELECT
department,
ROUND(AVG(DATEDIFF(termdate, hire_date)/365),0) AS AVG_tenure
FROM projects.hr
WHERE termdate <= CURDATE() AND termdate <> '0000-00-00'
GROUP BY department;