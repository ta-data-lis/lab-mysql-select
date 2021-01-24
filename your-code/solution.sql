/* CHALLENGE 1*/



SELECT * FROM publications.authors;

SELECT * FROM publications.titles;

SELECT * FROM publications.publishers;

SELECT * FROM publications.titleauthor;

SELECT au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME"
FROM publications.authors;

SELECT title as "TITLE"
FROM publications.titles;

SELECT pub_name AS "PUBLISHER" 
FROM publications.publishers;

CREATE TEMPORARY TABLE publications.authors_names
SELECT title_id, authors.au_lname AS last_name, authors.au_fname AS first_name, titleauthor.au_id AS author_id
FROM publications.titleauthor
INNER JOIN publications.authors
ON publications.titleauthor.au_id = publications.authors.au_id;


SELECT *
FROM publications.authors_names;

CREATE TEMPORARY TABLE publications.author_title1
SELECT  pub_id,last_name, first_name, author_id, title, publications.titles.title_id AS id_title
FROM publications.titles
INNER JOIN publications.authors_names
ON publications.titles.title_id = publications.authors_names.title_id;


SELECT *
FROM publications.author_title1;

SELECT *
FROM publications.publishers;


/* pub_name AS "PUBLISHER", last_name AS "LAST NAME", first_name AS "FIRST NAME", author_id AS "AUTHOR ID", title AS "TITLE" */

CREATE TEMPORARY TABLE publications.author_complete
SELECT publishers.pub_id AS pub_num, pub_name, last_name, first_name, author_id, title
FROM publications.publishers
INNER JOIN publications.author_title1
ON publications.publishers.pub_id = publications.author_title1.pub_id;

SELECT *
FROM publications.author_complete;

/* How many titles per pusblishers*/

SELECT author_id AS "AUTHOR ID"
		,last_name AS "LAST NAME"
        ,first_name AS "FIRST NAME"
        ,pub_name AS "PUBLISHER"
        ,COUNT(1) AS 'TITLE COUNT'
FROM author_complete
GROUP BY author_id
		,last_name
        ,first_name
        ,pub_name
ORDER BY COUNT(1) DESC;



/* Calculate the best 3 seller titles per authors*/

SELECT authors.au_id AS "AUTHOR ID"
		,authors.au_lname AS "LAST NAME"
        ,authors.au_fname AS "FIRST NAME"
        ,SUM(titles.ytd_sales) AS "TOTAL"
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
		,authors.au_lname
        ,authors.au_fname
ORDER BY SUM(titles.ytd_sales) DESC
LIMIT 3;



/* CHALLENGE 4*/



SELECT authors.au_id AS "AUTHOR ID"
		,authors.au_lname AS "LAST NAME"
        ,authors.au_fname AS "FIRST NAME"
        ,SUM(IFNULL(titles.ytd_sales,0)) AS "TOTAL"
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
		,authors.au_lname
        ,authors.au_fname;









