USE codeup_test_db;

SELECT 'All albums in your table' AS '';
SELECT name FROM albums;

UPDATE albums
SET sales = sales * 10;

SELECT 'All info from table' AS '';
SELECT * FROM albums;


SELECT 'All albums released before 1980' AS '';
SELECT name FROM albums
WHERE release_date < 1980;

UPDATE albums
SET release_date = 1800
WHERE release_date < 1980;

SELECT 'REVISED: All albums released before 1980' AS '';
SELECT name, release_date FROM albums
WHERE release_date < 1980;

SELECT 'All albums by Michael Jackson' AS '';
SELECT name FROM albums
WHERE artist = 'Michael Jackson';

UPDATE albums
SET artist = 'Peter Jackson';
WHERE artist = 'Michael Jackson';

SELECT 'REVISED: All albums by Peter Jackson' AS '';
SELECT artist, name FROM albums
WHERE artist = 'Peter Jackson';