/*Challenge 1 - Who Have Published What At Where?*/
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titleauthor.title_id = publications.titles.title_id
INNER JOIN publications.publishers
ON publications.titles.pub_id = publications.publishers.pub_id;

/*Challenge 2 - Who Have Published How Many At Where?*/
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, publishers.pub_name AS PUBLISHER, COUNT(*) AS TITLE_COUNT
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titleauthor.title_id = publications.titles.title_id
INNER JOIN publications.publishers
ON publications.titles.pub_id = publications.publishers.pub_id
GROUP BY publishers.pub_id, authors.au_id;

/*Challenge 3 - Best Selling Authors*/
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, SUM(sales.qty) AS TOTAL
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.sales
ON publications.titleauthor.title_id = publications.sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/*Challenge 4 - Best Selling Authors Ranking*/
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, SUM(sales.qty) AS TOTAL
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.sales
ON publications.titleauthor.title_id = publications.sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;
