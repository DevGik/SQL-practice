Use intro_sql

-- Create table
CREATE TABLE employees_join (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- Insert records
INSERT INTO employees_join (emp_id, emp_name, dept_id)
VALUES
(1, 'John', 1),
(2, 'Mary', 2),
(3, 'Peter', 3),
(4, 'Lucy', NULL);

-- View the table
SELECT * FROM employees_join;


-- Create departments table
CREATE TABLE departments_join (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert records into departments
INSERT INTO departments_join (dept_id, dept_name)
VALUES
(1, 'HR'),
(2, 'Finance'),
(4, 'IT');

-- View the table
SELECT * FROM departments_join;


-- 1. INNER JOIN
-- Returns only the rows that have matching values in both tables.
SELECT e.emp_name, d.dept_name
FROM Employees_join e
INNER JOIN Departments_join d ON e.dept_id = d.dept_id;

-- Explanation:
-- Peter’s dept_id = 3 doesn’t exist in Departments
-- Lucy’s dept_id = NULL is not matched
-- So they are excluded.




-- 2. LEFT JOIN (or LEFT OUTER JOIN)
-- Returns all rows from the left table, and matching rows from the right table.
-- If no match, the result from the right table is NULL.
SELECT e.emp_name, d.dept_name
FROM Employees_join e
LEFT JOIN Departments_join d ON e.dept_id = d.dept_id;

-- Explanation:
-- All employees appear, even if their department doesn’t exist.
-- Peter and Lucy have no matching department.


-- 3. RIGHT JOIN (or RIGHT OUTER JOIN)
-- Returns all rows from the right table, and matching rows from the left table.
-- If no match, the result from the left table is NULL.
SELECT e.emp_name, d.dept_name
FROM Employees_join e
RIGHT JOIN Departments_join d ON e.dept_id = d.dept_id;

-- Explanation:
-- All departments appear.
-- The IT department has no employee, so employee columns show NULL.



-- 4. FULL JOIN (or FULL OUTER JOIN)
-- Returns all rows when there is a match in either table.
-- Unmatched rows from both sides are also included, with NULL where data is missing.
SELECT e.emp_name, d.dept_name
FROM Employees_join e
LEFT JOIN Departments_join d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name
FROM Employees_join e
LEFT JOIN Departments_join d ON e.dept_id = d.dept_id;

-- Explanation:
-- Combines results of LEFT JOIN + RIGHT JOIN.
-- Every row from both tables appears.


-- 5. CROSS JOIN
-- Returns every possible combination of rows between both tables.
-- There’s no ON condition — it multiplies all rows.
SELECT e.emp_name, d.dept_name
FROM Employees_join e
CROSS JOIN Departments_join d;

-- Result:
-- If Employees = 4 rows, Departments = 3 rows → total = 4 × 3 = 12 rows



-- 6. SELF JOIN
-- A table joins with itself.
-- Used to compare rows within the same table.
-- Example: Employees table where each employee has a manager_id.

CREATE TABLE Employees_sj (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  manager_id INT
);

INSERT INTO Employees_sj (emp_id, emp_name, manager_id) VALUES
(1, 'John', NULL),
(2, 'Mary', 1),
(3, 'Peter', 1),
(4, 'Lucy', 2),
(5, 'Paul', 2);

select * from employees_sj

SELECT 
  e.emp_name AS Employee,
  m.emp_name AS Manager
FROM Employees_sj AS e
LEFT JOIN Employees_sj AS m
ON e.manager_id = m.emp_id;

