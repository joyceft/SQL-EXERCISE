create table Test(id integer, title varchar(100));
insert into Test(id, title) values(1, "Hello");
select * from Test;
-- Your code here!
# Date and Time
#1.display the first day of the month three month before the current month
#SELECT DATE(((period_add(EXTRACT(YEAR_MONTH
#                                  FROM CURDATE()), -3)*100) + 1))

#2.the last day of the month three month before the current month
SELECT (SUBDATE(ADDDATE(CURDATE(), INTERVAL 1 MONTH),
                         INTERVAL DAYOFMONTH(CURDATE()) DAY))
                         AS lastdayofthemonth;
                         
#3.Get distinct Mondays from hire_date in employees table               
SELECT DISTINCT(WEEKDAY(hire_date)) FROM employees;
SELECT DISTNCT(STR_TO_DATE(CONCAT(YEARWEEK(hire_date), "1"), "%x%v%w")) 
FROM employees;

#4.get the first day of this year
MAKEDATE(EXTRACT(YEAR FROM CURDATE()),1)

#5. CALCULATE THE AGE OF 1967-06-08
SELECT YEAR(CURRENT_TIMESTAMP) - 
         YEAR("1967-06-08") - 
             (RIGHT(CURRENT_TIMESTAMP), 5) <
                    (RIGHT("1967-06-08", 5)) AS age;

#6.write a query to get the current date as September 4, 2014
SELECT DATE_FORMAT(CURDATE(), "%M %e, %Y") AS "Current Date";

#7.get a date as weekday, month year
SELECT WEEKDAY(CURDATE()) + MONTH(CURDATE()) + YEAR(CURDATE());
SELECT DATE_FORMAT(NOW(), "%W %M %Y");

#8.get the date from a given number
SELECT FROM_DAYS(730677);

#9.get the first_name, hire_date where hire_date between 1987-06-01 and 1987-07-30
SELECT firs_name, hire_date FROM employees
WHERE hire_date BETWEEN "1987-06-01 00:00:00"
                    AND "1987-07-30 23:59:59";

#10.IN WEEK, DAY, MONTH, YEAR, TIME FORMART
SELECT DATE_FORMAT(CURDATE(), "%W %d %M %Y %T")

#11.in format as 19/11/2017
SELECT DATE_FORMAT(CURDATE, "%d/%m/%Y");

#12.get names of employees who join in June
SELECT first_name, last_name, hire_date, MONTH(hire_date) FROM employees
WHERE MONTH(hire_date) = 6;

#13.get the years in which more than 10 employees joined
SELECT YEAR(hire_date) AS year, COUNT(*) AS join_number FROM employees
GROUP BY year
HAVING join_number > 10;

#14.get d_name, manager_name, salary of managers for those whose experience is >5 years
SELECT d.department_name, e.first_name, e.last_name, e.salary FROM department AS d
INNER JOIN employees AS e
ON d.manager_id = e.employee_id 
WHERE DATEDIFF(CURDATE()- e.hire_date)/365 > 5;

#15.get employee_id, last_name, date of first salary 
SELECT employee_id, last_name, LAST_DAY(hire_date) FROM employees;

#16.get first_name, hire_date, experience of employees
SELECT first_name, hire_date, ROUND(DATEDIFF(CURDATE()- hire_date))/365) AS experience
FROM employees;

#17.get d_id, year, # of employees joined
SELECT department_id, YEAR(hire_date) AS year, COUNT(*) FROM employees
GROUP BY department_id, year
ORDER BY department_id;
