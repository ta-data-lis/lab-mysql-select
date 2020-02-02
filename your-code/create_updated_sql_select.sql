CREATE DATABASE publications;

#Challenge 1
CREATE TABLE authors_publishers
SELECT authors.au_id as AUTHORS, au_lname as LASTNAME, au_fname as FIRSTNAME, title as TITLE, pub_name as PUBLISHER FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id;


#count number of rows
select count(*) from titleauthor;

select count(*) from authors_publishers;

#Challenge 2 - How many titles each author has published at each publisher
SELECT AUTHORS, LASTNAME, FIRSTNAME, PUBLISHER, COUNT(TITLE) FROM authors_publishers GROUP BY AUTHORS, PUBLISHER, LASTNAME, FIRSTNAME ORDER BY COUNT(TITLE) DESC ;


# Challenge 3 - who are the top 3 authors who have sold the highest number of titles?
CREATE TEMPORARY TABLE sales
SELECT authors.au_id, au_lname,  au_fname, ytd_sales as TOTAL
FROM authors
INNER titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id;


SELECT au_id, au_lname, au_fname, SUM(TOTAL) AS sales FROM sales GROUP BY au_id, au_lname,au_fname ORDER BY sales DESC LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking

SELECT au_id, au_lname, au_fname, IFNULL(SUM(TOTAL),0) AS TOTAL FROM sales GROUP BY au_id, au_lname,au_fname ORDER BY TOTAL DESC;




