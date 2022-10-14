/* Challenge 1 - Who Have Published What At Where? */
SELECT pubs.authors.au_id AS 'AUTHOR ID', pubs.authors.au_lname AS 'LAST NAME', pubs.authors.au_fname AS 'FIRST NAME', 
pubs.titles.title AS 'TITLE', pubs.publishers.pub_name AS 'PUBLISHER'
FROM pubs.titles
INNER JOIN pubs.publishers
ON pubs.titles.pub_id = pubs.publishers.pub_id
INNER JOIN pubs.titleauthor
ON pubs.titles.title_id = pubs.titleauthor.title_id
INNER JOIN pubs.authors
ON pubs.titleauthor.au_id = pubs.authors.au_id;

/* Challenge 2 - Who Have Published How Many At Where? */
SELECT pubs.authors.au_id AS 'AUTHOR ID', pubs.authors.au_lname AS 'LAST NAME', pubs.authors.au_fname AS 'FIRST NAME',
pubs.titles.title AS 'TITLE', pubs.publishers.pub_name AS 'PUBLISHER', count(*) AS 'TITLE COUNT'
FROM pubs.titles
INNER JOIN pubs.publishers
ON pubs.titles.pub_id = pubs.publishers.pub_id
INNER JOIN pubs.titleauthor
ON pubs.titles.title_id = pubs.titleauthor.title_id
INNER JOIN pubs.authors
ON pubs.titleauthor.au_id = pubs.authors.au_id
GROUP BY pubs.authors.au_id;

/* Challenge 3 - Best Selling Authors */
SELECT pubs.authors.au_id AS `AUTHOR ID`, pubs.authors.au_lname AS `LAST NAME`, pubs.authors.au_fname AS `FIRST NAME`,
sum(pubs.sales.qty) AS 'TOTAL'
FROM pubs.authors
INNER JOIN pubs.titleauthor ON pubs.titleauthor.au_id = pubs.authors.au_id
INNER JOIN pubs.titles ON pubs.titles.title_id = pubs.titleauthor.title_id
INNER JOIN pubs.sales ON pubs.sales.title_id = pubs.titleauthor.title_id
GROUP BY pubs.authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking */
SELECT pubs.authors.au_id AS `AUTHOR ID`, pubs.authors.au_lname AS `LAST NAME`, pubs.authors.au_fname AS `FIRST NAME`,
IFNULL(sum(pubs.sales.qty), 0) AS 'TOTAL'
FROM pubs.authors
LEFT JOIN pubs.titleauthor ON pubs.titleauthor.au_id = pubs.authors.au_id
LEFT JOIN pubs.titles ON pubs.titles.title_id = pubs.titleauthor.title_id
LEFT JOIN pubs.sales ON pubs.sales.title_id = pubs.titleauthor.title_id
GROUP BY pubs.authors.au_id
ORDER BY TOTAL DESC;