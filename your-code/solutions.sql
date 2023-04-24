
/* Challenge 1 - Who Have Published What At Where?

In this challenge you will write a MySQL `SELECT` query that joins various tables 
to figure out what titles each author has published at which publishers. 
Your output should have at least the following columns:

* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
* `TITLE` - name of the published title
* `PUBLISHER` - name of the publisher where the title was published */

SELECT *
FROM publications.authors;
SELECT * 
FROM publications.publishers;
SELECT * 
FROM publications.titleauthor;
SELECT * 
FROM publications.titles;

SELECT 
    publications.authors.au_id AS 'AUTHOR ID', 
    publications.authors.au_lname AS 'LAST NAME', 
    publications.authors.au_fname AS 'FIRST NAME', 
    publications.titles.title AS 'TITLE', 
    publications.publishers.pub_name AS 'PUBLISHER'
FROM 
    authors 
    JOIN titleauthor ON publications.authors.au_id = publications.titleauthor.au_id
    JOIN titles ON publications.titleauthor.title_id = publications.titles.title_id
    JOIN publishers ON publications.titles.pub_id = publications.publishers.pub_id;


## Challenge 2 - Who Have Published How Many At Where?

SELECT 
    publications.authors.au_id AS 'AUTHOR ID', 
    publications.authors.au_lname AS 'LAST NAME', 
    publications.authors.au_fname AS 'FIRST NAME', 
    publications.publishers.pub_name AS 'PUBLISHER',
    COUNT(*) AS 'TOTAL'
FROM 
    authors 
    JOIN titleauthor ON publications.authors.au_id = publications.titleauthor.au_id
    JOIN titles ON publications.titleauthor.title_id = publications.titles.title_id
    JOIN publishers ON publications.titles.pub_id = publications.publishers.pub_id
GROUP BY
	authors.au_id,
    publishers.pub_name;

##Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.

## Challenge 3 - Best Selling Authors
##Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

##Requirements:

##* Your output should have the following columns:
	##* `AUTHOR ID` - the ID of the author
	##* `LAST NAME` - author last name
	##* `FIRST NAME` - author first name
	##* `TOTAL` - total number of titles sold from this author
##* Your output should be ordered based on `TOTAL` from high to low.
##* Only output the top 3 best selling authors.

SELECT 
    publications.authors.au_id AS 'AUTHOR ID', 
    publications.authors.au_lname AS 'LAST NAME', 
    publications.authors.au_fname AS 'FIRST NAME', 
    publications.publishers.pub_name AS 'PUBLISHER',
    COUNT(*) AS 'TOTAL' 
FROM 
    authors 
    JOIN titleauthor ON publications.authors.au_id = publications.titleauthor.au_id
    JOIN titles ON publications.titleauthor.title_id = publications.titles.title_id
    JOIN publishers ON publications.titles.pub_id = publications.publishers.pub_id
GROUP BY
	authors.au_id,
    publishers.pub_name
ORDER BY
	TOTAL DESC
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

##Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
##Note that the authors who have sold 0 titles should also appear in your output 
##(ideally display `0` instead of `NULL` as the `TOTAL`). Also order your results based on `TOTAL` from high to low.

SELECT 
    publications.authors.au_id AS 'AUTHOR ID', 
    publications.authors.au_lname AS 'LAST NAME', 
    publications.authors.au_fname AS 'FIRST NAME', 
    publications.publishers.pub_name AS 'PUBLISHER',
    COUNT(*) AS 'TOTAL' 
FROM 
    authors 
    JOIN titleauthor ON publications.authors.au_id = publications.titleauthor.au_id
    JOIN titles ON publications.titleauthor.title_id = publications.titles.title_id
    JOIN publishers ON publications.titles.pub_id = publications.publishers.pub_id
GROUP BY
	authors.au_id,
    publishers.pub_name
ORDER BY
	TOTAL DESC;
