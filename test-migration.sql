USE codeup_test_db;

CREATE TABLE IF NOT EXISTS transactions (
    id INT(11),
    date DATE,
    description VARCHAR(255),
    amount DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS items (
    id INT,
    price DECIMAL(10, 2),
    description VARCHAR(255),
    name VARCHAR(255),
    category CHAR(50)
    -- THIS IS A COMMENT
);

CREATE TABLE IF NOT EXISTS users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  is_admin TINYINT NOT NULL DEFAULT 0,
  zipcode CHAR(15) DEFAULT '12345',
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS blog_posts(
    title VARCHAR(100) NOT NULL,
    body TEXT
);


CREATE TABLE IF NOT EXISTS contacts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL DEFAULT 'unknown',
    phone_number VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    email VARCHAR(50),
    zipcode CHAR(15)
    PRIMARY KEY(id)
);

DESCRIBE transactions;

DROP TABLE transactions;