
# SQL Employee Database — Queries & Output Tables

**Schema:** MySQL v5.7 | **Tables:** `Employee`, `Department`, `Project`

---

## Q1 — Select All Columns from Employee

```sql
SELECT * FROM Employee;
```

| emp_id | name        | age | salary   | department_id | hire_date  |
|--------|-------------|-----|----------|---------------|------------|
| 1      | John Doe    | 28  | 50000.00 | 1             | 2020-01-15 |
| 2      | Jane Smith  | 34  | 60000.00 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.00 | 1             | 2018-02-12 |
| 4      | Alice Blue  | 25  | 45000.00 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.00 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.00 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.00 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.00 | NULL          | 2021-07-10 |
| 9      | Grace Kelly | 27  | 65000.00 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.00 | 4             | 2020-02-25 |

---

## Q2 — Select Name and Salary Only

```sql
SELECT name, salary FROM Employee;
```

| name        | salary   |
|-------------|----------|
| John Doe    | 50000.00 |
| Jane Smith  | 60000.00 |
| Bob Brown   | 80000.00 |
| Alice Blue  | 45000.00 |
| Charlie P.  | 50000.00 |
| David Green | 70000.00 |
| Eve Black   | 55000.00 |
| Frank White | 48000.00 |
| Grace Kelly | 65000.00 |
| Hannah Lee  | 53000.00 |

---

## Q3 — Employees Older Than 30

```sql
SELECT * FROM Employee WHERE age > 30;
```

| emp_id | name        | age | salary   | department_id | hire_date  |
|--------|-------------|-----|----------|---------------|------------|
| 2      | Jane Smith  | 34  | 60000.00 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.00 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.00 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.00 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.00 | NULL          | 2021-07-10 |

---

## Q4 — All Department Names

```sql
SELECT name FROM Department;
```

| name      |
|-----------|
| IT        |
| HR        |
| Finance   |
| Marketing |

---

## Q5 — Employees in the IT Department

```sql
SELECT e.name
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
WHERE d.name = 'IT';
```

| name        |
|-------------|
| John Doe    |
| Bob Brown   |
| Grace Kelly |

---

## Q6 — Names Starting with 'J'

```sql
SELECT name FROM Employee WHERE name LIKE 'J%';
```

| name       |
|------------|
| John Doe   |
| Jane Smith |

---

## Q7 — Names Ending with 'e'

```sql
SELECT name FROM Employee WHERE name LIKE '%e';
```

| name        |
|-------------|
| John Doe    |
| Alice Blue  |
| Frank White |
| Hannah Lee  |

---

## Q8 — Names Containing 'a'

```sql
SELECT name FROM Employee WHERE name LIKE '%a%';
```

| name        |
|-------------|
| Jane Smith  |
| Alice Blue  |
| Charlie P.  |
| David Green |
| Eve Black   |
| Frank White |
| Grace Kelly |
| Hannah Lee  |

---

## Q9 — Names Exactly 9 Characters Long

```sql
SELECT name FROM Employee WHERE LENGTH(name) = 9;
```

| name      |
|-----------|
| Bob Brown |
| Eve Black |

---

## Q10 — Names with 'o' as Second Character

```sql
SELECT name FROM Employee WHERE name LIKE '_o%';
```

| name      |
|-----------|
| John Doe  |
| Bob Brown |

---

## Q11 — Employees Hired in 2020

```sql
SELECT * FROM Employee WHERE YEAR(hire_date) = 2020;
```

| emp_id | name       | age | salary   | department_id | hire_date  |
|--------|------------|-----|----------|---------------|------------|
| 1      | John Doe   | 28  | 50000.00 | 1             | 2020-01-15 |
| 10     | Hannah Lee | 30  | 53000.00 | 4             | 2020-02-25 |

---

## Q12 — Employees Hired in January (Any Year)

```sql
SELECT * FROM Employee WHERE MONTH(hire_date) = 1;
```

| emp_id | name     | age | salary   | department_id | hire_date  |
|--------|----------|-----|----------|---------------|------------|
| 1      | John Doe | 28  | 50000.00 | 1             | 2020-01-15 |

