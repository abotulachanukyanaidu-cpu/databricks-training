
================================================================================
  SQL EMPLOYEE DATABASE - QUERY REFERENCE GUIDE
  Tables: Employee | Department | Project
================================================================================

--------------------------------------------------------------------------------
  SECTION 1: BASIC SELECT QUERIES
--------------------------------------------------------------------------------

  Q01 | Select all columns from Employee
  ---------------------------------------------------------------
  SELECT * FROM Employee;

  Q02 | Select only name and salary
  ---------------------------------------------------------------
  SELECT name, salary FROM Employee;

  Q04 | Select all department names
  ---------------------------------------------------------------
  SELECT name FROM Department;


--------------------------------------------------------------------------------
  SECTION 2: FILTERING WITH WHERE
--------------------------------------------------------------------------------

  Q03 | Employees older than 30
  ---------------------------------------------------------------
  SELECT * FROM Employee WHERE age > 30;

  Q05 | Employees in the IT department
  ---------------------------------------------------------------
  SELECT e.name
  FROM Employee e
  JOIN Department d ON e.department_id = d.department_id
  WHERE d.name = 'IT';


--------------------------------------------------------------------------------
  SECTION 3: PATTERN MATCHING (LIKE / LENGTH)
--------------------------------------------------------------------------------

  Q06 | Names starting with 'J'
  ---------------------------------------------------------------
  SELECT name FROM Employee WHERE name LIKE 'J%';

  Q07 | Names ending with 'e'
  ---------------------------------------------------------------
  SELECT name FROM Employee WHERE name LIKE '%e';

  Q08 | Names containing 'a'
  ---------------------------------------------------------------
  SELECT name FROM Employee WHERE name LIKE '%a%';

  Q09 | Names exactly 9 characters long
  ---------------------------------------------------------------
  SELECT name FROM Employee WHERE LENGTH(name) = 9;

  Q10 | Names with 'o' as the second character
  ---------------------------------------------------------------
  SELECT name FROM Employee WHERE name LIKE '_o%';


--------------------------------------------------------------------------------
  SECTION 4: DATE FILTERING
--------------------------------------------------------------------------------

  Q11 | Hired in the year 2020
  ---------------------------------------------------------------
  SELECT * FROM Employee WHERE YEAR(hire_date) = 2020;

  Q12 | Hired in January (any year)
  ---------------------------------------------------------------
  SELECT * FROM Employee WHERE MONTH(hire_date) = 1;

  Q13 | Hired before 2019
  ---------------------------------------------------------------
  SELECT * FROM Employee WHERE hire_date < '2019-01-01';

  Q14 | Hired on or after March 1, 2021
  ---------------------------------------------------------------
  SELECT * FROM Employee WHERE hire_date >= '2021-03-01';

  Q15 | Hired in the last 2 years
  ---------------------------------------------------------------
  SELECT * FROM Employee
  WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR;

  Q56 | Total salary of employees hired in 2020
  ---------------------------------------------------------------
  SELECT SUM(salary)
  FROM Employee
  WHERE YEAR(hire_date) = 2020;

  Q59 | Employees hired in the last 2 years (ordered)
  ---------------------------------------------------------------
  SELECT name FROM Employee
  WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR
  ORDER BY hire_date;


--------------------------------------------------------------------------------
  SECTION 5: AGGREGATE FUNCTIONS
--------------------------------------------------------------------------------

  Q16 | Total salary of all employees
  ---------------------------------------------------------------
  SELECT SUM(salary) FROM Employee;

  Q17 | Average salary
  ---------------------------------------------------------------
  SELECT AVG(salary) FROM Employee;

  Q18 | Minimum salary
  ---------------------------------------------------------------
  SELECT MIN(salary) FROM Employee;


--------------------------------------------------------------------------------
  SECTION 6: GROUP BY
