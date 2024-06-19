CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    AuthorName VARCHAR(255),
    BorrowerName VARCHAR(255),
    BorrowDate DATE
);

INSERT INTO Books (BookID, Title, AuthorName, BorrowerName, BorrowDate) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'John Doe', '2024-06-01'),
(2, '1984', 'George Orwell', 'Jane Smith', '2024-06-10'),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', NULL, NULL),
(4, 'Moby Dick', 'Herman Melville', 'Alice Johnson', '2024-06-15');

-- Normalization

-- 1NF - First Normal Form
-- Multivalued attr should not be present
-- Primary key is present in the table
-- Repeating groups
-- Duplicate rows should not be there

-- The current schema is already in 1NF because each cell contains a single value and each record is unique.

-- 2NF - Second Normal Form
-- Should be in 1NF
-- No partial dependency - 
-- All non key attr should be completely dependent on primary key

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorName VARCHAR(255) UNIQUE
);

CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY AUTO_INCREMENT,
    BorrowerName VARCHAR(255) UNIQUE
);

ALTER TABLE Books ADD COLUMN AuthorID INT;
ALTER TABLE Books ADD COLUMN BorrowerID INT;

UPDATE Books SET AuthorID = (SELECT AuthorID FROM Authors WHERE AuthorName = Books.AuthorName);
UPDATE Books SET BorrowerID = (SELECT BorrowerID FROM Borrowers WHERE BorrowerName = Books.BorrowerName);

ALTER TABLE Books DROP COLUMN AuthorName;
ALTER TABLE Books DROP COLUMN BorrowerName;

-- 3NF - Third Normal Form
-- should be in 2NF
-- remove transitive dependencies. 
-- A non-prime attribute should not depend on another non-prime attribute.

ALTER TABLE Books DROP COLUMN BorrowerID;

CREATE TABLE BorrowedBooks (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    BorrowerID INT,
    BorrowDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);

INSERT INTO BorrowedBooks (BookID, BorrowerID, BorrowDate)
SELECT BookID, BorrowerID, BorrowDate FROM Books WHERE BorrowDate IS NOT NULL;

ALTER TABLE Books DROP COLUMN BorrowDate;

-- Final Normalized Schema

-- Authors Table
-- AuthorID: Unique identifier for an author
-- AuthorName: Name of the author

-- Borrowers Table
-- BorrowerID: Unique identifier for a borrower
-- BorrowerName: Name of the borrower

-- Books Table
-- BookID: Unique identifier for a book
-- Title: Title of the book
-- AuthorID: Foreign key referencing Authors

-- BorrowedBooks Table
-- BorrowID: Unique identifier for a borrowed book record
-- BookID: Foreign key referencing Books
-- BorrowerID: Foreign key referencing Borrowers
-- BorrowDate: Date when the book was borrowed



