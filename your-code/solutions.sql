/* CHALLENGE 1 */

/* Checking the tables */

SELECT *
FROM solutions.authors;

SELECT *
FROM solutions.publishers;

SELECT *
FROM solutions.titleauthor;

SELECT *
FROM solutions.titles;

/* Challenge 1 Query */

SELECT titleauthor.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", title AS "TITLE", pub_name AS "PUBLISHER"
FROM solutions.titleauthor
INNER JOIN solutions.authors
ON solutions.titleauthor.au_id = solutions.authors.au_id
INNER JOIN solutions.titles
ON solutions.titleauthor.title_id = solutions.titles.title_id
INNER JOIN solutions.publishers
ON solutions.titles.pub_id = solutions.publishers.pub_id
ORDER BY solutions.titleauthor.au_id;
    
    
/* Check total */

SELECT *
FROM solutions.titleauthor;



/* CHALLENGE 2 */

/* Challenge 2 Query */

SELECT titleauthor.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", pub_name AS "PUBLISHER", COUNT(titles.title_id) AS "TITLE COUNT"
FROM solutions.titleauthor
INNER JOIN solutions.authors
ON solutions.titleauthor.au_id = solutions.authors.au_id
INNER JOIN solutions.titles
ON solutions.titleauthor.title_id = solutions.titles.title_id
INNER JOIN solutions.publishers
ON solutions.titles.pub_id = solutions.publishers.pub_id
GROUP BY solutions.titleauthor.au_id, pub_name
ORDER BY solutions.titleauthor.au_id DESC;



/* CHALLENGE 3 */

SELECT *
FROM solutions.authors;

SELECT *
FROM solutions.titleauthor;

SELECT *
FROM solutions.sales;

/* Challenge 3 Query */

SELECT solutions.authors.au_id AS "AUTHOR ID", au_lname "LAST NAME", au_fname "FIRST NAME", SUM(sales.qty) AS "TOTAL"
FROM solutions.authors
LEFT JOIN solutions.titleauthor
ON solutions.titleauthor.au_id = solutions.authors.au_id
LEFT JOIN solutions.sales
ON solutions.titleauthor.title_id  = solutions.sales.title_id
GROUP BY solutions.authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;
    
    
    
/* CHALLENGE 4 */

/* Challenge 4 Query */

SELECT solutions.authors.au_id AS "AUTHOR ID", au_lname "LAST NAME", au_fname "FIRST NAME", IFNULL(SUM(sales.qty),0) AS "TOTAL"
FROM solutions.authors
LEFT JOIN solutions.titleauthor
ON solutions.titleauthor.au_id = solutions.authors.au_id
LEFT JOIN solutions.sales
ON solutions.titleauthor.title_id  = solutions.sales.title_id
GROUP BY solutions.authors.au_id
ORDER BY Total DESC;