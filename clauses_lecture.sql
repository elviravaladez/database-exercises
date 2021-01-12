USE employees;

# The WHERE clause can be used to filter our results to do exactly what we want using criteria we specify.

# Using WHERE clauses

# The WHERE clause, if given, indicates the condition or conditions that rows must satisfy to be selected.
# The WHERE condition is an expression that evaluates to true for each row to be selected.
# The statement selects all rows if there is no WHERE clause.

SELECT * FROM departments
WHERE dept_no = 'd009';

# We can use WHERE with the LIKE option to find similarities. The % are wildcards.

# This query will select all first names with the letters combination 'sus':
SELECT first_name
FROM employees
WHERE first_name LIKE '%sus%';

# While not a part of the WHERE clause, it is worth mentioning that we can add the DISTINCT keyword to our SELECT statement to only get non-repeating values.
SELECT DISTINCT first_name, last_name
FROM employees
WHERE first_name LIKE '%sus%';
# Now, instead of seeing over 1,600 names with sus in them, we can see the 7 distinct names with 'sus' in them.


# We can use WHERE with BETWEEN to find specific ranges of values.

# To find all the employees between employee number 10026 and 10082:
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no BETWEEN 10026 AND 10082;


# We can use WHERE with IN to query only very specific sets of values.
# The () are required when you use IN.
# To find all the employees with the last name of 'Herber', 'Dredge', 'Lipner', and 'Baek':
SELECT first_name, last_name
FROM employees
WHERE last_name IN ('Pearson', 'Luks', 'Peyn');


# Trying to look for people who are still working at the company
SELECT emp_no
FROM titles
WHERE to_date IS NULL;
# When you run this, it's empty b/c everyone in the database is no longer working there


# SHOWS US THE SETUP OF THE titles TABLE
DESCRIBE titles;


# Chaining WHERE clauses
# We can chain together an IN clause with a LIKE clause, or any of the clauses, using
# AND and OR
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber','Baek')
  AND emp_no < 20000;


# The important thing is that we can chain as many of these as
# we please together, but it can get messy very quickly.
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
    AND last_name IN ('Herber','Baek')
   OR first_name = 'Shridhar'; #OR is being evaluated separately. So all info from this is being displayed BUT it will also include emp_no GREATER THAN > 20000


# We can force evaluation grouping using ().
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
  AND (
            last_name IN ('Herber','Baek')
        OR first_name = 'Shridhar'
    );