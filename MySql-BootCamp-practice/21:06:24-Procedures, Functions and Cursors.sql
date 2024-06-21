-- Create the database
CREATE DATABASE companyOperationsDB;
USE companyOperationsDB;

-- Create employees table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Create departments table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50),
    location_id INT
);

-- Create stored procedure GetEmployeesByDepartment
DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT 
        employee_id, first_name, last_name, salary, hire_date 
    FROM 
        employees 
    WHERE 
        department_id = dept_id;
END //

DELIMITER ;

-- Create stored function GetAverageSalary
DELIMITER //

CREATE FUNCTION GetAverageSalary(dept_id INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE avg_salary DECIMAL(10, 2);
    SELECT AVG(salary) INTO avg_salary
    FROM employees
    WHERE department_id = dept_id;
    RETURN avg_salary;
END //

DELIMITER ;

-- Create procedure GiveRaise using cursor
DELIMITER //

CREATE PROCEDURE GiveRaise(dept_id INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_salary DECIMAL(10, 2);

    -- Declare a cursor to select employee IDs and their salaries
    DECLARE emp_cursor CURSOR FOR 
        SELECT employee_id, salary 
        FROM employees 
        WHERE department_id = dept_id;

    -- Declare a handler to set the done variable when there are no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN emp_cursor;

    emp_loop: LOOP
        FETCH emp_cursor INTO emp_id, emp_salary;
        IF done THEN
            LEAVE emp_loop;
        END IF;

        -- Update each employee's salary with a 10% raise
        UPDATE employees 
        SET salary = emp_salary * 1.10 
        WHERE employee_id = emp_id;
    END LOOP;

    CLOSE emp_cursor;
END //

DELIMITER ;

-- To call this procedure:
CALL GiveRaise(1);

