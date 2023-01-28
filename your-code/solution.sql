SELECT * FROM lab2.authors;

## Challenge 1 - Who Have Published What At Where? ##

SELECT titleauthor.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", publishers.pub_name AS "PUBLISHER"
FROM lab2.titleauthor
LEFT JOIN lab2.authors
ON titleauthor.au_id = authors.au_id
INNER JOIN lab2.titles 
ON titleauthor.title_id = titles.title_id
INNER JOIN lab2.publishers
ON titles.pub_id = publishers.pub_id
ORDER BY titleauthor.au_id ASC;  -- 25 rows

SELECT * FROM lab2.titleauthor; -- 25 rows
 
 
 
## Challenge 2 - Who Have Published How Many At Where? ##

SELECT titleauthor.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", publishers.pub_name AS "PUBLISHER", COUNT(titles.title_id) AS "TITLE COUNT"
FROM lab2.titleauthor
LEFT JOIN lab2.authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN lab2.titles 
ON titleauthor.title_id = titles.title_id
LEFT JOIN lab2.publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY titleauthor.au_id DESC;

-- checking against the total number of records in Table titleauthor (25):
select count(*)
from lab2.titleauthor;


## Challenge 3 - Best Selling Authors ##

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", qty AS TOTAL
FROM lab2.authors
LEFT JOIN lab2.titleauthor
ON titleauthor.au_id = authors.au_id
LEFT JOIN lab2.titles 
ON titleauthor.title_id = titles.title_id
LEFT JOIN lab2.sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY TOTAL DESC
LIMIT 3;



## Challenge 4 - Best Selling Authors Ranking ##

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", coalesce(qty, 0) AS TOTAL
FROM lab2.authors
LEFT JOIN lab2.titleauthor
ON titleauthor.au_id = authors.au_id
LEFT JOIN lab2.titles 
ON titleauthor.title_id = titles.title_id
LEFT JOIN lab2.sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY TOTAL DESC;
