# Complete-MySQL-Power-BI-HR-Employee-Distribution-Dashboard
Hello Data Folks, This is a complete project on HR Employee Distribution.
This project is associated with HR Employee Distribution of a company who is having more than 22000 employees. So, lets deep dive into the project and perform some analysis on this data set.

![HR Dashboard](https://github.com/pritishgp/Complete-MySQL-PowerBI-HR-Employee-Distribution-Dashboard/assets/133867934/4809a0da-30b3-42a7-a83f-f2dbf4603f27)
![HR dashboard 2](https://github.com/pritishgp/Complete-MySQL-PowerBI-HR-Employee-Distribution-Dashboard/assets/133867934/49ae4a72-b224-405a-b94b-8f42cf1145e3)

Tools Used for Data Cleaning, Analysis and Visualization - MySQL, Power BI

About Data Set - Data has been sourced from "Her Data Project" which contains HR data with over 22000 rows from the year 2000 to 2020.

Operations Performed:
i) Data Cleaning
ii) Data Transformation
iii) Data Modelling
iv) Data Visualization
v) Data Insights
For the project data was imported into MySQL Server and then data cleaning and transformation was performed. Then as per set of questions to be answered data was saved in the form of .csv files
Then data in .csv files was loaded into Power BI for interactive visuals which included stacked bar charts, line charts, pie charts, maps charts etc.

QUESTIONS
Q1. What is the gender breakdown of employees in the company?
Q2. What is the race/ethnicity breakdown of employees in the company?
Q3. What is the age distribution of employees in the company?
Q4. How many employees work at headquarters versus remote locations?
Q5. What is the average length of employment for employees who have been terminated?
Q6. How does the gender distribution vary across departments and job titles?
Q7. What is the distribution of job titles across the company?
Q8. Which department has the highest turnover rate?
Q9. What is the distribution of employees across locations by state?
Q10. How has the company's employee count changed over time based on hire and term dates?
Q11. What is the tenure distribution for each department?

DATA INSIGHTS
1. The average length of employment for terminated employees is around 8 years.
2. Number of Male employees are the highest in the organization.
3. The youngest employee is aged 20 years old and oldest employee is aged 57 years old.
4. 3/4th of the employees work at the Headquarters versus remotely.
5. Large Number of employees belong to the state of Ohio.
6. The net change percent of employees has been incresing from past many years.
7. The gender distribution across departments is balanced quitely but there are generally more male than female employees.
8. Most of the employees in the organization belong to age group of 25-34 followed by 35-44 age group while the smallest group was 55-64.
9. Large number of employees belong to the Engineering department followed by Accounting and Human Resources department.
10. The average tenure for each department is about 8 years with Legal and Auditing having the highest and Services, Sales and Marketing having the lowest.

Note - 
a) I was using an outdated version of MySQL on my system which prompted that some of the features in MySQL would not be working appropriately. I had to amend multiple syntaxes during this project and had to rewrite the code just to get an output.
b) Also, the dataset sourced was already corrected in DD-MM-YYYY format in birthdate and hire_date column due to which the results were little bit different.
c) The data had some records which depicted negative ages therefore data was filteree using emmployees who were having age greater than > 18 and records of 967 employees were excluded.
d) Some termdates were showing of future therefore the only term dates used were those less than or equal to the current date. The only term dates used were those less than or equal to the current date. 1599 records were also excluded while analysing the dataset.

It was a great learning experience and an amazing project to work on with major focus on data cleaning, transformation and visualization using SQL and Power BI.

Kindly Share your suggestions and feedbacks too help me improve theses dashboards.

A big thank you to "Her data Project" for this whole project.
