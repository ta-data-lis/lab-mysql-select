SELECT * 
FROM labs.authors;

SELECT *
FROM labs.titles;

SELECT * 
FROM labs.publishers;



SELECT au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME'
FROM labs.authors;

SELECT title AS 'TITLE'
FROM labs.titles;

SELECT pub_name AS 'PUBLISHER'
FROM labs.publishers;

/* CHALLENGE 1 */
SELECT au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', title AS 'TITLE', pub_name AS 'PUBLISHER'
FROM labs.authors, labs.titles, labs.publishers;

/* CHALLENGE 2 */
SELECT au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', pub_name AS 'PUBLISHER', COUNT(title)
FROM labs.authors, labs.titles, labs.publishers
GROUP BY pub_name, au_id
ORDER BY COUNT(title);

/* CHALLENGE 3 */
SELECT labs.authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', Count(title)
FROM labs.sales
INNER JOIN labs.titles
ON labs.sales.title_id = labs.titles.title_id
INNER JOIN labs.titleauthor
ON labs.titles.title_id = labs.titleauthor.title_id
INNER JOIN labs.authors
ON labs.titles.title_id = labs.titleauthor.title_id
GROUP BY labs.authors.au_id, title
ORDER BY count(title) DESC
LIMIT 3;

/* CHALLENGE 4 */
SELECT labs.authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', Count(title)
FROM labs.sales
INNER JOIN labs.titles
ON labs.sales.title_id = labs.titles.title_id
INNER JOIN labs.titleauthor
ON labs.titles.title_id = labs.titleauthor.title_id
INNER JOIN labs.authors
ON labs.titles.title_id = labs.titleauthor.title_id
GROUP BY labs.authors.au_id, title
ORDER BY count(title) DESC;
