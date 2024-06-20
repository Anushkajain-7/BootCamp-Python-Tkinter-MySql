-- Subquery in the SELECT Clause
-- A subquery can be used in the SELECT clause to retrieve a value that will be used in the main query.

SELECT
    id,
    name,
    position,
    (SELECT dept_name 
     FROM departments 
     WHERE departments.dept_id = employees.dept_id) AS dept_name
FROM
    employees;
    
--  Subquery in the FROM Clause
-- A subquery can be used in the FROM clause to create a derived table that the main query can select from.

SELECT
    dept_id,
    AVG(salary) AS average_salary
FROM
    (SELECT 
        dept_id, 
        salary 
     FROM 
        employees) AS emp
GROUP BY
    dept_id;
    
-- Subquery in the WHERE Clause
-- A subquery can be used in the WHERE clause to filter results based on a condition that involves another table or another row.

SELECT
    name
FROM
    employees
WHERE
    dept_id IN (SELECT dept_id FROM departments where salary > 7500 );
    
select salary from employees;

-- Subquery with EXISTS
-- A subquery can be used with the EXISTS operator to check the existence of rows returned by the subquery.

SELECT
    name
FROM
    employees e
WHERE
    EXISTS (SELECT 1 FROM departments d WHERE d.dept_id = e.dept_id);
    
-- Subquery with NOT EXISTS
-- A subquery can also be used with the NOT EXISTS operator to exclude rows that meet certain criteria.

SELECT
    name
FROM
    employees e
WHERE
    NOT EXISTS (SELECT 1 FROM departments d WHERE d.dept_id = e.dept_id);
    
-- Subquery with ANY or ALL
-- Subqueries can be used with ANY or ALL to compare a value to a set of values returned by the subquery.

-- Any
SELECT
    name
FROM
    employees
WHERE
    salary > ANY (SELECT salary FROM employees WHERE dept_id = 90);
    
-- All
SELECT
    name
FROM
    employees
WHERE
    salary > ALL (SELECT salary FROM employees WHERE dept_id = 90);
    
-- Correlated Subqueries
-- A correlated subquery is a subquery that refers to a column from the outer query.

SELECT
    e1.name,
    e1.salary
FROM
    employees e1
WHERE
    e1.salary > (SELECT AVG(e2.salary) FROM employees e2 WHERE e2.dept_id = e1.dept_id);