--------------------------------------------------------------------------------

  Q19 | Number of employees per department
  ---------------------------------------------------------------
  SELECT department_id, COUNT(*) FROM Employee GROUP BY department_id;

  Q20 | Average salary per department
  ---------------------------------------------------------------
  SELECT department_id, AVG(salary) FROM Employee GROUP BY department_id;

  Q21 | Total salary per department
  ---------------------------------------------------------------
  SELECT department_id, SUM(salary) FROM Employee GROUP BY department_id;

  Q22 | Average age per department
  ---------------------------------------------------------------
  SELECT department_id, AVG(age) FROM Employee GROUP BY department_id;

  Q23 | Employees hired per year
  ---------------------------------------------------------------
  SELECT YEAR(hire_date), COUNT(*) FROM Employee GROUP BY YEAR(hire_date);

  Q24 | Highest salary per department
  ---------------------------------------------------------------
  SELECT department_id, MAX(salary) FROM Employee GROUP BY department_id;

  Q25 | Department with the highest average salary
  ---------------------------------------------------------------
  SELECT department_id, AVG(salary)
  FROM Employee
  GROUP BY department_id
  ORDER BY AVG(salary) DESC
  LIMIT 1;

  Q57 | Average salary per department (descending order)
  ---------------------------------------------------------------
  SELECT department_id, AVG(salary)
  FROM Employee
  GROUP BY department_id
  ORDER BY AVG(salary) DESC;

  Q60 | Total employees and average salary per department
  ---------------------------------------------------------------
  SELECT department_id, COUNT(*), AVG(salary)
  FROM Employee
  GROUP BY department_id;


--------------------------------------------------------------------------------
  SECTION 7: HAVING CLAUSE
--------------------------------------------------------------------------------

  Q26 | Departments with more than 2 employees
  ---------------------------------------------------------------
  SELECT department_id, COUNT(*)
  FROM Employee
  GROUP BY department_id
  HAVING COUNT(*) > 2;

  Q27 | Departments with average salary above 55,000
  ---------------------------------------------------------------
  SELECT department_id, AVG(salary)
  FROM Employee
  GROUP BY department_id
  HAVING AVG(salary) > 55000;

  Q28 | Years with more than 1 hire
  ---------------------------------------------------------------
  SELECT YEAR(hire_date), COUNT(*)
  FROM Employee
  GROUP BY YEAR(hire_date)
  HAVING COUNT(*) > 1;

  Q29 | Departments with total salary below 100,000
  ---------------------------------------------------------------
  SELECT department_id, SUM(salary)
  FROM Employee
  GROUP BY department_id
  HAVING SUM(salary) < 100000;

  Q30 | Departments where max salary exceeds 75,000
  ---------------------------------------------------------------
  SELECT department_id, MAX(salary)
  FROM Employee
  GROUP BY department_id
  HAVING MAX(salary) > 75000;

  Q58 | Departments with >1 employee AND avg salary >55,000
  ---------------------------------------------------------------
  SELECT department_id
  FROM Employee
  GROUP BY department_id
  HAVING COUNT(*) > 1 AND AVG(salary) > 55000;


--------------------------------------------------------------------------------
  SECTION 8: ORDER BY
--------------------------------------------------------------------------------

  Q31 | Employees ordered by salary (ascending)
  ---------------------------------------------------------------
  SELECT * FROM Employee ORDER BY salary;

  Q32 | Employees ordered by age (descending)
  ---------------------------------------------------------------
  SELECT * FROM Employee ORDER BY age DESC;

  Q33 | Employees ordered by hire date (ascending)
  ---------------------------------------------------------------
  SELECT * FROM Employee ORDER BY hire_date;

  Q34 | Employees ordered by department, then salary
  ---------------------------------------------------------------
  SELECT * FROM Employee ORDER BY department_id, salary;

  Q35 | Departments ordered by total salary (descending)
  ---------------------------------------------------------------
  SELECT department_id, SUM(salary)
  FROM Employee
  GROUP BY department_id
  ORDER BY SUM(salary) DESC;


--------------------------------------------------------------------------------
  SECTION 9: JOINS
