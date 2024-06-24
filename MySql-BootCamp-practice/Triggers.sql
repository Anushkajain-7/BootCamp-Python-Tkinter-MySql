-- Triggers
-- BEFORE INSERT Trigger
-- This trigger ensures that the salary of a new employee is not negative before the insertion.

DELIMITER //

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END //

DELIMITER ;

-- AFTER INSERT Trigger
-- This trigger logs the insertion of a new employee into a employee_audit table.

-- Create employee_audit table for logging
CREATE TABLE employee_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action VARCHAR(50),
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, action)
    VALUES (NEW.employee_id, 'INSERT');
END //

DELIMITER ;

-- BEFORE UPDATE Trigger
-- This trigger ensures that an employee's salary is not decreased below a certain threshold.

DELIMITER //

CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary * 0.90 THEN
        SET NEW.salary = OLD.salary * 0.90;
    END IF;
END //

DELIMITER ;

-- AFTER UPDATE Trigger
-- This trigger logs updates to an employee's record into the employee_audit table.

DELIMITER //

CREATE TRIGGER after_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, action)
    VALUES (NEW.employee_id, 'UPDATE');
END //

DELIMITER ;
