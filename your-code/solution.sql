/** ## Challenge 1 - Who Have Published What At Where? **/

SELECT pubs.titleauthor.au_id AS AUTHOR_ID, pubs.authors.au_lname AS LAST_NAME,pubs.authors.au_fname AS FIRST_NAME, pubs.titles.title AS TITLE, pubs.publishers.pub_name AS PUBLISHER
FROM pubs.titleauthor
INNER JOIN pubs.titles
ON pubs.titleauthor.title_id = pubs.titles.title_id
INNER JOIN pubs.authors
ON pubs.titleauthor.au_id=pubs.authors.au_id
INNER JOIN pubs.publishers
ON pubs.titles.pub_id = pubs.publishers.pub_id;

/**## Challenge 2 - Who Have Published How Many At Where?*/
SELECT pubs.titleauthor.au_id AS AUTHOR_ID, pubs.authors.au_lname AS LAST_NAME,pubs.authors.au_fname AS FIRST_NAME, count(pubs.titles.title) AS NR_TITLES, pubs.publishers.pub_name AS PUBLISHER
FROM pubs.titleauthor
INNER JOIN pubs.titles
ON pubs.titleauthor.title_id = pubs.titles.title_id
INNER JOIN pubs.authors
ON pubs.titleauthor.au_id=pubs.authors.au_id
INNER JOIN pubs.publishers
ON pubs.titles.pub_id = pubs.publishers.pub_id
GROUP BY Author_ID, PUBLISHER;

/* ## Challenge 3 - Best Selling Authors */

SELECT pubs.titleauthor.au_id AS AUTHOR_ID, pubs.authors.au_lname AS LAST_NAME,pubs.authors.au_fname AS FIRST_NAME,
 pubs.sales.qty, sum(qty) AS TOTAL
FROM pubs.titleauthor
INNER JOIN pubs.titles
ON pubs.titleauthor.title_id = pubs.titles.title_id
INNER JOIN pubs.authors
ON pubs.titleauthor.au_id=pubs.authors.au_id
INNER JOIN pubs.publishers
ON pubs.titles.pub_id = pubs.publishers.pub_id
INNER JOIN pubs.sales
ON pubs.sales.title_id =pubs.titles.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;

/** ## Challenge 4 - Best Selling Authors Ranking */


SELECT DISTINCT au_id, au_lname, au_fname, SUM(qty) AS total
FROM pubs.sales
RIGHT JOIN (SELECT authors.au_id, au_lname, au_fname, title_id
FROM pubs.authors
LEFT JOIN pubs.titleauthor
ON authors.au_id = titleauthor.au_id) AS author_title
ON sales.title_id = author_title.title_id
GROUP BY au_id
ORDER BY total DESC;


CREATE TEMPORARY TABLE pubs.authors_rankins
SELECT DISTINCT au_id, au_lname, au_fname, SUM(qty) AS total
FROM pubs.sales
RIGHT JOIN (SELECT authors.au_id, au_lname, au_fname, title_id
FROM pubs.authors
LEFT JOIN pubs.titleauthor
ON authors.au_id = titleauthor.au_id) AS author_title
ON sales.title_id = author_title.title_id
GROUP BY au_id
ORDER BY total DESC;

SELECT au_id, au_lname, au_fname, COALESCE(total, 0 )
FROM pubs.authors_rankins;


