-- CURRENT_DATE and CURRENT_TIME
-- These functions return the current date and time, respectively.

SELECT CURRENT_DATE;  -- Returns the current date
SELECT CURRENT_TIME;  -- Returns the current time

-- NOW() : This function returns the current date and time.

SELECT NOW(); 

-- DATE(): Extracts the date part of a datetime expression.

SELECT DATE(NOW()); 

-- TIME(): Extracts the time part of a datetime expression.

SELECT TIME(NOW());  

-- YEAR(), MONTH(), DAY() : These functions extract the year, month, and day from a date, respectively.

SELECT YEAR(NOW());  -- Extracts the year from the current datetime
SELECT MONTH(NOW()); -- Extracts the month from the current datetime
SELECT DAY(NOW());   -- Extracts the day from the current datetime

-- HOUR(), MINUTE(), SECOND(): These functions extract the hour, minute, and second from a time, respectively.

SELECT HOUR(NOW());   -- Extracts the hour from the current datetime
SELECT MINUTE(NOW()); -- Extracts the minute from the current datetime
SELECT SECOND(NOW()); -- Extracts the second from the current datetime

-- DATE_FORMAT(): Formats a date according to the specified format.

SELECT DATE_FORMAT(NOW(), '%Y-%m-%d');        -- Formats the current datetime as 'YYYY-MM-DD'
SELECT DATE_FORMAT(NOW(), '%H:%i:%s');        -- Formats the current time as 'HH:MM:SS'
SELECT DATE_FORMAT(NOW(), '%W, %M %d, %Y');   -- Formats the current datetime as 'Weekday, Month Day, Year'

-- DATEDIFF(): Calculates the difference in days between two dates.

SELECT DATEDIFF('2024-12-31', '2024-01-01'); 

-- TIMESTAMPDIFF(): Calculates the difference between two timestamps in the specified unit.

SELECT TIMESTAMPDIFF(HOUR, '2024-01-01 10:00:00', '2024-06-01 12:00:00'); -- Returns the difference in hours
SELECT TIMESTAMPDIFF(MINUTE, '2024-01-01 10:00:00', '2024-06-01 10:30:00'); -- Returns the difference in minutes

-- ADDDATE() and SUBDATE(): These functions add or subtract a specified number of days to/from a date.

SELECT ADDDATE('2024-01-01', INTERVAL 10 DAY);  -- Adds 10 days to the date
SELECT SUBDATE('2024-01-01', INTERVAL 10 DAY);  -- Subtracts 10 days from the date

-- ADDTIME() and SUBTIME(): These functions add or subtract a specified time interval to/from a time.

SELECT ADDTIME('10:00:00', '02:30:00');  -- Adds 2 hours and 30 minutes to the time
SELECT SUBTIME('10:00:00', '02:30:00');  -- Subtracts 2 hours and 30 minutes from the time

-- STR_TO_DATE(): This function parses a date from a string according to a specified format.

SELECT STR_TO_DATE('01,5,2013', '%d,%m,%Y');  

-- UNIX_TIMESTAMP(): This function returns the current date and time as a Unix timestamp

SELECT UNIX_TIMESTAMP();

-- FROM_UNIXTIME(): This function converts a Unix timestamp to a datetime.

SELECT FROM_UNIXTIME(1672531199); 

-- WEEKDAY(): This function returns the weekday index for a date (0 = Monday, 1 = Tuesday, ..., 6 = Sunday).

SELECT WEEKDAY('2024-06-20');