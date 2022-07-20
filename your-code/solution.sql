/* Challenge 1 - Who Have Published What At Where? */

SELECT * FROM publications.publishers;

SELECT publications.publishers.pub_name AS Publishers, publications.titles.title AS Titles
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id;

SELECT publications.authors.au_id AS Author_id, publications.authors.au_lname AS Last_Name, publications.authors.au_fname AS First_Name, Title, Publisher
FROM 
(SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id) AS Pub_Title
INNER JOIN publications.authors
ON publications.authors.au_id = publications.authors.au_id;

/* Challenge 2 - Who Have Published How Many At Where?*/

CREATE TEMPORARY TABLE publications.challenge1 AS
SELECT publications.authors.au_id AS Author_id, publications.authors.au_lname AS Last_Name, publications.authors.au_fname AS First_Name, Title, Publisher
FROM 
(SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id) AS Pub_Title
INNER JOIN publications.authors
ON publications.authors.au_id = publications.authors.au_id;

SELECT Author_id, Last_Name, First_Name, Publisher, COUNT(Title) AS Title_count
FROM publications.challenge1
GROUP BY Author_id, Last_Name, First_Name, Publisher
ORDER BY Title_count DESC;

/* CHALLENGE 3: Who are the top 3 authors who have sold the highest number of titles? */

CREATE TEMPORARY TABLE publications.Authors_id AS
SELECT publications.authors.au_id AS Author_id, publications.authors.au_lname AS Last_Name, publications.authors.au_fname AS First_Name
FROM publications.authors;

CREATE TEMPORARY TABLE publications.Sale AS
SELECT publications.titleauthor.au_id AS Author_id, publications.titleauthor.title_id AS Title_id, publications.titles.ytd_sales AS SALES
FROM publications.titleauthor
INNER JOIN publications.titles
ON publications.titleauthor.title_id = publications.titles.title_id;


SELECT publications.Authors_id.Author_id, publications.Authors_id.Last_Name, publications.Authors_id.First_Name, SUM(SALES) AS TOTAL
FROM authors_id
INNER JOIN Sale
ON publications.Authors_id.Author_id = publications.sale.Author_id
GROUP BY Author_id, Last_Name, First_Name
ORDER BY TOTAL DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking */

SELECT publications.Authors_id.Author_id, publications.Authors_id.Last_Name, publications.Authors_id.First_Name, IFNULL(SUM(SALES),0) AS TOTAL
FROM authors_id
INNER JOIN Sale
ON publications.Authors_id.Author_id = publications.sale.Author_id
GROUP BY Author_id, Last_Name, First_Name
ORDER BY TOTAL DESC
LIMIT 23;

