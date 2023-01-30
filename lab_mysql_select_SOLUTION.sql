#Questão 1
SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER"
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON titles.pub_id = publishers.pub_id;

#Questão 2
SELECT authors.au_id AS "AUTHOR ID", authors.au_fname AS "FIRST NAME", authors.au_lname AS "LAST NAME", publishers.pub_name AS "PUBLISHER", COUNT(titles.title) AS "TITLE COUNT"
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id = publications.titles.pub_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname, publishers.pub_name
ORDER BY titleauthor.au_id DESC;

#Questão 3
SELECT authors.au_id AS "AUTHOR ID", authors.au_fname AS "FIRST NAME", authors.au_lname AS "LAST NAME", SUM(sales.qty) AS "TOTAL"
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.sales
ON publications.sales.title_id = publications.titles.title_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY TOTAL DESC
LIMIT 3;

#Questão 4
SELECT authors.au_id AS "AUTHOR ID", authors.au_fname AS "FIRST NAME", authors.au_lname AS "LAST NAME", SUM(sales.qty) AS TOTAL
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.sales
ON publications.sales.title_id = publications.titles.title_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY total DESC;