---

## Q13 — Employees Hired Before 2019

```sql
SELECT * FROM Employee WHERE hire_date < '2019-01-01';
```

| emp_id | name        | age | salary   | department_id | hire_date  |
|--------|-------------|-----|----------|---------------|------------|
| 3      | Bob Brown   | 45  | 80000.00 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.00 | 1             | 2018-11-13 |

---

## Q14 — Employees Hired On or After March 1, 2021

```sql
SELECT * FROM Employee WHERE hire_date >= '2021-03-01';
```

| emp_id | name        | age | salary   | department_id | hire_date  |
|--------|-------------|-----|----------|---------------|------------|
| 4      | Alice Blue  | 25  | 45000.00 | 3             | 2021-03-22 |
| 6      | David Green | 38  | 70000.00 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.00 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.00 | NULL          | 2021-07-10 |

---

## Q15 — Employees Hired in the Last 2 Years

```sql
SELECT * FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR;
```

> _(No results — all hire dates in the dataset are before the 2-year window.)_

---

## Q16 — Total Salary of All Employees

```sql
SELECT SUM(salary) FROM Employee;
```

| SUM(salary) |
|-------------|
| 576000.00   |

---

## Q17 — Average Salary

```sql
SELECT AVG(salary) FROM Employee;
```

| AVG(salary) |
|-------------|
| 57600.00    |

---

## Q18 — Minimum Salary

```sql
SELECT MIN(salary) FROM Employee;
```

| MIN(salary) |
|-------------|
| 45000.00    |

---

## Q19 — Number of Employees per Department

```sql
SELECT department_id, COUNT(*) FROM Employee GROUP BY department_id;
```

| department_id | COUNT(*) |
|---------------|----------|
| NULL          | 1        |
| 1             | 3        |
| 2             | 2        |
| 3             | 2        |
| 4             | 2        |

---

## Q20 — Average Salary per Department

```sql
SELECT department_id, AVG(salary) FROM Employee GROUP BY department_id;
```

| department_id | AVG(salary) |
|---------------|-------------|
| NULL          | 48000.00    |
| 1             | 65000.00    |
| 2             | 55000.00    |
| 3             | 50000.00    |
| 4             | 61500.00    |

---

## Q21 — Total Salary per Department

```sql
SELECT department_id, SUM(salary) FROM Employee GROUP BY department_id;
```

| department_id | SUM(salary) |
|---------------|-------------|
| NULL          | 48000.00    |
| 1             | 195000.00   |
| 2             | 110000.00   |
| 3             | 100000.00   |
| 4             | 123000.00   |

---

## Q22 — Average Age per Department

```sql
SELECT department_id, AVG(age) FROM Employee GROUP BY department_id;
```

| department_id | AVG(age) |
|---------------|----------|
| NULL          | 32.0000  |
| 1             | 33.3333  |
| 2             | 31.5000  |
| 3             | 32.5000  |
| 4             | 34.0000  |

---

## Q23 — Employees Hired per Year

```sql
SELECT YEAR(hire_date), COUNT(*) FROM Employee GROUP BY YEAR(hire_date);
```

| YEAR(hire_date) | COUNT(*) |
|-----------------|----------|
| 2018            | 2        |
| 2019            | 2        |
| 2020            | 2        |
| 2021            | 3        |
| 2022            | 1        |

---

## Q24 — Highest Salary per Department

```sql
SELECT department_id, MAX(salary) FROM Employee GROUP BY department_id;
```

| department_id | MAX(salary) |
|---------------|-------------|
| NULL          | 48000.00    |
| 1             | 80000.00    |
| 2             | 60000.00    |
| 3             | 55000.00    |
| 4             | 70000.00    |

---

## Q25 — Department with Highest Average Salary

```sql
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;
```

| department_id | AVG(salary) |
|---------------|-------------|
| 1             | 65000.00    |

---

## Q26 — Departments with More Than 2 Employees

```sql
SELECT department_id, COUNT(*)
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;
```

| department_id | COUNT(*) |
|---------------|----------|
| 1             | 3        |

