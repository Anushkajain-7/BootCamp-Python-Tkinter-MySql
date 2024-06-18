-- Create a new database named 'CompanyDB'
CREATE DATABASE CompanyDB;

-- Switch to the newly created database
USE CompanyDB;

-- Create a table named 'employees'
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    position VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Insert sample data into the 'employees' table
INSERT INTO employees (name, position, salary, hire_date) VALUES
('Anushka', 'Manager', 75000.00, '2004-11-01'),
('Anshi', 'Developer', 60000.00, '2000-03-15'),
('Lucky', 'Developer', 62000.00, '1999-07-22'),
('Michael Ross', 'Sales', 58000.00, '1997-11-10'),
('Harvey Spectar', 'HR', 54000.00, '1987-02-19');

-- Aggregate Functions

-- Returns the average value of the salary column
SELECT AVG(salary) FROM employees;

-- Returns the number of employees in the table
SELECT COUNT(*) FROM employees;

-- Returns the highest salary in the table
SELECT MAX(salary) FROM employees;

-- Returns the lowest salary in the table
SELECT MIN(salary) FROM employees;

-- Returns the total sum of all salaries in the table
SELECT SUM(salary) FROM employees;

-- Scalar Functions

-- String Functions

-- Converts the employee name to uppercase
SELECT UPPER(name) FROM employees;

-- Converts the employee name to lowercase
SELECT LOWER(name) FROM employees;

-- Returns the length of the employee name
SELECT LENGTH(name) FROM employees;

-- Extracts the first three characters from the employee name
SELECT SUBSTRING(name, 1, 3) FROM employees;

-- Removes leading and trailing spaces from the employee name (if any)
SELECT TRIM(name) FROM employees;

-- Numeric Functions
-- Rounds the salary to 2 decimal places
SELECT ROUND(salary, 2) FROM employees;

-- Returns the smallest integer greater than or equal to the salary
SELECT CEIL(salary) FROM employees;

-- Returns the largest integer less than or equal to the salary
SELECT FLOOR(salary) FROM employees;

-- Returns the absolute value of the salary difference (for demonstration)
SELECT ABS(salary - 60000) FROM employees;

-- Date Functions

-- Returns the current date and time
SELECT NOW();

-- Returns the current date
SELECT CURDATE();

-- Returns the current time
SELECT CURTIME();

-- Adds 1 year to the hire_date
SELECT DATE_ADD(hire_date, INTERVAL 1 YEAR) FROM employees;

-- Returns the number of days between the current date and hire_date
SELECT DATEDIFF(CURDATE(), hire_date) FROM employees;

-- Returns the year part of the hire_date
SELECT YEAR(hire_date) FROM employees;


-- System Functions

-- Returns the current database user
SELECT USER();

-- Returns the name of the current database
SELECT DATABASE();

-- Returns the version of the database
SELECT VERSION();

-- Combined Example

SELECT 
-- Converts the employee name to uppercase
  UPPER(name) AS upper_name,  
-- Returns the length of the employee name
  LENGTH(name) AS name_length,  
-- Rounds the salary to 2 decimal places
  ROUND(salary, 2) AS rounded_salary,  
-- Returns the current date
  CURDATE() AS current_date  
FROM 
  employees 
-- Selects employees with above-average salaries
WHERE 
  salary > (SELECT AVG(salary) FROM employees); 
