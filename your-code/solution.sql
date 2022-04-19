/* LAB 2 - MYSQL SELECT */

USE publications;

/* Challenge 1: In this challenge you will write a MySQL SELECT query that joins 
various tables to figure out what titles each author has published at which publishers.*/

SELECT authors.au_id AS author_id, authors.au_lname AS last_name, authors.au_fname AS first_name, 
titles.title, publishers.pub_name AS publisher
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
on titles.pub_id = publishers.pub_id
ORDER BY author_id;


/* Challenge 2: Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, 
query how many titles each author has published at each publisher..*/

SELECT authors.au_id AS author_id, authors.au_lname AS last_name, authors.au_fname AS first_name, 
publishers.pub_name AS publisher, COUNT(titles.title) AS title_count
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY author_id, last_name, first_name, publisher
ORDER BY author_id DESC;


/* Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles?
Write a query to find out. */

SELECT authors.au_id AS author_id, authors.au_lname AS last_name, authors.au_fname AS first_name,
SUM(sales.qty) AS total
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY author_id, last_name, first_name
ORDER BY total DESC
LIMIT 3;


/* Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display 
all 23 authors instead of the top 3.*/

/* Note: changing from inner join to left join so it displays 
all authors even if there are no sales (null).
Also, using coalesce to replace null values by 0*/

SELECT authors.au_id AS author_id, CONCAT(authors.au_lname, ',', authors.au_fname) AS author_name,
COALESCE(SUM(sales.qty),0) AS total
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY author_id, author_name
ORDER BY total DESC;