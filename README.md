# Pewlett-Hackard-Analysis

## Analysis Overview

The following company gave access employee information, which included data for each employee; included but not limited to: department information, salaries, and job titles as located in the [Resources](/Resources/) folder. Information across these data sets shared several common keys that were utilized through PostgreSQL to extract per the analysis. 

The goal of this analysis is to determine the total titles of employees retiring and to determine employees who are eligible for the company's mentorship program. 

## Results

Three tables were created in the initial phase to determine the total of retiring employees' titles. [retirement_titles](/Resources/data/retirement_titles.csv) then [unique_titles](/Resources/data/unique_titles.csv) and finally [retiring_titles](/Resources/data/retiring_titles.csv). 

The queries in [Employee_Database_challenge.sql](/Employee_Database_challenge.sql) show steps to determine the total number of titles of those in retirement range. The most important one being needing to filter by an employee's most recent title, as per line 18 `SELECT DISTINCT ON (emp_no) emp_no`. 

The completed table in [retiring_titles](/Resources/data/retiring_titles.csv) displays as follows: 

![Retiring Titles](/Resources/screenshots/retiringtitles.png)

We see that the vast majority in this case that are in retirement range, as expected, are senior titles: Senior Engineer, and Senior Staff. The fewest retiring are leading roles such as Manager at only two individuals. 

In determining those who were of eligible age for the mentorship, the usage of `INNER JOIN` was applied to the [employees](/Resources/data/employees.csv), [dept_emp](/Resources/data/dept_emp.csv), and [titles](/Resources/data/titles.csv) tables as they shared the same key in `emp_no`. In yielding the final table [mentorship_eligibilty](/Resources/data/mentorship_eligibilty.csv), the following was shown: 

![Mentorship Eligibility](/Resources/screenshots/mentorship.png)

There are 1549 unique employees as seen in this query that are currently eligible for a mentorship program at this company. 

## Summary

The following query, `SELECT COUNT (title) FROM unique_titles` allows us to see that there are 72458 positions across seven positions in the company. There would need to be a decision that would assist in making the transition period more seamless, while the part-time mentorship program is powerful, aggressive hiring and promotions may need to take place if so many are retiring so soon. 

Performing a similar query to the first problem to the [mentorship_eligibilty](/Resources/data/mentorship_eligibilty.csv) table to find title counts reveals that of those 1549 eligible, there are similar proportions to those seen in the retiring titles. Depending on how many employees the company is looking to onboard, they may need to seek additional mentors as the proportion is almost 1:50 of mentor to new hire/mentee. 