USE publications;
-- Challenge 1
-- What titles each author has published at which publishers?
SELECT a.au_id as AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    t.title AS TITLE,
    p.pub_name AS PUBLISHER
FROM titles t
    INNER JOIN titleauthor ta ON ta.title_id = t.title_id
    INNER JOIN authors a ON a.au_id = ta.au_id
    INNER JOIN publishers p ON p.pub_id = t.pub_id;
-- Challenge 2
-- How many titles each author has published at each publisher?
SELECT a.au_id as AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    p.pub_name AS PUBLISHER,
    COUNT(*) AS TITLE_COUNT
FROM titles t
    INNER JOIN titleauthor ta ON ta.title_id = t.title_id
    INNER JOIN authors a ON a.au_id = ta.au_id
    INNER JOIN publishers p ON p.pub_id = t.pub_id
GROUP BY a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name;
-- Challenge 3
-- Who are the top 3 authors who have sold the highest number of titles?
USE publications;
SELECT a.au_id as AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(s.qty) AS TOTAL
FROM authors a
    LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
    LEFT JOIN sales s ON ta.title_id = s.title_id
GROUP BY AUTHOR_ID,
    LAST_NAME,
    FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 3;
-- Challenge 4
-- Modify previous solution so that the output will display all 23 authors instead of the top 3.
SELECT a.au_id as AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    IFNULL(COUNT(s.qty), 0) AS TOTAL
FROM authors a
    LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
    LEFT JOIN sales s ON ta.title_id = s.title_id
GROUP BY AUTHOR_ID,
    LAST_NAME,
    FIRST_NAME
ORDER BY TOTAL DESC;