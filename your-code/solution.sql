-- LAB - MySQL Select
-- Ironhack Data Analytics Bootcamp - Week 2
-- Andrés Sánchez Gómez

-- I named the database as 'publications'.


-- CHALLENGE 1: WHO HAVE PUBLISHED WHAT AT WHERE? --

-- Creating a Temporary table that joins 'titles' and 'authors' using 'titleautors'
CREATE TEMPORARY TABLE publications.titleauthorjoined
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, titles.title_id, titles.pub_id
FROM titleauthor
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN authors
ON titleauthor.au_id = authors.au_id;

-- Joining titleauthorjoined with 'publishers' and returning the output
SELECT au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, title AS `TITLE`, pub_name AS `PUBLISHER`
FROM titleauthorjoined
INNER JOIN publishers
ON titleauthorjoined.pub_id = publishers.pub_id
ORDER BY au_id;


-- CHALLENGE 2: WHO HAVE PUBLISHED HOW MANY AT WHERE? --

SELECT au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, pub_name AS `PUBLISHER`, COUNT(title) AS `TITLE COUNT`
FROM titleauthorjoined
INNER JOIN publishers
ON titleauthorjoined.pub_id = publishers.pub_id
GROUP BY au_id, au_lname, au_fname, pub_name
ORDER BY au_id DESC;


-- CHALLENGE 3: BEST SELLING AUTHORS --

-- I will use the Temporary table I created earlier (titleauthorjoined) to connect it with the 'sales' table
SELECT au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, SUM(qty) AS `TOTAL`
FROM titleauthorjoined
INNER JOIN sales
ON titleauthorjoined.title_id = sales.title_id
GROUP BY au_id, au_lname, au_fname
ORDER BY TOTAL DESC
LIMIT 3;


-- CHALLENGE 4: Best Selling Authors Ranking


SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, IFNULL(SUM(qty),0) AS `TOTAL`
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, au_lname, au_fname
ORDER BY TOTAL DESC;





