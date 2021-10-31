/* CHALLENGE 1 : */

	/* WE WILL NEED TABLES AUTHORS,  PUBLISHERS, TITLE AUTHOR AND TITLES*/

SELECT publications.authors.au_id , publications.authors.au_lname , publications.authors.au_fname, publications.titleauthor.title_id
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id;

/* NOW WE WILL INNER JOIN WITH TABLE TITLES: */

SELECT publications.author_and_title.au_id , publications.author_and_title.au_lname , publications.author_and_title.au_fname, publications.author_and_title.title_id, publications.titles.title, publications.titles.pub_id
FROM (SELECT publications.authors.au_id , publications.authors.au_lname , publications.authors.au_fname, publications.titleauthor.title_id
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id) author_and_title
INNER JOIN publications.titles
ON author_and_title.title_id =  publications.titles.title_id;

/* AND TO FINISH WE WILL INNER JOIN WITH THE PUBLISHERS TABLE: */

SELECT last_table_match.au_id , last_table_match.au_fname, last_table_match.au_lname , last_table_match.title , last_table_match.pub_id , publishers.pub_name
FROM (SELECT publications.author_and_title.au_id , publications.author_and_title.au_lname , publications.author_and_title.au_fname, publications.author_and_title.title_id, publications.titles.title, publications.titles.pub_id
FROM (SELECT publications.authors.au_id , publications.authors.au_lname , publications.authors.au_fname, publications.titleauthor.title_id
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id) author_and_title
INNER JOIN publications.titles
ON author_and_title.title_id =  publications.titles.title_id)  last_table_match
INNER JOIN publications.publishers
ON publications.last_table_match.pub_id = publications.publishers.pub_id;


/*CHALLENGE 2: */

SELECT au_id , au_fname , au_lname , pub_name, COUNT(pub_name)
FROM (SELECT publications.author_and_title.au_id , publications.author_and_title.au_lname , publications.author_and_title.au_fname, publications.author_and_title.title_id, publications.titles.title, publications.titles.pub_id
FROM (SELECT publications.authors.au_id , publications.authors.au_lname , publications.authors.au_fname, publications.titleauthor.title_id
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id) author_and_title
INNER JOIN publications.titles
ON author_and_title.title_id =  publications.titles.title_id)  last_table_match
INNER JOIN publications.publishers
ON publications.last_table_match.pub_id = publications.publishers.pub_id
GROUP BY au_id , au_fname , au_lname 
ORDER BY COUNT(pub_name) ;


/* CHALLENGE 3 : */

SELECT *
FROM (SELECT publications.author_and_title.au_id , publications.author_and_title.au_lname , publications.author_and_title.au_fname, publications.author_and_title.title_id, publications.titles.title, publications.titles.ytd_sales
FROM (SELECT publications.authors.au_id , publications.authors.au_lname , publications.authors.au_fname, publications.titleauthor.title_id
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id) author_and_title
INNER JOIN publications.titles
ON author_and_title.title_id =  publications.titles.title_id)  last_table_match
GROUP BY last_table_match.au_id
ORDER BY ytd_sales DESC ;


/* CHALLENGE 4 : */

UPDATE publications.titles SET publications.titles.ytd_sales =0 WHERE publications.titles.ytd_sales is null;

SELECT last_table_match.au_id, last_table_match.au_lname , last_table_match.au_fname, last_table_match.title, last_table_match.ytd_sales, SUM(ytd_sales)
FROM (SELECT publications.author_and_title.au_id , publications.author_and_title.au_lname , publications.author_and_title.au_fname, publications.author_and_title.title_id, publications.titles.title, publications.titles.ytd_sales
FROM (SELECT publications.authors.au_id , publications.authors.au_lname , publications.authors.au_fname, publications.titleauthor.title_id
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id) author_and_title
INNER JOIN publications.titles
ON author_and_title.title_id =  publications.titles.title_id)  last_table_match
GROUP BY last_table_match.au_id
ORDER BY ytd_sales DESC ;