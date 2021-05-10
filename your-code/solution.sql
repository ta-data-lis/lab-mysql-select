CREATE DATABASE mysql_select;

/*Challenge 1*/

SELECT *
FROM mysql_select.authors;
/* on this table we have, id, last name, first name */ 
SELECT *
FROM mysql_select.titles;
/* on this table we have title id, title and pub id*/
SELECT *
FROM mysql_select.publishers;
 /* on this table we have pub name  */
 SELECT *
FROM mysql_select.titleauthor;
 /*on this we have title id */
  
SELECT authors.au_id AS 'AUTHOR ID' , authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME',
titles.title AS 'TITLE', publishers.pub_name AS 'PUBLISHER'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id;

/*Challenge 2*/

SELECT authors.au_id AS 'AUTHOR ID' , authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME',
titles.title AS 'TITLE', publishers.pub_name AS 'PUBLISHER', COUNT(titles.title) AS 'TITLE COUNT'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_id, authors.au_id;

/*Challenge 3*/

SELECT authors.au_id AS 'AUTHOR ID' , authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME',
titles.title AS 'TITLE', publishers.pub_name AS 'PUBLISHER', sum(titles.ytd_sales) AS 'TOTAL'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3; 
 
 
 /*Challenge 4*/
 
SELECT authors.au_id AS 'AUTHOR ID' , authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME',
titles.title AS 'TITLE', publishers.pub_name AS 'PUBLISHER', sum(titles.ytd_sales) AS 'TOTAL'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 23; 
 