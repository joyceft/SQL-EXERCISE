create table Test(id integer, title varchar(100));
insert into Test(id, title) values(1, "Hello");
select * from Test;
-- Your code here!

#subquery
#1.
SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees
                WHERE last_name IN "Bull");
#2.
SELECT first_name, last_name FROM employees
WHERE department_id = (SELECT department_id FROM departments
                       WHERE department_name IN "IT");
#3.
SELECT first_name, last_name FROM employees
WHERE manager_id = (SELECT employee_id FROM employees
                    WHERE department_id = (SELECT department_id FROM departments
                                           WHERE location_id = (SELECT location_id FROM locations
                                                                WHERE country_id IN "US")));
                                                                
#4
SELECT first_name, last_name FROM employees
WHERE employee_id = (SELECT manager_id FROM employees);
#5
SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
#6
SELECT first_name, last_name, salary FROM employees
WHERE employees.salary = (SELECT min_salary FROM jobs
                WHERE employees.job_id = jobs.job_id);
#7.
SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
AND job_id LIKE "IT%"
#8.
SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees
                WHERE last_name = "Bell");
#9.
SELECT first_name, last_name, salary FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);
#10.
SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees
                WHERE job_id = "SH_CLERK")
ORDER BY salary;
#11.who is not supervisor?
SELECT e1.first_name, e1.last_name FROM employees AS e1
WHERE e1.employee_id NOT EXISTS (SELECT "X" FROM employees AS e2
                                 WHERE e2.manager_id =e1.employee_id);
#12.
SELECT e.employee_id, e.first_name, e.last_name, 
    SELECT(d.department_name FROM departments AS d
           WHERE e.department_id = d.department_id) 
FROM employees AS e
ORDER BY d.department_name;
#13.
SELECT employee_id, first_name, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees
                GROUP BY department_id);
#14.find the 5TH max salary
SELECT DISTINCT salary FROM employees AS e1
WHERE 5 = (SELECT COUNT(DISTINCT salary) FROM employees AS e2
           WHERE e2.salary >= e1.salary);
           
#15.fetch even numbered records from employees table选偶数行
SET @i = 0;
SELECT i, employee_id FROM
(SELECT @i: = @i + 1 AS i, employee_id FROM employees)
a WHERE MOD(a.1, 2) = 0;

#16. Find 4th min salary
SELECT DISTINCT salary FROM employees AS e1
WHERE 4 = (SELECT COUNT(DISTINCT salary) FROM employees AS e2
           WHERE e2.salary <= e1.salary);
#17.select the last 10 records
SELECT * FROM (SELECT * FROM employees
               ORDER BY employee_id DESC
               LIMIT 10) sub
ORDER BY employee_id ASC;

#18.get a list of d.id, d.name where no employee is working
SELECT d.department_id, d.department_name FROM departments AS d
WHERE d.department_id NOT IN (SELECT e.department_id FROM employees AS e)
 
#19.get max 3 salary
SELECT DISTINCT salary FROM employees
ORDER BY salary DESC
LIMIT 3;
