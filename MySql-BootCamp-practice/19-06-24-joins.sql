show databases;
use CompanyDB;
show tables;

-- Inner Join
-- Returns records that have matching values in both tables.
-- Select employees and their corresponding department names using INNER JOIN
SELECT 
    employees.name AS employee_name,  -- Employee name
    departments.dept_name AS department_name  -- Department name
FROM 
    employees
INNER JOIN 
    employee_department ON employees.id = employee_department.emp_id
INNER JOIN 
    departments ON employee_department.dept_id = departments.dept_id;

-- Left (Outer) Join
-- Returns all records from the left table, and the matched records from the right table. The result is NULL from the right side if there is no match.

-- Select all employees and their corresponding department names, including those without a department
SELECT 
    employees.name AS employee_name,  -- Employee name
    departments.dept_name AS department_name  -- Department name
FROM 
    employees
LEFT JOIN 
    employee_department ON employees.id = employee_department.emp_id
LEFT JOIN 
    departments ON employee_department.dept_id = departments.dept_id;
    
-- Right (Outer) Join
-- Returns all records from the right table, and the matched records from the left table. The result is NULL from the left side when there is no match.

-- Select all departments and their corresponding employees, including departments without employees
SELECT 
    employees.name AS employee_name,  -- Employee name
    departments.dept_name AS department_name  -- Department name
FROM 
    employees
RIGHT JOIN 
    employee_department ON employees.id = employee_department.emp_id
RIGHT JOIN 
    departments ON employee_department.dept_id = departments.dept_id;
    

