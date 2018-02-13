update salary
set 
   sex= CASE sex
      when "m" then "f"
      else "m"
   end;
update salary set sex = IF(sex = "m","f","m")

620.
SELECT id, movie, description, rating FROM cinema
WHERE id%2 =1 AND description NOT LIKE "boring"
ORDER BY rating;
#182.duplicate email find all duplicate email
SELECT Email FROM Person
GROUP BY Email
HAVING COUNT(Email) >1;

#175.Combine two table
SELECT p.FirstName, p.LastName, a.City, a.State FROM Person AS p
LEFT JOIN Address AS a
ON p.PersonId = a.PersonId;

#181.Employee earning more than their manager
SELECT e.Name AS Employee FROM Employee AS e
LEFT JOIN Employee AS m
ON m.Id = e.ManagerId
WHERE e.Salary > m.Salary;

#183.Customer who never order
SELECT c.Name AS Customers FROM Customers AS c
LEFT JOIN Orders AS o
ON c.Id  = o.CustomerId
WHERE o.CustomerId IS NULL;

#197.find all date's id with Rising Temperature
SELECT t.Id FROM Weather AS y, Weather AS t
WHERE DATEDIFF(t.Date, y.Date) = 1 AND y.Temperature < t.Temperature;

#596.find all Classes with > 5 students
SELECT class FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) >=5;

#196.Delete duplicate emails, and keep only unique emails on its smallest id
DELETE p1 FROM Person AS p1, Person AS p2
WHERE p1.Email = p2.Email AND p1.Id>p2.Id
 
#176.find the second highest salary
SELECT MAX(Salary) AS SecondHighestSalary FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee)

#626.Exchange seats, if the number is odd, do not change the last one
SELECT o.id, n.student FROM seat AS o, seat AS n
WHERE

# find all student whose score is higher than 75, sorted by the last 3 chr of their name, if the same, sorted by their ID
SELECT NAME FROM STUDENT
WHERE SCORE >75
ORDER BY SUBSTR(NAME, -3, 3), ID;
#substr（string，start，length）
#RIGHT(NAME, 3)选最右边（结尾）三个
#LEFT(NAME,2)选最左边（开头）2个
#what is th total number of comments and total number of posts
SELECT COUNT(CONTENT_TYPE) FROM CONTENT_ACTIONS
GROUP BY CONTENT_TYPE;

#select city contains"aeiou"
SELECT DISTINCT city FROM station
WHERE city REGEXP "^[aeiou].*[aeiou]$';

#select city whose name's first chr is not aeiou
SELECT city FROM station
WHERE SUBSTR(city,1,1) NOT IN ("a','e','i','o','u');
#return triangle's type
SELECT CASE
           WHEN A+B>C AND A+C>B AND B+C >A THEN
              CASE
               WHEN A=B AND B=C THEN "Equilateral"
               WHEN A=B OR B=C OR C=A THEN "Isosceles"
               ELSE "Scalene"
              END
          ELSE "Not A Triangle"
         END
FROM Triangles;
#return the average difference of number with 0 and without 0
SELECT CEIL(AVG(salary)- AVG(REPLACE(salary,"0",""))) FROM employees;

#return the max total earings(salary*months) 
SELECT salary*months AS earnings, COUNT(salary*months) FROM employee
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1; order by + limit 1 >> least/max
#return value with 2 decimal places
SELECT ROUND(SUM(lat_n),2) FROM station;
#return the Manhattan distance between 2 points
SELECT ROUND((MAX(lat_n)-MIN(lat_n)+MAX(long_w)-MIN(long_w)),4) FROM station;

SUBQUERY
#相当于把另一个select写进一个select里面
#select employee working in research department
SELECT Ename, Enum FROM employees WHERE Dname  in( SELECT Dname FROM depm WHERE Dname = "research")
#display employees who are reported to John
SELECT e.Empno, e.Ename FROM emp AS e 
WHERE e.Mgr in (SELECT Empno FROM emp WHERE Ename ="John")
#display all the employees who are reporting to John's manager
select ename, empno FROM emp
WHERE mgr IN (SELECT mgr FROM emp WHERE ename = "JONES")

#-- Display all the employee names in Research and Sales Department who are having at least 1 person reporting to them
SELECT e.Empno, e.Ename FROM emp WHERE Deptno in (SELECT Deptno FROM dept WHERE Dname ="Research" or Dname = "Sales") and Empno in (SELECT DISTINCT mgr FROM emp)

#--Display all employees who do not have any reportee
SELECT Ename, Empno FROM emp 
WHERE empno NOT IN (SELECT Mgr FROM emp WHERE Mgr !="None")

`--list employees having at least 2 reportees
SELECT Ename, Empno FROM emp
WHERE empno IN (SELECT mgr FROM emp GROUP BY mgr HAVING COUNT(mgr)>=2)

