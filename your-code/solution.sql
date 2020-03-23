-- Challenge 1 - Who Have Published What At Where? --

SELECT * FROM authors;
-- from here we need author_id, last_name, first_name

SELECT * FROM titleauthor;
-- need to connect title_id with title in titles

SELECT * FROM titles;
-- need pub_id to connect to the publisher name

SELECT * FROM publishers;
-- from here i need pub_name

SELECT authors.au_id, authors.au_iname, authors.aufname
FROM authors

-- to make sure its the same as the output table need to rename variables
SELECT a.au_id AS "AUTHOR ID", a.au_fname AS "FIRST NAME", a.au_lname AS "LAST NAME",t.title AS "TITLE", p.pub_name AS "PUBLISHER"
FROM titles t
JOIN titleauthor ta
ON t.title_id = ta.title_id
JOIN authors a
ON a.au_id = ta.au_id
JOIN publishers p
ON p.pub_id = t.pub_id;

-- confirm number of columns --
SELECT COUNT(*) FROM titleauthor;


-- Challenge 2 - Who Have Published What At Where? --
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME",p.pub_name AS "PUBLISHER", COUNT(t.title) AS "TITLE COUNT"
FROM titles t
JOIN titleauthor ta
ON t.title_id = ta.title_id
JOIN authors a
ON a.au_id = ta.au_id
JOIN publishers p
ON p.pub_id = t.pub_id
GROUP BY a.au_id
ORDER BY COUNT(t.title) DESC;


-- Challenge 3 - Best Selling Authors --
SELECT * FROM sales;
SELECT * FROM titles;

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", SUM(s.qty) AS "TOTAL"
FROM titles t
-- first join: sales and title 
JOIN sales s
ON t.title_id = s.title_id
-- second join: title author and title 
JOIN titleauthor ta
ON ta.title_id = t.title_id
-- third join: authors and title author
JOIN authors a
ON ta.au_id = a.au_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY SUM(s.qty) DESC
LIMIT 3;


-- Challenge 4 - Best Selling Authors Ranking --
-- null values are not appearing because i used join instead of right join

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", COALESCE(SUM(s.qty), 0) AS "TOTAL"
FROM titles t
-- first join: sales and title 
JOIN sales s
ON t.title_id = s.title_id
-- second join: title author and title 
JOIN titleauthor ta
ON ta.title_id = t.title_id
-- third join: authors and title author
RIGHT JOIN authors a
ON ta.au_id = a.au_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY SUM(s.qty) DESC;

