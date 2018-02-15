create table Test(id integer, title varchar(100));
insert into Test(id, title) values(1, "Hello");
select * from Test;
-- Your code here!

#join
#1.find employees who work in London
SELECT e.first_name, e.last_name, e.job_id, e.department_id FROM employees AS e
INNER JOIN departments AS d 
ON e.department_id = d.department_id
JOIN locations AS l
ON d.location_id = l.location_id
WHERE l.city = "London";

#2.find employees name and their manager's name
SELECT e.employee_id, e.last_name AS employee_name, e.manager_id,
m.last_name AS manager_name FROM employees AS e
LEFT JOIN employees AS m
ON e.manager_id = m.employee_id;

#3.Find employees hired after Jones
SELECT e.first_name, e.last_name, e.hire_date FROM employees AS e
LEFT JOIN employees AS f
ON f.last_name = "Jones"

#4.get department_name, # of employees in that department
SELECT d.department_name, COUNT(*) AS number of employees FROM departments AS d 
RIGHT JOIN employees AS e 
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY d.department_name;

#5.find all inform in department 90
SELECT e.employee_id, e.job_id, j.end_date - j.start_date AS number of days hired
FROM employees AS e 
JOIN job_history
WHERE j.department_id = 90;

#6.display department_id, name, and first name of manager
SELECT d.department_id, d.department_name, d.manager_id, e.first_name AS manager_name
FROM departments AS d 
LEFT JOIN employees AS e 
ON d.manager_id = e.employee_id;
@@@@notice there are extra departments not exists in employees table
@@@@use left join will return NULL for extra departments

#7.display department_name, manager_name, city
SELECT d.department_name, e.first_name + " " + e.last_name AS manager_name l.city 
FROM departments AS d 
INNER employees AS e 
ON d.department_id = e.department_id
INNER JOIN locations AS l
ON d.location_id = l.location_id;

#8.job_title and avg salary
SELECT e.job_id, jobs.job_name, AVG(e.salary) FROM employees AS e
INNER JOIN jobs
ON e.job_id = jobs.job_id
GROUP BY e.job_id
ORDER BY jobs.job_name;

#9.display job title, e.name, difference between salary and min salary for this job
SELECT j.job_name, e.employee_name, e.salary - (SELECT MIN(j.salary) FROM employees AS j
                                                 GROUP BY j.job_id)
FROM employees AS e;

#10.display job-history who earns more than 10000
SELECT j.* FROM job_history AS j 
INNER JOIN employees AS e 
ON j.employee_id = e.employee_id
WHERE e.salary >10000;

#11.display d_name, name, hire_date, salary for managers who has more than 15 years experience
SELECT e.first_name, e.last_name, e.hire_date, e.salary, d.department_name 
FROM employees AS e 
INNER JOIN departments AS d 
ON e.employee_id = d.manager_id
INNER JOIN job_history AS j 
ON j.employee_id = e.employee_id
WHERE YEAR(j.end_date- j.start_date) >= 15;
