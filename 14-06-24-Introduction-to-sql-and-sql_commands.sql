-- SQL (Structured Query Language) is a standard language for accessing and manipulating databases.
-- SQL is used to query, insert, update, and modify data within a database.

-- Creating a database
CREATE DATABASE School;

-- Using a database
USE School;

-- DDL (Data Definition Language) is used to define and modify database structures.
-- Create a table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Grade VARCHAR(10)
);

-- Alter a table to add a new column
ALTER TABLE Students ADD Email VARCHAR(100);

-- Drop a table
DROP TABLE Students;

-- DML (Data Manipulation Language) is used to manage data within schema objects.
-- Insert a record into the Students table
INSERT INTO Students (StudentID, Name, Age, Grade) VALUES (1, 'Anushka', 19, 'A');

-- Update a record in the Students table
UPDATE Students SET Age = 21 WHERE StudentID = 1;

-- Delete a record from the Students table
DELETE FROM Students WHERE StudentID = 1;

-- Start a transaction
START TRANSACTION;

-- Insert multiple records as a transaction
INSERT INTO Students (StudentID, Name, Age, Grade) VALUES (2, 'Apoorva', 19, 'B');
INSERT INTO Students (StudentID, Name, Age, Grade) VALUES (3, 'Arham', 22, 'C');

-- Commit the transaction
COMMIT;

-- Rollback a transaction
START TRANSACTION;

-- Update a record
UPDATE Students SET Age = 23 WHERE StudentID = 2;

-- Rollback the transaction, undoing the update
ROLLBACK;

-- Example of SAVEPOINT to partially rollback transactions
START TRANSACTION;

-- Insert a record
INSERT INTO Students (StudentID, Name, Age, Grade) VALUES (4, 'Anushree', 21, 'A');

-- Set a savepoint
SAVEPOINT Savepoint1;

-- Insert another record
INSERT INTO Students (StudentID, Name, Age, Grade) VALUES (5, 'Mike Ross', 20, 'B');

-- Rollback to savepoint, undoing the second insert
ROLLBACK TO Savepoint1;

-- Commit the transaction, finalizing the first insert
COMMIT;

-- DCL (Data Control Language) is used to control access to data in the database.

-- Grant a user permissions
GRANT SELECT, INSERT, UPDATE ON School.Students TO 'user1'@'localhost';

-- Revoke a user's permissions
REVOKE INSERT, UPDATE ON School.Students FROM 'user1'@'localhost';

-- Create a user
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password';

-- Drop a user
DROP USER 'user1'@'localhost';

-- Grant all privileges on the database to a user
GRANT ALL PRIVILEGES ON School.* TO 'user1'@'localhost';

-- Show privileges granted to a user
SHOW GRANTS FOR 'user1'@'localhost';

-- DQL (Data Query Language) is used to fetch data from the database.
-- Select all records from the Students table
SELECT * FROM Students;

-- Select specific columns from the Students table
SELECT StudentID, Name, Age FROM Students;

-- Select records with a condition
SELECT * FROM Students WHERE Age > 18;

-- Select records with sorting
SELECT * FROM Students ORDER BY Name ASC;

-- Aggregate functions and grouping
SELECT Age, COUNT(*) AS NumberOfStudents FROM Students GROUP BY Age;
