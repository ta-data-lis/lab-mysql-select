SELECT * FROM publications.publishers;

SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id;

SELECT publications.authors.au_id AS Author_id, publications.authors.au_lname AS First_Name, publications.authors.au_fname AS Last_Name, Title, Publisher
FROM 
(SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id) AS Pub_Title
INNER JOIN publications.authors
ON publications.authors.au_id = publications.authors.au_id;

CREATE TEMPORARY TABLE publications.pub_title AS 
SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id;

SELECT *
FROM pub_title;

CREATE VIEW publications.pub_title AS 
SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id;