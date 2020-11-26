SELECT *
FROM publications.authors

SELECT *
FROM publications.discounts

SELECT *
FROM publications.employee

SELECT *
FROM publications.jobs

SELECT *
FROM publications.pub_info

SELECT *
FROM publications.publishers

SELECT *
FROM publications.roysched

SELECT *
FROM publications.sales

SELECT *
FROM publications.stores

SELECT *
FROM publications.titleauthor

SELECT *
FROM publications.titles

use publications

#Challenge 1 - Who Have Published What At Where?
#Iwrite a MySQL SELECT query that joins various tables
#figure out what titles each author has published at which publishers. 

#AUTHOR ID - the ID of the author - au_id
#LAST NAME - author last name - au_lname
#FIRST NAME - author first name - au_fname
#TITLE - name of the published title - title
#PUBLISHER - name of the publisher where the title was published - pub_name

#author - au_id
#titleauthor - au_id and title_id
#titles -title_id and pub_id
#publishers - pub_id

SELECT authors.au_id AS 'AUTHOR ID', 
authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', 
titles.title AS 'TITLE', 
publishers.pub_name AS 'PUBLISHER'
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id
INNER JOIN publishers ON titles.pub_id=publishers.pub_id
ORDER BY authors.au_id;

#Challenge 2 - Who Have Published How Many At Where?
#Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 
#AUTHOR ID
#LAST NAME
#FIRST NAME
#PUBLISHER
#TITLE COUNT

SELECT authors.au_id AS 'AUTHOR ID', 
authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', 
publishers.pub_name AS 'PUBLISHER',
COUNT(titles.title) AS 'TITLE COUNT'
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id
INNER JOIN publishers ON titles.pub_id=publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY COUNT(titles.title) DESC;

#Challenge 3 - Best Selling Authors
#Who are the top 3 authors who have sold the highest number of titles? 

#AUTHOR ID - the ID of the author
#LAST NAME - author last name
#FIRST NAME - author first name
#TOTAL - total number of titles sold from this author
#Your output should be ordered based on TOTAL from high to low.
#Only output the top 3 best selling authors.

SELECT authors.au_id AS 'AUTHOR ID', 
authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', 
SUM(titles.ytd_sales) AS 'TOTAL'
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(titles.ytd_sales) DESC
LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking
#Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 

SELECT authors.au_id AS 'AUTHOR ID', 
authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', 
SUM(titles.ytd_sales) AS 'TOTAL'
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(titles.ytd_sales) DESC
LIMIT 23;

####QUESTION 3- RESPOSTA ALTERNATIVA USANDO SALES.QTY em vez de TITLES.YTD_SALES

SELECT authors.au_id AS 'AUTHOR ID', 
authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', 
SUM(sales.qty) AS 'TOTAL'
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN sales ON titleauthor.title_id=sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

####QUESTION 4- RESPOSTA ALTERNATIVA USANDO SALES.QTY em vez de TITLES.YTD_SALES

SELECT authors.au_id AS 'AUTHOR ID', 
authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', 
SUM(sales.qty) AS 'TOTAL'
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN sales ON titleauthor.title_id=sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 23;