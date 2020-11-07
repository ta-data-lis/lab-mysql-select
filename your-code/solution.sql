USE publications;

-- CHALLENGE 1

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, 
titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM publications.authors authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
ORDER BY authors.au_id ASC;

-- CHALLENGE 2

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, 
publishers.pub_name AS PUBLISHER, COUNT(DISTINCT(titles.title)) AS `TITLE COUNT`
FROM publications.authors authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY authors.au_id DESC;

-- CHALLENGE 3

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, 
SUM(qty) AS TOTAL
FROM publications.authors authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(qty) DESC
LIMIT 3;

-- CHALLENGE 4

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, 
COALESCE ((SUM(qty)),0) AS TOTAL
FROM publications.authors authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(qty) DESC;