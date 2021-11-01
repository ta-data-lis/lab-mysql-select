/* CHALLENGE 1 */

SELECT au_id AS AUTHOR_ID, au_lname AS Last_Name, au_fname AS First_Name, title AS Title, pub_name AS Publisher 
FROM lab2.titles
INNER JOIN (SELECT lab2.authors.au_id, au_lname, au_fname, title_id
FROM lab2.authors
INNER JOIN lab2.titleauthor
ON lab2.authors.au_id = lab2.titleauthor.au_id) AS select_title_id
ON lab2.titles.title_id = lab2.select_title_id.title_id
INNER JOIN lab2.publishers
ON lab2.publishers.pub_id = lab2.titles.pub_id;

/* CHALLENGE 2 */

SELECT au_id AS AUTHOR_ID, au_lname AS Last_Name, au_fname AS First_Name, COUNT(title) AS TITLE_COUNT, pub_name AS Publisher, count(pub_name) 
FROM lab2.titles
INNER JOIN (SELECT lab2.authors.au_id, au_lname, au_fname, title_id
FROM lab2.authors
INNER JOIN lab2.titleauthor
ON lab2.authors.au_id = lab2.titleauthor.au_id) as select_title_id
ON lab2.titles.title_id = lab2.select_title_id.title_id
INNER JOIN lab2.publishers
ON lab2.publishers.pub_id = lab2.titles.pub_id
GROUP BY lab2.authors.AUTHOR_ID, Publisher, lab2.authors.Last_Name, lab2.authors.First_Name;

/* CHALLENGE 3 */



SELECT *
FROM lab2.sales
INNER JOIN lab2.titles
ON lab2.sales.title_id = lab2.titles.title_id;

SELECT lab2.authors.au_id, au_lname, au_fname, count(title)
FROM lab2.sales
INNER JOIN lab2.titles
ON lab2.sales.title_id = lab2.titles.title_id
INNER JOIN lab2.titleauthor
ON lab2.titles.title_id = lab2.titleauthor.title_id
INNER JOIN lab2.authors
ON lab2.titleauthor.au_id = lab2.authors.au_id
GROUP BY au_id, title
ORDER BY count(title) DESC
LIMIT 3;


/* CHALLENGE 4 */

SELECT lab2.authors.au_id, au_lname, au_fname, count(title)
FROM lab2.sales
INNER JOIN lab2.titles
ON lab2.sales.title_id = lab2.titles.title_id
INNER JOIN lab2.titleauthor
ON lab2.titles.title_id = lab2.titleauthor.title_id
INNER JOIN lab2.authors
ON lab2.titleauthor.au_id = lab2.authors.au_id
GROUP BY au_id, title
ORDER BY count(title) DESC

