/*## Challenge 1 - Who Have Published What At Where?

In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out 
what titles each authorhas published at which publishers. Your output should have at least the 
following columns:

/* `AUTHOR ID` - the ID of the author
/* `LAST NAME` - author last name
/* `FIRST NAME` - author first name
/* `TITLE` - name of the published title
/* `PUBLISHER` - name of the publisher where the title was published8*/


SELECT author_ID, au_fname AS first_name, au_lname AS last_name, title, pub_name AS publisher
FROM publication.publishers
INNER JOIN (SELECT au_fname, au_lname, title, pub_id, author_ID
FROM publication.titles
INNER JOIN (SELECT au_fname, au_lname, title_id, titleauthor.au_id AS author_ID
FROM publication.authors
INNER JOIN publication.titleauthor
ON publication.authors.au_id = publication.titleauthor.au_id) AS join_table
ON publication.titles.title_id = publication.join_table.title_id) AS join_table_2
ON publication.publishers.pub_id = join_table_2.pub_id;


/*Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles 
each author has published at each publisher. Your output should look something like below:*/

SELECT author_ID, au_fname AS first_name, au_lname AS last_name, pub_name AS publisher, COUNT(title) AS title_count
FROM publication.publishers
INNER JOIN (SELECT au_fname, au_lname, title, pub_id, author_ID
FROM publication.titles
INNER JOIN (SELECT au_fname, au_lname, title_id, authors.au_id AS author_ID
FROM publication.authors
INNER JOIN publication.titleauthor
ON publication.authors.au_id = publication.titleauthor.au_id) AS join_table
ON publication.titles.title_id = publication.join_table.title_id) AS join_table_2
ON publication.publishers.pub_id = join_table_2.pub_id
GROUP BY author_ID, first_name, last_name, publisher;

/*## Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
Requirements:
* Your output should have the following columns:
	* `AUTHOR ID` - the ID of the author
	* `LAST NAME` - author last name
	* `FIRST NAME` - author first name
	* `TOTAL` - total number of titles sold from this author
* Your output should be ordered based on `TOTAL` from high to low.
* Only output the top 3 best selling authors. */

CREATE TEMPORARY TABLE publication.lab_sql
SELECT author_ID, au_fname AS first_name, join_table_2.title_id AS title_id, au_lname AS last_name, pub_name AS publisher, COUNT(title) AS title_count
FROM publication.publishers
INNER JOIN (SELECT au_fname, au_lname, title, pub_id, author_ID, join_table.title_id
FROM publication.titles
INNER JOIN (SELECT au_fname, au_lname, title_id, authors.au_id AS author_ID
FROM publication.authors
INNER JOIN publication.titleauthor
ON publication.authors.au_id = publication.titleauthor.au_id) AS join_table
ON publication.titles.title_id = publication.join_table.title_id) AS join_table_2
ON publication.publishers.pub_id = join_table_2.pub_id
GROUP BY author_ID, first_name, last_name, publisher, join_table_2.title_id;

SELECT author_ID , last_name, first_name, sum(qty) AS total
FROM publication.lab_sql
INNER JOIN publication.sales
ON publication.lab_sql.title_id = publication.sales.title_id
GROUP BY author_ID, last_name, first_name
ORDER BY total DESC
LIMIT 3;

/*## Challenge 4 - Best Selling Authors Ranking

Now modify your solution in Challenge 3 so that the output will display all 23 authors 
instead of the top 3. Note that the authors who have sold 0 titles should also appear 
in your output (ideally display `0` instead of `NULL` as the `TOTAL`). 
Also order your results based on `TOTAL` from high to low.*/


SELECT authors.au_id AS author_ID, authors.au_lname AS last_name, authors.au_fname AS first_name, IFNULL(SUM(sales.qty),0) AS 'TOTAL'
FROM publication.authors
LEFT JOIN publication.titleauthor
	ON publication.authors.au_id = publication.titleauthor.au_id
LEFT JOIN publication.sales
	ON publication.titleauthor.title_id = publication.sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;
