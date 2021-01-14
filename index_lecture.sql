USE jupiter_db;

-- ====================================
-- ============================== INDEX
-- ====================================

/*
  A data structure to enable faster table operations

  Multiple Index types (optimizes performance)...

    Primary Key
    Index / Key
    Unique Index
  - typically speeds up searching and slows insertion / updating records
  - the choice of whether or not to include an index on a column(s) should be based on weighing pros cons
  - for our use, it will be a best practice to include a primary key on every table
*/
-- ============= PRIMARY KEY

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
                      id INT UNSIGNED,
                      pet_name VARCHAR(30) NOT NULL,
                      owner_name VARCHAR(30),
                      age INT
);

DESCRIBE pets;

# Display all unique identifiers/ indices for our pets table
SHOW INDEX from pets;

# Modified id to have a primary key.
ALTER TABLE pets
    MODIFY COLUMN id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT;

-- How to drop a primary key

ALTER TABLE pets
    MODIFY COLUMN id INT UNSIGNED; -- drop AUTO_INCREMENT first

ALTER TABLE pets
    DROP PRIMARY KEY;

SHOW CREATE TABLE pets;

DROP TABLE pets;

CREATE TABLE pets (
                      id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                      pet_name VARCHAR(30) NOT NULL,
                      owner_name VARCHAR(30),
                      age INT
);

DESCRIBE pets;


-- ============= INDEX / KEY
SHOW INDEX FROM pets;

-- add name index
ALTER TABLE pets
    ADD INDEX `pet_name_key` (pet_name);

-- ============= UNIQUE INDEX

-- create pets with unique name and owner

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
                      id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                      pet_name VARCHAR(30) NOT NULL,
                      owner_name VARCHAR(30),
                      age INT,
                      UNIQUE unique_pn_on (pet_name, owner_name)
);

# Dropping index from a column
ALTER TABLE pets
    DROP INDEX unique_pn_on;

SHOW INDEX FROM pets;

# Adding unique index outside of table creation
ALTER TABLE pets
    ADD UNIQUE `unique_pn_on` (pet_name, owner_name);

-- test unique constraints
INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Skippy', 'Jane Doe', 3);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Scruffy', 'Jane Doe', 4);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Bob', 'Correy', 3);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Skippy', 'Jane Doe', 3);

SELECT * FROM pets;


-- ============================== CONSTRAINT

/*
  Multiple constraint types (maintains "referential integrity")...
  - Not Null
  - Unique
  - Default
  - Foreign Key
  - Primary Key (combo of UNIQUE and NOT NULL constraints)
*/

-- ============= FOREIGN KEYS

DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
                        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(50) NOT NULL,
                        address VARCHAR(255) DEFAULT 'Unknown'
);

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
                      id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                      pet_name VARCHAR(30) NOT NULL,
                      owner_name VARCHAR(30),
                      age INT,
                      owner_id INT UNSIGNED,
                      UNIQUE unique_pn_on (pet_name, owner_name),
                      FOREIGN KEY (owner_id) REFERENCES owners(id)
);

show tables;
DESCRIBE pets;
DESCRIBE owners;

SHOW INDEX FROM pets;

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', null, 3);

SELECT * FROM pets;
SELECT * FROM owners;

INSERT INTO pets (pet_name, owner_id,age)
VALUES ('Patch', 1, 2); -- error! (referential integrity. cannot add an owner id like this)

INSERT INTO owners (name, address)
VALUES ('Darth Vader', '1138 Death Star Rd.');

INSERT INTO pets (pet_name, owner_id,age)
VALUES ('Patch', 1, 2); -- this works! we have an owner with an id of 1

# How should I drop these tables?

DROP TABLE pets;
DROP TABLE owners;