USE employees;

# TODO: Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');


# TODO: Find all employees whose last name starts with 'E' — 7,330 rows.
SELECT *
FROM employees
WHERE last_name LIKE 'E%';


# TODO: Find all employees hired in the 90s — 135,214 rows.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';


# TODO: Find all employees born on Christmas — 842 rows.
SELECT *
FROM employees
WHERE birth_date LIKE ('%12-25');


# TODO: Find all employees with a 'q' in their last name — 1,873 rows.
SELECT *
FROM employees
WHERE last_name LIKE ('%q%');


# TODO: Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
SELECT *
FROM employees
WHERE first_name = 'Irena'
   OR first_name = 'Vidya'
   OR first_name = 'Maya';


# TODO: Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
SELECT *
FROM employees
WHERE gender = 'M'
  AND (first_name = 'Irena'
   OR first_name = 'Vidya'
   OR first_name = 'Maya');


# TODO: Find all employees whose last name starts or ends with 'E' — 30,723 rows.
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%e';


# TODO: Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
   AND last_name LIKE '%e';


# TODO: Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT *
FROM employees
WHERE birth_date LIKE ('%12-25')
  AND hire_date BETWEEN '1990-01-01' AND '1999-12-31';


# TODO: Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';