-- Creating Views
-- Views are virtual tables based on the result-set of an SQL statement. 

-- Simple View
-- This view shows basic employee information.

CREATE VIEW employee_basic_info AS
SELECT 
    employee_id, first_name, last_name, department_id
FROM 
    employees;

-- Complex View
-- This view joins multiple tables and includes calculated fields.

CREATE VIEW employee_detailed_info AS
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    e.salary, 
    e.hire_date, 
    d.department_name
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id;
    
-- View with Aggregation
-- This view calculates the average salary by department.

CREATE VIEW avg_salary_by_department AS
SELECT 
    department_id, 
    AVG(salary) AS average_salary
FROM 
    employees
GROUP BY 
    department_id;
    
-- DROP VIEW 
-- This view is used to remove a view from the database

DROP VIEW IF EXISTS employee_basic_info;
DROP VIEW IF EXISTS employee_detailed_info;
DROP VIEW IF EXISTS avg_salary_by_department;

