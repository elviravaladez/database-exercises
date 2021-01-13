USE employees;

SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC, first_name;

SELECT * FROM employees;

SELECT first_name, last_name, birth_date
FROM employees
ORDER BY birth_date DESC;