--------------------------------------------------------------------------------

  Q36 | Employee name + department name (INNER JOIN)
  ---------------------------------------------------------------
  SELECT e.name, d.name
  FROM Employee e
  JOIN Department d ON e.department_id = d.department_id;

  Q37 | Project name + department name (INNER JOIN)
  ---------------------------------------------------------------
  SELECT p.name, d.name
  FROM Project p
  JOIN Department d ON p.department_id = d.department_id;

  Q38 | Employee name + project name (INNER JOIN)
  ---------------------------------------------------------------
  SELECT e.name, p.name
  FROM Employee e
  JOIN Project p ON e.department_id = p.department_id;

  Q39 | All employees + department (including no dept)
  ---------------------------------------------------------------
  SELECT e.name, d.name
  FROM Employee e
  LEFT JOIN Department d ON e.department_id = d.department_id;

  Q40 | All departments + employees (including empty depts)
  ---------------------------------------------------------------
  SELECT d.name, e.name
  FROM Department d
  LEFT JOIN Employee e ON d.department_id = e.department_id;

  Q41 | Employees not assigned to any project
  ---------------------------------------------------------------
  SELECT e.name
  FROM Employee e
  LEFT JOIN Project p ON e.department_id = p.department_id
  WHERE p.project_id IS NULL;

  Q42 | Employee name + number of projects
  ---------------------------------------------------------------
  SELECT e.name, COUNT(p.project_id)
  FROM Employee e
  LEFT JOIN Project p ON e.department_id = p.department_id
  GROUP BY e.name;

  Q43 | Departments with no employees
  ---------------------------------------------------------------
  SELECT d.name
  FROM Department d
  LEFT JOIN Employee e ON d.department_id = e.department_id
  WHERE e.emp_id IS NULL;

  Q45 | Department name with highest average salary
  ---------------------------------------------------------------
  SELECT d.name, AVG(e.salary)
  FROM Department d
  JOIN Employee e ON d.department_id = e.department_id
  GROUP BY d.name
  ORDER BY AVG(e.salary) DESC
  LIMIT 1;

  Q49 | Department with the most employees
  ---------------------------------------------------------------
  SELECT d.name
  FROM Department d
  JOIN Employee e ON d.department_id = e.department_id
  GROUP BY d.name
  ORDER BY COUNT(*) DESC
  LIMIT 1;

  Q53 | Departments with average salary above 55,000 (by name)
  ---------------------------------------------------------------
  SELECT d.name
  FROM Department d
  JOIN Employee e ON d.department_id = e.department_id
  GROUP BY d.name
  HAVING AVG(e.salary) > 55000;

  Q63 | Department name + project count
  ---------------------------------------------------------------
  SELECT d.name, COUNT(p.project_id)
  FROM Department d
  LEFT JOIN Project p ON d.department_id = p.department_id
  GROUP BY d.name
  ORDER BY COUNT(p.project_id) DESC;


--------------------------------------------------------------------------------
  SECTION 10: SUBQUERIES
--------------------------------------------------------------------------------

  Q44 | Employees in the same department as John Doe
  ---------------------------------------------------------------
  SELECT name
  FROM Employee
  WHERE department_id = (
    SELECT department_id FROM Employee WHERE name = 'John Doe'
  );

  Q46 | Employee(s) with the highest salary
  ---------------------------------------------------------------
  SELECT name FROM Employee
  WHERE salary = (SELECT MAX(salary) FROM Employee);

  Q47 | Employees earning above company average
  ---------------------------------------------------------------
  SELECT name FROM Employee
  WHERE salary > (SELECT AVG(salary) FROM Employee);

  Q48 | Second highest salary
  ---------------------------------------------------------------
  SELECT MAX(salary)
  FROM Employee
  WHERE salary < (SELECT MAX(salary) FROM Employee);

  Q51 | Third highest salary
  ---------------------------------------------------------------
  SELECT DISTINCT salary
  FROM Employee
  ORDER BY salary DESC
  LIMIT 1 OFFSET 2;

  Q50 | Employees earning above their department average
  ---------------------------------------------------------------
  SELECT name
  FROM Employee e
  WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
  );

  Q52 | Employees older than ALL employees in HR
  ---------------------------------------------------------------
  SELECT name FROM Employee
  WHERE age > ALL (
    SELECT age FROM Employee
    WHERE department_id = (
      SELECT department_id FROM Department WHERE name = 'HR'
    )
  );

  Q54 | Employees in departments with 2 or more projects
  ---------------------------------------------------------------
  SELECT name FROM Employee
  WHERE department_id IN (
    SELECT department_id FROM Project
    GROUP BY department_id
    HAVING COUNT(*) >= 2
  );

  Q55 | Employees with the same hire date as Jane Smith
  ---------------------------------------------------------------
  SELECT name FROM Employee
  WHERE hire_date = (
    SELECT hire_date FROM Employee WHERE name = 'Jane Smith'
  );

  Q61 | Employees earning above company average (duplicate of Q47)
  ---------------------------------------------------------------
  SELECT name FROM Employee
  WHERE salary > (SELECT AVG(salary) FROM Employee);

  Q62 | Employees with the same hire date as the earliest employee
  ---------------------------------------------------------------
  SELECT name FROM Employee
  WHERE hire_date = (SELECT MIN(hire_date) FROM Employee);

  Q64 | Highest-paid employee in each department
  ---------------------------------------------------------------
  SELECT name FROM Employee e
  WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
  );

  Q65 | Employees older than their department average age
  ---------------------------------------------------------------
  SELECT name FROM Employee e
  WHERE age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department_id = e.department_id
  );


================================================================================
  END OF REFERENCE GUIDE
  Total Queries: 65 | Sections: 10
================================================================================
