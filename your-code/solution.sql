/*Challenge 1*/

SELECT * FROM authors;
SELECT * FROM titleauthor;
SELECT * FROM titles;
SELECT * FROM publishers;

CREATE VIEW who_what_where AS
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title AS 'TITLE', publishers.pub_name AS 'PUBLISHER'
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id ASC, publishers.pub_id ASC;

SELECT * FROM who_what_where;

#to check if correct
SELECT
(SELECT COUNT(*) FROM who_what_where),
(SELECT COUNT(*) FROM titleauthor);


/*CHALLENGE 2*/

CREATE VIEW who_howmany_where AS
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name AS 'PUBLISHER', COUNT(titles.title) AS 'TITLE COUNT'
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY authors.au_id DESC, publishers.pub_name ASC;

SELECT * FROM who_howmany_where;

#to check if correct; backticks (`) to indicate that TITLE COUNT is a column
SELECT
(SELECT SUM(`TITLE COUNT`) AS 'TOTAL COUNT' FROM who_howmany_where),
(SELECT COUNT(*) FROM titleauthor);


/*CHALLENGE 3*/

SELECT * FROM sales;

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', SUM(sales.qty) AS 'TOTAL'
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;


/*CHALLENGE 4*/

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', IFNULL(SUM(sales.qty), 0) AS 'TOTAL'
FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;