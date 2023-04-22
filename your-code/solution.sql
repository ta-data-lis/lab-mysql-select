/* Challenge 1 - Who Have Published What At Where? */

SELECT authors.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", title AS "TITLE COUNT", pub_name AS "PUBLISHER"
FROM publications.authors
INNER JOIN publications.titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN publications.titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publications.publishers
ON publishers.pub_id = titles.pub_id;

/* Challenge 2 - Who Have Published How Many At Where? */

SELECT authors.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", pub_name AS "PUBLISHER", COUNT(title) AS "TITLE COUNT"
FROM publications.authors
INNER JOIN publications.titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN publications.titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publications.publishers
ON publishers.pub_id = titles.pub_id
GROUP BY titleauthor.au_id, pub_name;

/* Challenge 3 - Best Selling Authors */

SELECT authors.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", SUM(qty) AS "TOTAL"
FROM publications.authors
INNER JOIN publications.titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN publications.titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publications.sales
ON sales.title_id = titles.title_id
GROUP BY titleauthor.au_id
ORDER BY SUM(qty) DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking */

SELECT authors.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", IFNULL(SUM(qty),0) AS "TOTAL"
FROM publications.authors
LEFT JOIN publications.titleauthor
ON titleauthor.au_id = authors.au_id
LEFT JOIN publications.titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publications.sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(qty) DESC;