---

## Q27 — Departments with Average Salary > 55,000

```sql
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;
```

| department_id | AVG(salary) |
|---------------|-------------|
| 1             | 65000.00    |
| 4             | 61500.00    |

---

## Q28 — Years with More Than 1 Hire

```sql
SELECT YEAR(hire_date), COUNT(*)
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;
```

| YEAR(hire_date) | COUNT(*) |
|-----------------|----------|
| 2018            | 2        |
| 2019            | 2        |
| 2020            | 2        |
| 2021            | 3        |

---

## Q29 — Departments with Total Salary < 100,000

```sql
SELECT department_id, SUM(salary)
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;
```

| department_id | SUM(salary) |
|---------------|-------------|
| NULL          | 48000.00    |

---

## Q30 — Departments with Max Salary > 75,000

```sql
SELECT department_id, MAX(salary)
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;
```

| department_id | MAX(salary) |
|---------------|-------------|
| 1             | 80000.00    |

---

## Q31 — Employees Ordered by Salary (Ascending)

```sql
SELECT * FROM Employee ORDER BY salary;
```

| emp_id | name        | age | salary   | department_id | hire_date  |
|--------|-------------|-----|----------|---------------|------------|
| 4      | Alice Blue  | 25  | 45000.00 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.00 | NULL          | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.00 | 1             | 2020-01-15 |
| 5      | Charlie P.  | 29  | 50000.00 | 2             | 2019-12-01 |
| 10     | Hannah Lee  | 30  | 53000.00 | 4             | 2020-02-25 |
| 7      | Eve Black   | 40  | 55000.00 | 3             | 2021-08-30 |
| 2      | Jane Smith  | 34  | 60000.00 | 2             | 2019-07-23 |
| 9      | Grace Kelly | 27  | 65000.00 | 1             | 2018-11-13 |
| 6      | David Green | 38  | 70000.00 | 4             | 2022-05-18 |
| 3      | Bob Brown   | 45  | 80000.00 | 1             | 2018-02-12 |

---

## Q32 — Employees Ordered by Age (Descending)

```sql
SELECT * FROM Employee ORDER BY age DESC;
```

| emp_id | name        | age | salary   | department_id | hire_date  |
|--------|-------------|-----|----------|---------------|------------|
| 3      | Bob Brown   | 45  | 80000.00 | 1             | 2018-02-12 |
| 7      | Eve Black   | 40  | 55000.00 | 3             | 2021-08-30 |
| 6      | David Green | 38  | 70000.00 | 4             | 2022-05-18 |
| 2      | Jane Smith  | 34  | 60000.00 | 2             | 2019-07-23 |
| 8      | Frank White | 32  | 48000.00 | NULL          | 2021-07-10 |
| 10     | Hannah Lee  | 30  | 53000.00 | 4             | 2020-02-25 |
| 5      | Charlie P.  | 29  | 50000.00 | 2             | 2019-12-01 |
| 1      | John Doe    | 28  | 50000.00 | 1             | 2020-01-15 |
| 9      | Grace Kelly | 27  | 65000.00 | 1             | 2018-11-13 |
| 4      | Alice Blue  | 25  | 45000.00 | 3             | 2021-03-22 |

---

## Q33 — Employees Ordered by Hire Date (Ascending)

```sql
SELECT * FROM Employee ORDER BY hire_date;
```

| emp_id | name        | age | salary   | department_id | hire_date  |
|--------|-------------|-----|----------|---------------|------------|
| 3      | Bob Brown   | 45  | 80000.00 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.00 | 1             | 2018-11-13 |
| 2      | Jane Smith  | 34  | 60000.00 | 2             | 2019-07-23 |
| 5      | Charlie P.  | 29  | 50000.00 | 2             | 2019-12-01 |
| 1      | John Doe    | 28  | 50000.00 | 1             | 2020-01-15 |
| 10     | Hannah Lee  | 30  | 53000.00 | 4             | 2020-02-25 |
| 4      | Alice Blue  | 25  | 45000.00 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.00 | NULL          | 2021-07-10 |
| 7      | Eve Black   | 40  | 55000.00 | 3             | 2021-08-30 |
| 6      | David Green | 38  | 70000.00 | 4             | 2022-05-18 |

