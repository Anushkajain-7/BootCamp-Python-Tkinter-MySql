-- Arithmetic operators are used to perform mathematical operations.

-- Addition
SELECT 5 + 3 AS Addition; -- Adds two numbers.

-- Subtraction
SELECT 5 - 3 AS Subtraction; -- Subtracts one number from another.

-- Multiplication
SELECT 5 * 3 AS Multiplication; -- Multiplies two numbers.

-- Division
SELECT 10 / 2 AS Division; -- Divides one number by another.

-- Modulus
SELECT 10 % 3 AS Modulus; -- Returns the remainder of a division operation.


-- Comparison operators are used to compare two values.

-- Equal to
SELECT 5 = 3 AS EqualTo; -- Checks if two values are equal.

-- Not equal to
SELECT 5 != 3 AS NotEqualTo; -- Checks if two values are not equal.

-- Greater than
SELECT 5 > 3 AS GreaterThan; -- Checks if one value is greater than another.

-- Less than
SELECT 5 < 3 AS LessThan; -- Checks if one value is less than another.

-- Greater than or equal to
SELECT 5 >= 3 AS GreaterThanOrEqualTo; -- Checks if one value is greater than or equal to another.

-- Less than or equal to
SELECT 5 <= 3 AS LessThanOrEqualTo; -- Checks if one value is less than or equal to another.

-- BETWEEN
SELECT 5 BETWEEN 3 AND 7 AS BetweenOperator; -- Checks if a value is between two other values.


-- Logical operators are used to combine multiple conditions.

-- AND
SELECT 5 > 3 AND 5 < 10 AS AndOperator; -- Returns true if both conditions are true.

-- OR
SELECT 5 > 3 OR 5 < 3 AS OrOperator; -- Returns true if at least one of the conditions is true.

-- NOT
SELECT NOT (5 > 3) AS NotOperator; -- Reverses the result of the condition.


-- Bitwise operators are used to perform bit-level operations.

-- Bitwise AND
SELECT 5 & 3 AS BitwiseAnd; -- Performs a bitwise AND operation.

-- Bitwise OR
SELECT 5 | 3 AS BitwiseOr; -- Performs a bitwise OR operation.

-- Bitwise XOR
SELECT 5 ^ 3 AS BitwiseXor; -- Performs a bitwise XOR operation.

-- Bitwise NOT
SELECT ~5 AS BitwiseNot; -- Performs a bitwise NOT operation.

-- Bitwise left shift
SELECT 5 << 1 AS LeftShift; -- Shifts bits to the left by the specified number of positions.

-- Bitwise right shift
SELECT 5 >> 1 AS RightShift; -- Shifts bits to the right by the specified number of positions.


-- Assignment operators are used to assign values to variables.

-- Assign value
SET @x = 5; -- Assigns the value 5 to the variable @x.

-- Add and assign
SET @x = @x + 3; -- Adds 3 to the value of @x and assigns the result to @x.

-- Subtract and assign
SET @x = @x - 3; -- Subtracts 3 from the value of @x and assigns the result to @x.

-- Multiply and assign
SET @x = @x * 3; -- Multiplies the value of @x by 3 and assigns the result to @x.

-- Divide and assign
SET @x = 10;
SET @x = @x / 2; -- Divides the value of @x by 2 and assigns the result to @x.

-- Modulus and assign
SET @x = 10;
SET @x = @x % 3; -- Computes the modulus of @x by 3 and assigns the result to @x.
