/* 1 - Who Have Published What At Where? */
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title AS 'TITLE',
		publishers.pub_name AS 'PUBLISHER'
FROM publications.authors
INNER JOIN publications.titleauthor
	ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
	ON publications.titleauthor.title_id = publications.titles.title_id
INNER JOIN publications.publishers
	ON publications.titles.pub_id = publications.publishers.pub_id;

/* 2 - Who Have Published How Many At Where? */
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', COUNT(titles.title) AS 'TITLE COUNT',
		publishers.pub_name AS 'PUBLISHER'
FROM publications.authors
INNER JOIN publications.titleauthor
	ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
	ON publications.titleauthor.title_id = publications.titles.title_id
INNER JOIN publications.publishers
	ON publications.titles.pub_id = publications.publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;

/* 3 - Best Selling Authors */
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', SUM(sales.qty) AS 'TOTAL'
FROM publications.authors
INNER JOIN publications.titleauthor
	ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.sales
	ON publications.titleauthor.title_id = publications.sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/* 4 - Best Selling Authors Ranking */
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', IFNULL(SUM(sales.qty),0) AS 'TOTAL'
FROM publications.authors
LEFT JOIN publications.titleauthor
	ON publications.authors.au_id = publications.titleauthor.au_id
LEFT JOIN publications.sales
	ON publications.titleauthor.title_id = publications.sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;