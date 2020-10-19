SELECT publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, publications.titles.title, publications.publishers.pub_name
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id = publications.titles.pub_id;
/*Challenge 1 Completed*/

SELECT publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, publications.titles.title, publications.publishers.pub_name, COUNT(publications.authors.au_id)
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id = publications.titles.pub_id
GROUP BY publications.authors.au_id
ORDER BY publications.authors.au_id DESC;
/*Challenge 2 Completed*/

CREATE TABLE publications.new_table AS (SELECT publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, publications.publishers.pub_name, publications.titles.title_id
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id = publications.titles.pub_id);
/*Created a new_table where we joined 3 different tables*/



SELECT publications.new_table.au_id, publications.new_table.au_lname, publications.new_table.au_fname, publications.sales.qty
FROM publications.new_table
INNER JOIN publications.sales
ON publications.sales.title_id = publications.new_table.title_id
GROUP BY publications.new_table.au_id
ORDER BY publications.sales.qty DESC
LIMIT 3;
/*Challenge 3 Completed*/
/*The top3 authors who have sold the highest number of titles can be obtained by running the above query*/

SELECT publications.new_table.au_id, publications.new_table.au_lname, publications.new_table.au_fname, publications.sales.qty
FROM publications.new_table
INNER JOIN publications.sales
ON publications.sales.title_id = publications.new_table.title_id
GROUP BY publications.new_table.au_id
ORDER BY publications.sales.qty DESC
LIMIT 23;
/*Challenge 4 Completed*/
/*The top23 authors who have sold the highest number of titles can be obtained by running the above query*/

