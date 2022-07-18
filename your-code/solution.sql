/* 
## Challenge 1 - Who Have Published What At Where?

In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out 
what titles each author has published at which publishers. 
Your output should have at least the following columns:
* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
* `TITLE` - name of the published title
* `PUBLISHER` - name of the publisher where the title was published */

SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`,
		titles.title AS `TITLE` , publishers.pub_name AS `PUBLISHER`
FROM   labw2publications.authors
INNER JOIN labw2publications.titleauthor
ON  labw2publications.authors.au_id=labw2publications.titleauthor.au_id
INNER JOIN labw2publications.titles
ON labw2publications.titleauthor.title_id=labw2publications.titles.title_id
INNER JOIN labw2publications.publishers
ON labw2publications.publishers.pub_id=labw2publications.titles.pub_id;

/*
## Challenge 2 - Who Have Published How Many At Where?

Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. */

SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`,
		 publishers.pub_name AS `PUBLISHER`, count(titles.title) AS `TITLE COUNT`
FROM   labw2publications.authors
INNER JOIN labw2publications.titleauthor
ON  labw2publications.authors.au_id=labw2publications.titleauthor.au_id
INNER JOIN labw2publications.titles
ON labw2publications.titleauthor.title_id=labw2publications.titles.title_id
INNER JOIN labw2publications.publishers
ON labw2publications.publishers.pub_id=labw2publications.titles.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname,
		 publishers.pub_name;
         
/*
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
Requirements:
* Your output should have the following columns:
	* `AUTHOR ID` - the ID of the author
	* `LAST NAME` - author last name
	* `FIRST NAME` - author first name
	* `TOTAL` - total number of titles sold from this author
* Your output should be ordered based on `TOTAL` from high to low.
* Only output the top 3 best selling authors. */
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`,
		 sum(titles.ytd_sales) AS `TOTAL`
FROM   labw2publications.authors
INNER JOIN labw2publications.titleauthor
ON  labw2publications.authors.au_id=labw2publications.titleauthor.au_id
INNER JOIN labw2publications.titles
ON labw2publications.titleauthor.title_id=labw2publications.titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY sum(titles.ytd_sales) DESC
LIMIT 3;

/*
## Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). 
Also order your results based on `TOTAL` from high to low. */

SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`,
		 IFNULL(sum(titles.ytd_sales),0) AS `TOTAL`
FROM   labw2publications.authors
LEFT JOIN labw2publications.titleauthor
ON  labw2publications.authors.au_id=labw2publications.titleauthor.au_id
LEFT JOIN labw2publications.titles
ON labw2publications.titleauthor.title_id=labw2publications.titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY sum(titles.ytd_sales) DESC
LIMIT 23;






