# Challenge 1 - Who Have Published What At Where?

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER"
FROM publications.titleauthor
INNER JOIN publications.authors ON titleauthor.au_id = authors.au_id 
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id;

# Challenge 2 - Who Have Published How Many At Where?
SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", publishers.pub_name AS "PUBLISHER", COUNT(titles.title) AS "TITLE COUNT"
FROM publications.titleauthor
INNER JOIN publications.authors ON titleauthor.au_id = authors.au_id 
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY "TITLE COUNT" DESC;