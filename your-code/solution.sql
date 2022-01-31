USE publications;

select *
from authors;

-- Challenge 1

-- In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TITLE - name of the published title
-- PUBLISHER - name of the publisher where the title was published

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title AS 'TITLE' , publishers.pub_name AS 'PUBLISHER'
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id;

-- ## Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 


SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name AS 'PUBLISHER', COUNT(titles.title) AS 'TOTAL BOOKS'
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id
GROUP BY authors.au_id, publishers.pub_name, authors.au_fname, authors.au_lname;

-- ## Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME',
MAX(qty) AS 'TOTAL'
FROM sales
INNER JOIN titles
ON sales.title_id = titles.title_id
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN authors
ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY TOTAL DESC
LIMIT 3;

-- ## Challenge 4 - Best Selling Authors Ranking
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). 
-- Also order your results based on `TOTAL` from high to low.

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME',
IFNULL(SUM(qty), 0)  AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC;



