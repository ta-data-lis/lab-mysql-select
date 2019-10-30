USE publications;
SELECT * FROM titleauthor;

## Challenge 1 - Who Have Published What At Where?
SELECT titleauthor.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM titleauthor
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id;


## Challenge 2 - Who Have Published How Many At Where?
SELECT titleauthor.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name AS PUBLISHER, count(publishers.pub_name) AS 'TITLE COUNT'
FROM titleauthor
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY count(publishers.pub_name) DESC;

## Checking sum of entries in 'titleauthor' table
SELECT COUNT(*)
FROM titleauthor;


## Checking sum of 'TITLE COUNT'
SELECT sum(TITLE_COUNT)
FROM (SELECT titleauthor.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name AS PUBLISHER, count(publishers.pub_name) AS 'TITLE_COUNT'
FROM titleauthor
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY count(publishers.pub_name) DESC
) as Table2;


## Challenge 3 - Best Selling Authors
SELECT * FROM sales;

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, sum(qty) AS TOTAL_SALES
FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 3;


## Challenge 4 - Best Selling Authors Ranking
SELECT COUNT(*) FROM authors;
SELECT COUNT(*) FROM titleauthor;
SELECT * FROM titleauthor;


SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, COALESCE (sum(qty), 0) AS TOTAL_SALES
FROM titleauthor
RIGHT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC;





