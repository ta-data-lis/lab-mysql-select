## Challenge 1 - Who Have Published What At Where?

SELECT au_id, au_lname, au_fname
FROM publications.authors;

SELECT title
FROM publications.titles;

SELECT pub_name
FROM publications.publishers;

SELECT titleauthor.au_id, au_lname, au_fname, title_id
FROM publications.titleauthor
INNER JOIN (SELECT au_id, au_lname, au_fname
FROM publications.authors) AS author
ON titleauthor.au_id = author.au_id;

SELECT author_title_id.au_id, au_lname, au_fname, title, pub_id
FROM publications.titles
INNER JOIN (SELECT titleauthor.au_id, au_lname, au_fname, title_id
FROM publications.titleauthor
INNER JOIN (SELECT au_id, au_lname, au_fname
FROM publications.authors) AS author
ON titleauthor.au_id = author.au_id) AS author_title_id
ON titles.title_id = author_title_id.title_id;

SELECT pub_author_title_id.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', title AS TITLE, pub_name AS PUBLISHER 
FROM publications.publishers
INNER JOIN (SELECT author_title_id.au_id, au_lname, au_fname, title, pub_id
FROM publications.titles
INNER JOIN (SELECT titleauthor.au_id, au_lname, au_fname, title_id
FROM publications.titleauthor
INNER JOIN (SELECT au_id, au_lname, au_fname
FROM publications.authors) AS author
ON titleauthor.au_id = author.au_id) AS author_title_id
ON titles.title_id = author_title_id.title_id) AS pub_author_title_id
ON publishers.pub_id = pub_author_title_id.pub_id
ORDER BY pub_author_title_id.au_id;


## Challenge 2 - Who Have Published How Many At Where?

SELECT au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', pub_name AS PUBLISHER, count(au_id) AS 'TITLE COUNT'
FROM publications.publishers
INNER JOIN (SELECT author_title_id.au_id, au_lname, au_fname, title, pub_id
FROM publications.titles
INNER JOIN (SELECT titleauthor.au_id, au_lname, au_fname, title_id
FROM publications.titleauthor
INNER JOIN (SELECT au_id, au_lname, au_fname
FROM publications.authors) AS author
ON titleauthor.au_id = author.au_id) AS author_title_id
ON titles.title_id = author_title_id.title_id) AS pub_author_title_id
ON publishers.pub_id = pub_author_title_id.pub_id
GROUP BY publishers.pub_name, au_id
ORDER BY au_id DESC;

## Challenge 3 - Best Selling Authors

SELECT DISTINCT*
FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id;

SELECT DISTINCT au_id, au_lname, au_fname, SUM(qty) AS Total 
FROM publications.sales
RIGHT JOIN (SELECT authors.au_id, au_lname, au_fname, title_id
FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id) AS author_title
ON sales.title_id = author_title.title_id
GROUP BY au_id
ORDER BY total DESC
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking
CREATE TEMPORARY TABLE publications.best_selling_authors
SELECT DISTINCT au_id, au_lname, au_fname, SUM(qty) AS Total 
FROM publications.sales
RIGHT JOIN (SELECT authors.au_id, au_lname, au_fname, title_id
FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id) AS author_title
ON sales.title_id = author_title.title_id
GROUP BY au_id
ORDER BY total DESC;

SELECT *
FROM publications.best_selling_authors;

SELECT ISNULL('Total', 0 ) FROM publications.best_selling_authors;
Error Code: 1582. Incorrect parameter count in the call to native function 'ISNULL'


