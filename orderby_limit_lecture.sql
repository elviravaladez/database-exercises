USE employees;

SELECT first_name, last_name, birth_date
FROM employees
ORDER BY first_name DESC, last_name, birth_date;

SELECT * FROM employees
LIMIT 15 OFFSET 5;

SELECT first_name, last_name, birth_date
FROM employees
ORDER BY birth_date DESC;

DESCRIBE employees;