---

## Q34 — Ordered by Department, Then Salary

```sql
SELECT * FROM Employee ORDER BY department_id, salary;
```

| emp_id | name        | age | salary   | department_id | hire_date  |
|--------|-------------|-----|----------|---------------|------------|
| 8      | Frank White | 32  | 48000.00 | NULL          | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.00 | 1             | 2020-01-15 |
| 9      | Grace Kelly | 27  | 65000.00 | 1             | 2018-11-13 |
| 3      | Bob Brown   | 45  | 80000.00 | 1             | 2018-02-12 |
| 5      | Charlie P.  | 29  | 50000.00 | 2             | 2019-12-01 |
| 2      | Jane Smith  | 34  | 60000.00 | 2             | 2019-07-23 |
| 4      | Alice Blue  | 25  | 45000.00 | 3             | 2021-03-22 |
| 7      | Eve Black   | 40  | 55000.00 | 3             | 2021-08-30 |
| 10     | Hannah Lee  | 30  | 53000.00 | 4             | 2020-02-25 |
| 6      | David Green | 38  | 70000.00 | 4             | 2022-05-18 |

---

## Q35 — Departments Ordered by Total Salary (Descending)

```sql
SELECT department_id, SUM(salary)
FROM Employee
GROUP BY department_id
ORDER BY SUM(salary) DESC;
```

| department_id | SUM(salary) |
|---------------|-------------|
| 1             | 195000.00   |
| 4             | 123000.00   |
| 2             | 110000.00   |
| 3             | 100000.00   |
| NULL          | 48000.00    |

---

## Q36 — Employee Name + Department Name (INNER JOIN)

```sql
SELECT e.name, d.name
FROM Employee e
JOIN Department d ON e.department_id = d.department_id;
```

| Employee Name | Department Name |
|---------------|-----------------|
| John Doe      | IT              |
| Bob Brown     | IT              |
| Grace Kelly   | IT              |
| Jane Smith    | HR              |
| Charlie P.    | HR              |
| Alice Blue    | Finance         |
| Eve Black     | Finance         |
| David Green   | Marketing       |
| Hannah Lee    | Marketing       |

---

## Q37 — Project Name + Department Name (INNER JOIN)

```sql
SELECT p.name, d.name
FROM Project p
JOIN Department d ON p.department_id = d.department_id;
```

| Project Name    | Department Name |
|-----------------|-----------------|
| Project Alpha   | IT              |
| Project Gamma   | IT              |
| Project Theta   | IT              |
| Project Beta    | HR              |
| Project Delta   | Finance         |
| Project Eta     | Finance         |
| Project Epsilon | Marketing       |
| Project Zeta    | Marketing       |

---

## Q38 — Employee Name + Project Name (INNER JOIN)

```sql
SELECT e.name, p.name
FROM Employee e
JOIN Project p ON e.department_id = p.department_id;
```

| Employee Name | Project Name    |
|---------------|-----------------|
| John Doe      | Project Alpha   |
| John Doe      | Project Gamma   |
| John Doe      | Project Theta   |
| Jane Smith    | Project Beta    |
| Bob Brown     | Project Alpha   |
| Bob Brown     | Project Gamma   |
| Bob Brown     | Project Theta   |
| Alice Blue    | Project Delta   |
| Alice Blue    | Project Eta     |
| Charlie P.    | Project Beta    |
| David Green   | Project Epsilon |
| David Green   | Project Zeta    |
| Eve Black     | Project Delta   |
| Eve Black     | Project Eta     |
| Grace Kelly   | Project Alpha   |
| Grace Kelly   | Project Gamma   |
| Grace Kelly   | Project Theta   |
| Hannah Lee    | Project Epsilon |
| Hannah Lee    | Project Zeta    |

---

## Q39 — All Employees + Department (LEFT JOIN, Includes NULL)

```sql
SELECT e.name, d.name
FROM Employee e
LEFT JOIN Department d ON e.department_id = d.department_id;
```

