USE join_test_db;

# TODO: Create a database named join_test_db and run the SQL provided in the Join Example DB.
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE IF NOT EXISTS roles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

# Checking to see if the data above was saved correctly
SELECT * FROM roles;
SELECT * FROM users;


# TODO: Insert 4 new users into the database. One should have a NULL role. The other three should be authors.
INSERT INTO users (name, email, role_id) VALUES
('sam', 'sam@example.com', 2),
('john', 'john@example.com', NULL),
('taylor', 'taylor@example.com', 2),
('madison', 'madison@example.com', 2);

# Checking to see if the data above was saved correctly
SELECT * FROM users;


# TODO: Use join, left join, and right join to combine results from the users and roles tables as we did in
#  the lesson. Before you run each query, guess the expected number of results.

# JOIN (INNER JOIN) - For a basic join, we can expect that we will get only the results where both the left and right tables have values for their respective keys that are mentioned in the ON part of the query.
SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;
-- OUTCOME
# +-----------+-----------+
# | user_name | role_name |
# +-----------+-----------+
# | bob       | admin     |
# | joe       | author    |
# | sally     | reviewer  |
# | adam      | reviewer  |
# | sam       | author    |
# | taylor    | author    |
# | madison   | author    |
# +-----------+-----------+


# LEFT JOIN - A left join is used when you want to retrieve all the records from the left table, regardless of whether or not they have a corresponding record in the right table.
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
-- OUTCOME
# +-----------+-----------+
# | user_name | role_name |
# +-----------+-----------+
# | bob       | admin     |
# | joe       | author    |
# | sam       | author    |
# | taylor    | author    |
# | madison   | author    |
# | sally     | reviewer  |
# | adam      | reviewer  |
# | jane      | <null>    |
# | mike      | <null>    |
# | john      | <null>    |
# +-----------+-----------+


# RIGHT JOIN - A right join is used when you want to retrieve all the records from the right table, regardless of whether or not they have a corresponding record in the left table. The reason that right join is not used as often is because a right join can be rewritten as a left join by changing the order of the tables in the query.
SELECT users.name AS  user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;
-- OUTCOME
# +-----------+-----------+
# | user_name | role_name |
# +-----------+-----------+
# | bob       | admin     |
# | joe       | author    |
# | sally     | reviewer  |
# | adam      | reviewer  |
# | sam       | author    |
# | taylor    | author    |
# | madison   | author    |
# | <null>    | commenter |
# +-----------+-----------+


# TODO: Although not explicitly covered in the lesson, aggregate functions like count can be used with join
#  queries.Use count and the appropriate join type to get a list of roles along with the number of users
#  that have a given role.
#  Hint: You will also need to use group by in the query.




# TODO: Using the example in the Associative Table Joins section as a guide, write a query that shows each
#  department along with the name of the current manager for that department.
# #   Department Name    | Department Manager
# #  --------------------+--------------------
# #   Customer Service   | Yuchang Weedman
# #   Development        | Leon DasSarma
# #   Finance            | Isamu Legleitner
# #   Human Resources    | Karsten Sigstam
# #   Marketing          | Vishwani Minakawa
# #   Production         | Oscar Ghazalie
# #   Quality Management | Dung Pesch
# #   Research           | Hilary Kambil
# #   Sales              | Hauke Zhang
SELECT r.name, COUNT(*) as Users
FROM users as u
         JOIN roles as r
              ON u.role_id = r.id
GROUP BY r.id;

USE employees;

-- Write a query that shows each department along with the name of the current manager for that department.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
         JOIN dept_manager AS m
              ON m.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = m.dept_no
WHERE m.to_date > NOW()
ORDER BY d.dept_name;


# TODO: Find the name of all departments currently managed by women.
# Department Name | Manager Name
# ----------------+-----------------
# Development     | Leon DasSarma
# Finance         | Isamu Legleitner
# Human Resources | Karsetn Sigstam
# Research        | Hilary Kambil
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM employees AS e
         JOIN dept_manager AS m
              ON m.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = m.dept_no
WHERE m.to_date > NOW()
  AND e.gender = 'F'
ORDER BY d.dept_name;


# TODO: Find the current titles of employees currently working in the Customer Service department.
# Title              | Count
# -------------------+------
# Assistant Engineer |    68
# Engineer           |   627
# Manager            |     1
# Senior Engineer    |  1790
# Senior Staff       | 11268
# Staff              |  3574
# Technique Leader   |   241
SELECT t.title AS "Title", COUNT(*) AS "Count"
FROM departments AS d
         JOIN dept_emp AS de
              ON de.dept_no = d.dept_no
         JOIN titles AS t
              ON t.emp_no = de.emp_no
WHERE de.to_date > NOW()
  AND t.to_date > NOW()
  AND d.dept_name = 'Customer Service'
GROUP BY t.title;

# TODO: Find the current salary of all current managers.
# Department Name    | Name              | Salary
# -------------------+-------------------+-------
# Customer Service   | Yuchang Weedman   |  58745
# Development        | Leon DasSarma     |  74510
# Finance            | Isamu Legleitner  |  83457
# Human Resources    | Karsten Sigstam   |  65400
# Marketing          | Vishwani Minakawa | 106491
# Production         | Oscar Ghazalie    |  56654
# Quality Management | Dung Pesch        |  72876
# Research           | Hilary Kambil     |  79393
# Sales              | Hauke Zhang       | 101987
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS 'Manager', s.salary
FROM salaries AS s
         JOIN dept_manager AS m
              ON m.emp_no = s.emp_no
         JOIN employees AS e
              ON e.emp_no = m.emp_no
         JOIN departments AS d
              ON d.dept_no = m.dept_no
WHERE m.to_date > NOW()
  AND s.to_date > NOW()
ORDER BY d.dept_name;


# TODO: Find the names of all current employees, their department name, and their current manager's name.
# 240,124 Rows
#
# Employee Name | Department Name  |  Manager Name
# --------------|------------------|-----------------
#  Huan Lortz   | Customer Service | Yuchang Weedman
#
#      .....
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', CONCAT(managers.first_name, ' ', managers.last_name) AS 'Manager Name'
FROM employees AS e
         JOIN dept_emp AS de
              ON de.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = de.dept_no
         JOIN dept_manager AS m
              ON m.dept_no = d.dept_no
         JOIN employees AS managers
              ON m.emp_no = managers.emp_no
WHERE de.to_date > NOW()
  AND m.to_date > NOW();