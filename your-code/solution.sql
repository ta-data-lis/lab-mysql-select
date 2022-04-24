/*Challenge 1 - Who Have Published What At Where?

In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out what titles each author has published 
at which publishers. Your output should have at least the following columns:

* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
* `TITLE` - name of the published title
* `PUBLISHER` - name of the publisher where the title was published

If your query is correct, the total rows in your output should be the same as the total number of records in Table `titleauthor`.*/

CREATE VIEW publications.challenge1 AS
SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, title AS `TITLE`, pub_name AS `PUBLISHER`
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON titles.pub_id = publishers.pub_id;



SELECT *
FROM publications.challenge1;

/* Challenge 2 Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 

To check if your output is correct, sum up the `TITLE COUNT` column. 
The sum number should be the same as the total number of records in Table `titleauthor`.*/

SELECT COUNT(`TITLE`), `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `PUBLISHER`
FROM publications.challenge1
GROUP BY `AUTHOR ID`, `PUBLISHER`;

/*Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

* Your output should have the following columns:
	* `AUTHOR ID` - the ID of the author
	* `LAST NAME` - author last name
	* `FIRST NAME` - author first name
	* `TOTAL` - total number of titles sold from this author
* Your output should be ordered based on `TOTAL` from high to low.
* Only output the top 3 best selling authors.*/

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, sales.qty AS `TOTAL`
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.sales
ON titles.title_id = sales.title_id
ORDER BY sales.qty DESC
LIMIT 3;

/*Challenge 4 - Best Selling Authors Ranking

Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). 
Also order your results based on `TOTAL` from high to low.*/

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, sales.qty AS `TOTAL`
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.sales
ON titles.title_id = sales.title_id
ORDER BY sales.qty DESC;