| Employee Name | Department Name |
|---------------|-----------------|
| John Doe      | IT              |
| Bob Brown     | IT              |
| Grace Kelly   | IT              |
| Jane Smith    | HR              |
| Charlie P.    | HR              |
| Alice Blue    | Finance         |
| Eve Black     | Finance         |
| David Green   | Marketing       |
| Hannah Lee    | Marketing       |
| Frank White   | NULL            |

---

## Q40 — All Departments + Employees (LEFT JOIN)

```sql
SELECT d.name, e.name
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id;
```

| Department Name | Employee Name |
|-----------------|---------------|
| IT              | John Doe      |
| IT              | Bob Brown     |
| IT              | Grace Kelly   |
| HR              | Jane Smith    |
| HR              | Charlie P.    |
| Finance         | Alice Blue    |
| Finance         | Eve Black     |
| Marketing       | David Green   |
| Marketing       | Hannah Lee    |

---

## Q41 — Employees Not Assigned to Any Project

```sql
SELECT e.name
FROM Employee e
LEFT JOIN Project p ON e.department_id = p.department_id
WHERE p.project_id IS NULL;
```

| name        |
|-------------|
| Frank White |

---

## Q42 — Employee Name + Project Count

```sql
SELECT e.name, COUNT(p.project_id)
FROM Employee e
LEFT JOIN Project p ON e.department_id = p.department_id
GROUP BY e.name;
```

| name        | COUNT(p.project_id) |
|-------------|---------------------|
| Alice Blue  | 2                   |
| Bob Brown   | 3                   |
| Charlie P.  | 1                   |
| David Green | 2                   |
| Eve Black   | 2                   |
| Frank White | 0                   |
| Grace Kelly | 3                   |
| Hannah Lee  | 2                   |
| Jane Smith  | 1                   |
| John Doe    | 3                   |

---

## Q43 — Departments with No Employees

```sql
SELECT d.name
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;
```

> _(No results — all departments have at least one employee.)_

---

## Q44 — Employees in the Same Department as John Doe

```sql
SELECT name
FROM Employee
WHERE department_id = (
  SELECT department_id FROM Employee WHERE name = 'John Doe'
);
```

| name        |
|-------------|
| John Doe    |
| Bob Brown   |
| Grace Kelly |

---

## Q45 — Department Name with Highest Average Salary

```sql
SELECT d.name, AVG(e.salary)
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.name
ORDER BY AVG(e.salary) DESC
LIMIT 1;
```

| name | AVG(e.salary) |
|------|---------------|
| IT   | 65000.00      |

---

## Q46 — Employee with the Highest Salary

```sql
SELECT name FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);
```

| name      |
|-----------|
| Bob Brown |

---

## Q47 — Employees Earning Above Company Average

```sql
SELECT name FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);
```

| name        |
|-------------|
| Jane Smith  |
| Bob Brown   |
| David Green |
| Grace Kelly |

---

## Q48 — Second Highest Salary

```sql
SELECT MAX(salary)
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
```

| MAX(salary) |
|-------------|
| 70000.00    |

---

## Q49 — Department with the Most Employees

```sql
SELECT d.name
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.name
ORDER BY COUNT(*) DESC
LIMIT 1;
```

| name |
|------|
| IT   |

---

## Q50 — Employees Earning Above Their Department Average

```sql
SELECT name
FROM Employee e
WHERE salary > (
  SELECT AVG(salary)
  FROM Employee
  WHERE department_id = e.department_id
);
```

| name        |
|-------------|
| Jane Smith  |
| Bob Brown   |
| David Green |
| Eve Black   |

---

## Q51 — Third Highest Salary

```sql
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;
```

| salary   |
|----------|
| 65000.00 |

---

## Q52 — Employees Older Than All HR Employees

```sql
SELECT name FROM Employee
WHERE age > ALL (
  SELECT age FROM Employee
  WHERE department_id = (
    SELECT department_id FROM Department WHERE name = 'HR'
  )
);
```

| name        |
|-------------|
| Bob Brown   |
| David Green |
| Eve Black   |

