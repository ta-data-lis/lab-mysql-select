## Challenge 1 - Who Have Published What At Where?
CREATE TEMPORARY TABLE lab2.authors_titles3
SELECT  titleauthor.au_id, au_lname,au_fname, title_id
FROM  lab2.authors
INNER JOIN lab2.titleauthor
ON lab2.authors.au_id = lab2.titleauthor.au_id;

CREATE TEMPORARY TABLE lab2.authors_titles_pub2
SELECT au_id, au_lname, au_fname, title, pub_id 
FROM lab2.titles
INNER JOIN lab2.authors_titles3
ON lab2.titles.title_id = lab2.authors_titles3.title_id;

SELECT au_id, au_lname, au_fname, title, pub_name
FROM lab2.publishers
INNER JOIN lab2.authors_titles_pub2
ON lab2.authors_titles_pub2.pub_id = lab2.publishers.pub_id;

Select *
from titleauthor;

## Challenge 2 - Who Have Published How Many At Where?
SELECT au_id, au_lname, au_fname, pub_name, count(title)
FROM lab2.publishers
INNER JOIN lab2.authors_titles_pub2
ON lab2.authors_titles_pub2.pub_id = lab2.publishers.pub_id
Group by au_id, au_lname, au_fname, pub_name
Order by au_id DESC, count(title) DESC;

## Challenge 3 - Best Selling Authors
SELECT *
From sales;

SELECT au_id, au_lname, au_fname, sum(qty)
FROM lab2.sales
INNER JOIN lab2.authors_titles3
ON lab2.sales.title_id = lab2.authors_titles3.title_id
GROUP BY au_id, au_lname, au_fname
ORDER BY sum(qty) DESC
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking
CREATE TEMPORARY TABLE lab2.authors_titles5
SELECT  titleauthor.au_id, au_lname,au_fname, title_id
FROM  lab2.authors
Left JOIN lab2.titleauthor
ON lab2.authors.au_id = lab2.titleauthor.au_id;

SELECT au_id, au_lname, au_fname, sum(qty)
FROM lab2.authors_titles5
LEFT JOIN lab2.sales 
ON  lab2.authors_titles5.title_id = lab2.sales.title_id
GROUP BY au_id, au_lname, au_fname
ORDER BY sum(qty) DESC;


