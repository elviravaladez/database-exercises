USE codeup_test_db;

CREATE TABLE IF NOT EXISTS albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    release_date INT(4),
    sales FLOAT,
    genre VARCHAR(255),
    PRIMARY KEY(id)
);

DESCRIBE albums;