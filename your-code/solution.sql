-- Let's check the databases available
SHOW DATABASES;

-- Let's select the database "publications"
USE publications;

/* Challenge 1 - Who Have Published What At Where? */
SELECT B.au_id AS `AUTHOR ID`, B.au_lname AS `LAST NAME`, B.au_fname AS `FIRST NAME`, B.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM
(SELECT A.au_id, A.au_lname, A.au_fname, titles.title, titles.pub_id
FROM 
(SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id) AS A
INNER JOIN titles
ON A.title_id = titles.title_id) AS B
INNER JOIN publishers
ON B.pub_id = publishers.pub_id
ORDER BY B.au_id ASC, B.title DESC;

-- Let's check the number of rows in the query above
SELECT COUNT(*)
FROM
(SELECT B.au_id, B.au_lname, B.au_fname, B.title, publishers.pub_name
FROM
(SELECT A.au_id, A.au_lname, A.au_fname, titles.title, titles.pub_id
FROM 
(SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id) AS A
INNER JOIN titles
ON A.title_id = titles.title_id) AS B
INNER JOIN publishers
ON B.pub_id = publishers.pub_id
ORDER BY B.au_id ASC, B.title DESC) AS C;

-- Let's check the number of rows in table `titleauthor`
SELECT COUNT(*)
FROM titleauthor;


/* Challenge 2 - Who Have Published How Many At Where? */
SELECT B.au_id AS `AUTHOR ID`, B.au_lname AS `LAST NAME`, B.au_fname AS `FIRST NAME`, publishers.pub_name AS PUBLISHER, COUNT(B.title) AS `TITLE COUNT`
FROM
(SELECT A.au_id, A.au_lname, A.au_fname, titles.title, titles.pub_id
FROM 
(SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id) AS A
INNER JOIN titles
ON A.title_id = titles.title_id) AS B
INNER JOIN publishers
ON B.pub_id = publishers.pub_id
GROUP BY `AUTHOR ID`, PUBLISHER
ORDER BY `AUTHOR ID` DESC, PUBLISHER DESC;

-- Let's check the number of cases summed in the query above
SELECT SUM(`TITLE COUNT`)
FROM
(SELECT B.au_id AS `AUTHOR ID`, B.au_lname AS `LAST NAME`, B.au_fname AS `FIRST NAME`, publishers.pub_name AS PUBLISHER, COUNT(B.title) AS `TITLE COUNT`
FROM
(SELECT A.au_id, A.au_lname, A.au_fname, titles.title, titles.pub_id
FROM 
(SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id) AS A
INNER JOIN titles
ON A.title_id = titles.title_id) AS B
INNER JOIN publishers
ON B.pub_id = publishers.pub_id
GROUP BY `AUTHOR ID`, PUBLISHER
ORDER BY `AUTHOR ID` DESC, PUBLISHER DESC) AS C;

-- Let's check the number of rows in table `titleauthor`
SELECT COUNT(*)
FROM titleauthor;


/* Challenge 3 - Best Selling Authors */
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, A.TOTAL AS TOTAL
FROM
(SELECT titleauthor.au_id, titleauthor.title_id, SUM(sales.qty) AS TOTAL
FROM titleauthor
INNER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY titleauthor.au_id) AS A
LEFT JOIN authors
ON authors.au_id = A.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking */
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, IFNULL(A.TOTAL,0) AS TOTAL
FROM
(SELECT titleauthor.au_id, titleauthor.title_id, SUM(sales.qty) AS TOTAL
FROM titleauthor
INNER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY titleauthor.au_id) AS A
RIGHT JOIN authors
ON authors.au_id = A.au_id
ORDER BY TOTAL DESC;

-- Let's check the number of rows in the query above
SELECT COUNT(*)
FROM
(SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, IFNULL(A.TOTAL,0) AS TOTAL
FROM
(SELECT titleauthor.au_id, titleauthor.title_id, SUM(sales.qty) AS TOTAL
FROM titleauthor
INNER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY titleauthor.au_id) AS A
RIGHT JOIN authors
ON authors.au_id = A.au_id
ORDER BY TOTAL DESC) AS B;