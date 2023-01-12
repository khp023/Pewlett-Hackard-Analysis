-- Creation of retirement_titles table
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

SELECT * FROM retirement_titles

-- Creation of unique_titles table
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

-- Creation of retiring_titles table
SELECT COUNT(title) as titlecount, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY titlecount DESC;

SELECT * FROM retiring_titles

-- Creation of membership_eligibility table
SELECT DISTINCT ON (employees.emp_no) employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	employees.birth_date, 
	dept_emp.from_date, 
	dept_emp.to_date,
	titles.title
INTO membership_eligibility 
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (dept_emp.to_date = '9999-01-01')
ORDER BY emp_no ASC;

SELECT * FROM membership_eligibility

-- Additional exploratory query
SELECT COUNT(title) as titlec, title
INTO membership_eligibility_titles
FROM membership_eligibility
GROUP BY title
ORDER BY titlec DESC;

SELECT * FROM membership_eligibility_titles
