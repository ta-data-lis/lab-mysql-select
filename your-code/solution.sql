SELECT * FROM publications.publishers;

/*CHALLENGE 1*/

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM publications.titleauthor
INNER JOIN publications.titles ON titles.title_id = titleauthor.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id
INNER JOIN publications.authors ON authors.au_id = titleauthor.au_id;

/*CHALLENGE 2*/

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, count(titles.title) AS TITLE_COUNT, publishers.pub_name AS PUBLISHER
FROM publications.titleauthor
INNER JOIN publications.titles ON titles.title_id = titleauthor.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id
INNER JOIN publications.authors ON authors.au_id = titleauthor.au_id
GROUP BY AUTHOR_ID, PUBLISHER
ORDER BY TITLE_COUNT DESC;

/*CHALLENGE 3*/

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, sales.qty AS TOTAL
FROM publications.authors
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/*CHALLENGE 4*/

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, coalesce(sales.qty, 0) AS TOTAL
FROM publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;