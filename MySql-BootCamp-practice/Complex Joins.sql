-- Inner Join with Multiple Conditions
-- An inner join combines rows from two or more tables based on a related column between them.

SELECT
    e.id,
    e.name,
    d.dept_name
FROM
    employees e
INNER JOIN
    departments d ON e.dept_id = d.dept_id
WHERE
    e.salary > 50000;
    
-- Left Join (or Left Outer Join)
-- A left join returns all rows from the left table and the matched rows from the right table. If no match is found, NULL values are returned for columns from the right table.

SELECT
    e.id,
    e.name,
    d.dept_name
FROM
    employees e
LEFT JOIN
    departments d ON e.dept_id = d.dept_id;

-- Right Join (or Right Outer Join)
-- A right join returns all rows from the right table and the matched rows from the left table. If no match is found, NULL values are returned for columns from the left table.

SELECT
    e.id,
    e.name,
    d.dept_name
FROM
    employees e
RIGHT JOIN
    departments d ON e.dept_id = d.dept_id;
    
--  Full Outer Join (Simulated with UNION)
-- MySQL does not support full outer join directly, but you can simulate it using UNION.

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM
    employees e
LEFT JOIN
    departments d ON e.department_id = d.department_id
UNION
SELECT
    e.id,
    e.name,
    d.dept_name
FROM
    employees e
RIGHT JOIN
    departments d ON e.dept_id = d.dept_id;

-- Self Join
-- A self join is a regular join but the table is joined with itself.

SELECT
    e1.id AS EmployeeID,
    e1.name AS EmployeeName,
    e2.id AS ManagerID,
    e2.name AS ManagerName
FROM
    employees e1
LEFT JOIN
    employees e2 ON e1.id = e2.id;
    
-- Cross Join
-- A cross join returns the Cartesian product of the two tables, meaning it returns all possible combinations of rows from the tables.

SELECT
    e.id,
    e.name,
    d.dept_name
FROM
    employees e
CROSS JOIN
    departments d;

-- Complex Join with Subquery
-- Combining joins with subqueries to filter or aggregate data.

SELECT
    e.id,
    e.name,
    d.dept_name,
    j.max_salary
FROM
    employees e
INNER JOIN
    departments d ON e.dept_id = d.dept_id
INNER JOIN
    (SELECT 
        dept_id, 
        MAX(salary) AS max_salary 
     FROM 
        employees 
     GROUP BY 
        dept_id) j 
ON 
    e.dept_id = j.dept_id
WHERE
    e.salary = j.max_salary;
    
-- Join with Using Clause
-- The USING clause can be used when both tables have one or more columns in common that should be used for the join.

SELECT
    e.id,
    e.name,
    d.dept_name
FROM
    employees e
INNER JOIN
    departments d USING (dept_id);

