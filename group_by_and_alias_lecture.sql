# ** GROUP BY **

SELECT DISTINCT first_name
FROM employees;


# GROUP BY returns only the unique occurrences of the column specified.
SELECT first_name
FROM employees
GROUP BY first_name;

# Returns 1,275 results. These are all unique occurrences of first names





-- ---------------------------------------------------------------------------------


# ** ASC/DESC **

#You can also specify ASC and DESC after columns named in the clause like so:

SELECT first_name
FROM employees
GROUP BY first_name DESC;



-- ---------------------------------------------------------------------------------


# ** MULTIPLE COLUMNS **

SELECT last_name, first_name
FROM employees
GROUP BY last_name, first_name;

# Unique combinations of first and last names
# Grouped by last name alphabetically
# Within each last name group, sorted by first name
# Any column(s) that appear in the SELECT should also be in the GROUP BY clause.



-- ---------------------------------------------------------------------------------



# **AGGREGATE FUNCTIONS **
# An aggregate function works with data across all the rows in our result




# COUNT Function
# The COUNT() function will return the number of non-null expression values
# in a result. You will commonly see it written as COUNT(*). For example,
# if we wanted to see how many rows were in our employees table total,
# we would run:
SELECT COUNT(*) FROM employees; #300024

# This ^^ will give total number of rows in employees table




# If we were only concerned about the values in a given column, we can pass that to the COUNT() function:
SELECT COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'; #118195

# This ^^ will give total number first names that do not have an a in them (118,195 total)



# Using GROUP BY with Aggregate Functions
# We can combine our use of aggregate functions with the GROUP BY clause to produce more meaningful results.
# If we want to find out how many unique first names do not contain an 'a', we know we can use a GROUP BY, but we can also combine this with the aggregate COUNT function to find how many employees have each unique last name:
SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name; #500 unique names

# This ^^ outputs each unique first name without an "a"
# This also will return the count of each of those names
# Results: 500 - There are 500 unique first names that do not have an "a" in them





-- ---------------------------------------------------------------------------------



# ** ALIASES **

# Aliases are commonly used to make temporary names for joins, or to change the output of a column's name.
# The alias name can be used in GROUP BY, ORDER BY, OR HAVING clause
# The original column name can still be used
# Do not use an alias in a where clause, bc  that value may not yet be determined, resulting in an error
# Aliases can help improve the readability of the output and query

SELECT first_name AS first_name_alias
FROM employees
LIMIT 5;




SELECT CONCAT(first_name, ' ', last_name) AS full_name #full_name is the alias
FROM employees
LIMIT 25;


SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
ORDER BY full_name # calling on the alias to order them
LIMIT 25;

# CANNOT call on the alias in the WHERE clause

# Use ALIAS with the
    #ORDER BY
    #GROUP BY
    #HAVING clause




#The following query will show us the 10 most common hire dates for employees.
SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;
# Title is COUNT(*)



# Same query results, but this one is more understandable!
SELECT hire_date, COUNT(*) as number_hired
FROM employees
GROUP BY hire_date
ORDER BY number_hired DESC #using the alias
LIMIT 10;
# Title is number_hired