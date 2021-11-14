/* CHALLENGE 1*/

select authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

/* CHALLENGE 2*/
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname	AS 'FIRST NAME', publishers.pub_name AS PUBLISHER, COUNT(*)
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id;

/* CHALLENGE 3*/
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', COUNT(titleauthor.title_id) AS TOTAL
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/* CHALLENGE 4*/
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', COUNT(titleauthor.title_id) AS TOTAL
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 23;