---

## Q53 — Departments with Average Salary > 55,000 (by Name)

```sql
SELECT d.name
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.name
HAVING AVG(e.salary) > 55000;
```

| name      |
|-----------|
| IT        |
| Marketing |

---

## Q54 — Employees in Departments with 2 or More Projects

```sql
SELECT name FROM Employee
WHERE department_id IN (
  SELECT department_id FROM Project
  GROUP BY department_id
  HAVING COUNT(*) >= 2
);
```

| name        |
|-------------|
| John Doe    |
| Bob Brown   |
| Alice Blue  |
| David Green |
| Eve Black   |
| Grace Kelly |
| Hannah Lee  |

---

## Q55 — Employees with the Same Hire Date as Jane Smith

```sql
SELECT name FROM Employee
WHERE hire_date = (
  SELECT hire_date FROM Employee WHERE name = 'Jane Smith'
);
```

| name       |
|------------|
| Jane Smith |

---

## Q56 — Total Salary of Employees Hired in 2020

```sql
SELECT SUM(salary)
FROM Employee
WHERE YEAR(hire_date) = 2020;
```

| SUM(salary) |
|-------------|
| 103000.00   |

---

## Q57 — Average Salary per Department (Descending)

```sql
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC;
```

| department_id | AVG(salary) |
|---------------|-------------|
| 1             | 65000.00    |
| 4             | 61500.00    |
| 2             | 55000.00    |
| 3             | 50000.00    |
| NULL          | 48000.00    |

---

## Q58 — Departments with >1 Employee AND Average Salary > 55,000

```sql
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1 AND AVG(salary) > 55000;
```

| department_id |
|---------------|
| 1             |
| 4             |

---

## Q59 — Employees Hired in the Last 2 Years (Ordered)

```sql
SELECT name FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR
ORDER BY hire_date;
```

> _(No results — all hire dates in the dataset fall outside the 2-year window.)_

---

## Q60 — Total Employees and Average Salary per Department

```sql
SELECT department_id, COUNT(*), AVG(salary)
FROM Employee
GROUP BY department_id;
```

| department_id | COUNT(*) | AVG(salary) |
|---------------|----------|-------------|
| NULL          | 1        | 48000.00    |
| 1             | 3        | 65000.00    |
| 2             | 2        | 55000.00    |
| 3             | 2        | 50000.00    |
| 4             | 2        | 61500.00    |

---

## Q61 — Employees Earning Above Company Average

```sql
SELECT name FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);
```

| name        |
|-------------|
| Jane Smith  |
| Bob Brown   |
| David Green |
| Grace Kelly |

---

## Q62 — Employees with the Same Hire Date as the Earliest Employee

```sql
SELECT name FROM Employee
WHERE hire_date = (SELECT MIN(hire_date) FROM Employee);
```

| name      |
|-----------|
| Bob Brown |

---

## Q63 — Department Name + Project Count

```sql
SELECT d.name, COUNT(p.project_id)
FROM Department d
LEFT JOIN Project p ON d.department_id = p.department_id
GROUP BY d.name
ORDER BY COUNT(p.project_id) DESC;
```

| Department Name | COUNT(p.project_id) |
|-----------------|---------------------|
| IT              | 3                   |
| Marketing       | 2                   |
| Finance         | 2                   |
| HR              | 1                   |

---

## Q64 — Highest-Paid Employee in Each Department

```sql
SELECT name FROM Employee e
WHERE salary = (
  SELECT MAX(salary)
  FROM Employee
  WHERE department_id = e.department_id
);
```

| name        |
|-------------|
| Jane Smith  |
| Bob Brown   |
| David Green |
| Eve Black   |

---

## Q65 — Employees Older Than Their Department's Average Age

```sql
SELECT name FROM Employee e
WHERE age > (
  SELECT AVG(age)
  FROM Employee
  WHERE department_id = e.department_id
);
```

| name        |
|-------------|
| Jane Smith  |
| Bob Brown   |
| David Green |
| Eve Black   |

---

*Total Queries: 65 | Source: DB Fiddle (MySQL v5.7)*
