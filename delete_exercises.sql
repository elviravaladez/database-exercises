USE codeup_test_db;

SELECT 'Albums released after 1991' AS '';
DELETE name FROM albums
WHERE release_date > 1991;

SELECT 'Albums with the genre disco' AS '';
DELETE name FROM albums
WHERE genre = 'disco';

SELECT 'Albums by Whitney Houston' AS '';
DELETE name FROM albums
WHERE artist = 'Whitney Houston';