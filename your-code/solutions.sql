/*Challenge 1 - Who Have Published What At Where?*/

SELECT publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, publications.titles.title, publications.publishers.pub_name
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id = publications.titles.pub_id;

/*Challenge 2 - Who Have Published How Many At Where?*/

SELECT publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, publications.publishers.pub_name, COUNT(publications.authors.au_id) AS title_count
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id = publications.titles.pub_id
GROUP BY publications.authors.au_id
ORDER BY publications.authors.au_id DESC;

/*Challenge 3 - Best Selling Authors*/

CREATE TABLE publications.total
AS
(SELECT publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, publications.titles.title_id
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id);

SELECT publications.total.au_id, publications.total.au_lname, publications.total.au_fname, publications.sales.qty
FROM publications.total
INNER JOIN publications.sales
ON publications.total.title_id = publications.sales.title_id
GROUP BY publications.total.au_id
ORDER BY publications.sales.qty DESC
LIMIT 3;

/*Challenge 4 - Best Selling Authors Ranking*/

SELECT publications.total.au_id, publications.total.au_lname, publications.total.au_fname, publications.sales.qty
FROM publications.total
INNER JOIN publications.sales
ON publications.total.title_id = publications.sales.title_id
GROUP BY publications.total.au_id
ORDER BY publications.sales.qty DESC
LIMIT 23;
