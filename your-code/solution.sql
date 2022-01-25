/* Challenge 1 - Who Have Published What At Where? */

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME',
pub_name AS 'PUBLISHER', title as 'TITLE'
FROM pubs.publishers
INNER JOIN pubs.titles
ON publishers.pub_id = titles.pub_id
INNER JOIN pubs.titleauthor
ON pubs.titles.title_id = titleauthor.title_id
INNER JOIN pubs.authors
ON titleauthor.au_id = authors.au_id;


/* Challenge 2 - Who Have Published How Many At Where? */

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME',
pub_name AS 'PUBLISHER', COUNT(title) AS 'TOTAL BOOKS'
FROM pubs.publishers
INNER JOIN pubs.titles
ON publishers.pub_id = titles.pub_id
INNER JOIN pubs.titleauthor
ON pubs.titles.title_id = titleauthor.title_id
INNER JOIN pubs.authors
ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, pub_name;


/* Challenge 3 - Best Selling Authors  */

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME',
SUM(qty) AS 'TOTAL'
FROM pubs.sales
INNER JOIN pubs.titles
ON sales.title_id = titles.title_id
INNER JOIN pubs.titleauthor
ON pubs.titles.title_id = titleauthor.title_id
INNER JOIN pubs.authors
ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC
LIMIT 3;


/* Challenge 4 - Best Selling Authors Ranking */

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME',
IFNULL(SUM(qty), 0)  AS 'TOTAL'
FROM pubs.authors
LEFT JOIN pubs.titleauthor
ON pubs.authors.au_id = titleauthor.au_id
LEFT JOIN pubs.titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN pubs.sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC;




