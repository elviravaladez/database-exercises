USE employees;

# Another way to display your results
SELECT CONCAT(first_name, ' ', last_name)
FROM employees;

SELECT CONCAT(first_name, ' ', last_name) AS 'All Employees'
FROM employees;


# LIKE / NOT LIKE: Is case insensitive, but there are ways to search for a specific case-sensitive character
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'A%a'; #This is how you would find something that starts with A and ends with a


# # 'q' in the last name but not 'qu'
# SELECT last_name
# FROM employees
# WHERE last_name LIKE
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';


# DATE & TIME
SELECT NOW(); # 2021-01-13 09:40:12
# #Shows the date & time of your computer server


# CURRENT DATE
SELECT CURDATE(); # 2021-01-13


# CURRENT TIME
SELECT CURTIME(); # 09:41:21


# UNIX_TIMESTAMP() & UNIX_TIMESTAMP(date)

# The UNIX_TIMESTAMP() function is used to represent time as an integer.
# It will return the number of seconds since midnight January 1st, 1970.
# If you pass a date time value to UNIX_TIMESTAMP(), it will give you the
# number of seconds from the unix epoch to that date.

# UNIX Timestamp is a way of storing specific date and time on your website.
SELECT UNIX_TIMESTAMP(); # 1610552593

# For 1280512800, multiply by 1000, since java is expecting milliseconds:
# java.util.Date time=new java.util.Date((long)timeStamp*1000);


SELECT CONCAT(
    'Teaching people to code for ',
    UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2018-12-03'),
    'seconds'
    );