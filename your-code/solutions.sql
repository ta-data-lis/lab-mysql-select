/* CHALLENGE 1 */

SELECT au_id as AUTHOR_ID, au_lname as Last_Name, au_fname as First_Name, title AS TITLE, pub_name as PUBLISHER 
FROM Publications.titles
INNER JOIN (SELECT Publications.authors.au_id, au_lname, au_fname, title_id
FROM Publications.authors
INNER JOIN Publications.titleauthor
ON Publications.authors.au_id = Publications.titleauthor.au_id) as select_title_id
ON Publications.titles.title_id = Publications.select_title_id.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id = Publications.titles.pub_id;

/* CHALLENGE 2 */

SELECT au_id as AUTHOR_ID, au_lname as Last_Name, au_fname as First_Name, COUNT(title) AS TITLE_COUNT, pub_name as PUBLISHER, count(pub_name) 
FROM Publications.titles
INNER JOIN (SELECT Publications.authors.au_id, au_lname, au_fname, title_id
FROM Publications.authors
INNER JOIN Publications.titleauthor
ON Publications.authors.au_id = Publications.titleauthor.au_id) as select_title_id
ON Publications.titles.title_id = Publications.select_title_id.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id = Publications.titles.pub_id
GROUP BY Publications.authors.AUTHOR_ID, PUBLISHER, Publications.authors.Last_Name, Publications.authors.First_Name;

/* CHALLENGE 3 */

select *
FROM Publications.authors;

select *
FROM Publications.sales;

select *
FROM Publications.titleauthor;

select *
FROM Publications.sales
INNER JOIN Publications.titles
ON Publications.sales.title_id = Publications.titles.title_id;

select publications.authors.au_id, au_lname, au_fname, count(title)
FROM Publications.sales
INNER JOIN Publications.titles
ON Publications.sales.title_id = Publications.titles.title_id
INNER JOIN Publications.titleauthor
ON publications.titles.title_id = Publications.titleauthor.title_id
INNER JOIN Publications.authors
ON Publications.titleauthor.au_id = Publications.authors.au_id
GROUP BY au_id, title
ORDER BY count(title) DESC
LIMIT 3;


/* CHALLENGE 4 */

select publications.authors.au_id, au_lname, au_fname, count(title)
FROM Publications.sales
INNER JOIN Publications.titles
ON Publications.sales.title_id = Publications.titles.title_id
INNER JOIN Publications.titleauthor
ON publications.titles.title_id = Publications.titleauthor.title_id
INNER JOIN Publications.authors
ON Publications.titleauthor.au_id = Publications.authors.au_id
GROUP BY au_id, title
ORDER BY count(title) DESC

