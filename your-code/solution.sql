/* CREATE DATABASE publications */

/* CHALLENGE 1 */

SELECT 
a.au_id AS 'AUTHOR ID', 
a.au_lname AS 'LAST NAME', 
a.au_fname AS 'FIRST NAME', 
t.title AS 'TITLE', 
p.pub_name AS 'PUBLISHER'
FROM titleauthor AS ta
INNER JOIN authors AS a
ON ta.au_id = a.au_id
INNER JOIN titles AS t
ON ta.title_id = t.title_id
INNER JOIN publishers as p
ON t.pub_id = p.pub_id;


/* CHALLENGE 2 */

SELECT 
a.au_id AS 'AUTHOR ID', 
a.au_lname AS 'LAST NAME', 
a.au_fname AS 'FIRST NAME', 
p.pub_name AS 'PUBLISHER',
COUNT(t.pub_id) AS 'TITLE COUNT'
FROM titleauthor AS ta
INNER JOIN authors AS a
ON ta.au_id = a.au_id
INNER JOIN titles AS t
ON ta.title_id = t.title_id
INNER JOIN publishers as p
ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id;


/* CHALLENGE 3 */
SELECT 
a.au_id AS 'AUTHOR ID', 
a.au_lname AS 'LAST NAME', 
a.au_fname AS 'FIRST NAME', 
SUM(t.ytd_sales) AS 'TOTAL'
FROM authors AS a
INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN titles AS t
ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;


/* CHALLENGE 4 */
SELECT 
a.au_id AS 'AUTHOR ID', 
a.au_lname AS 'LAST NAME', 
a.au_fname AS 'FIRST NAME', 
IFNULL(SUM(t.ytd_sales),0) AS 'TOTAL'
FROM authors AS a
LEFT JOIN titleauthor AS ta
ON a.au_id = ta.au_id
LEFT JOIN titles AS t
ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;
