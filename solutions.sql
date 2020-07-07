SELECT * FROM Labs.authors;
SELECT * FROM Labs.publishers;
SELECT * FROM Labs.titleauthor;
SELECT * FROM Labs.titles;

/* Challenge 1 - Who Have Published What At Where?

In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author 
has published at which publishers. Your output should have at least the following columns:

    AUTHOR ID - the ID of the author
    LAST NAME - author last name
    FIRST NAME - author first name
    TITLE - name of the published title
    PUBLISHER - name of the publisher where the title was published

If your query is correct, the total rows in your output should be the same as the total number of records in Table 
titleauthor. */


SELECT au.au_id AS "AUTHOR ID",
au.au_lname AS "LAST NAME",
au.au_fname AS "FIRST NAME",
t.title AS "TITLE",
p.pub_name AS "PUBLISHER"
FROM Labs.authors AS au
INNER JOIN Labs.titleauthor AS ta
ON au.au_id = ta.au_id
INNER JOIN Labs.titles AS t
ON ta.title_id = t.title_id
INNER JOIN Labs.publishers AS p
ON t.pub_id = p.pub_id;

/* If your query is correct, the total rows in your output should be the same as the total number of records 
in Table titleauthor.*/

SELECT COUNT(*) FROM Labs.titleauthor;

/* Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. */

SELECT au.au_id AS "AUTHOR ID",
au.au_lname AS "LAST NAME",
au.au_fname AS "FIRST NAME",
p.pub_name AS "PUBLISHER",
COUNT(t.title) AS "TITLE COUNT"
FROM Labs.authors AS au
INNER JOIN Labs.titleauthor AS ta
ON au.au_id = ta.au_id
INNER JOIN Labs.titles AS t
ON ta.title_id = t.title_id
INNER JOIN Labs.publishers AS p
ON t.pub_id = p.pub_id
GROUP BY au.au_id, p.pub_name;

/* To check if your output is correct, sum up the TITLE COUNT column. The sum number should be the same as 
the total number of records in Table titleauthor. */

SELECT SUM(`TITLE COUNT`)
FROM (SELECT au.au_id AS "AUTHOR ID",
au.au_lname AS "LAST NAME",
au.au_fname AS "FIRST NAME",
p.pub_name AS "PUBLISHER",
COUNT(t.title) AS "TITLE COUNT"
FROM Labs.authors AS au
INNER JOIN Labs.titleauthor AS ta
ON au.au_id = ta.au_id
INNER JOIN Labs.titles AS t
ON ta.title_id = t.title_id
INNER JOIN Labs.publishers AS p
ON t.pub_id = p.pub_id
GROUP BY au.au_id, p.pub_name) Summary;

/* Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:
    Your output should have the following columns:
        AUTHOR ID - the ID of the author
        LAST NAME - author last name
        FIRST NAME - author first name
        TOTAL - total number of titles sold from this author
    Your output should be ordered based on TOTAL from high to low.
    Only output the top 3 best selling authors.
*/

SELECT * FROM Labs.authors;
SELECT * FROM Labs.publishers;
SELECT * FROM Labs.titleauthor;
SELECT * FROM Labs.titles;
SELECT * FROM Labs.sales;

SELECT au.au_id AS "AUTHOR ID",
au.au_lname AS "LAST NAME",
au.au_fname AS "FIRST NAME",
SUM(t.ytd_sales) AS "TOTAL"
FROM Labs.authors AS au
INNER JOIN Labs.titleauthor AS ta
ON au.au_id = ta.au_id
INNER JOIN Labs.titles AS t
ON ta.title_id = t.title_id
GROUP BY au.au_id
ORDER BY `TOTAL` DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking

Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL 
as the TOTAL). Also order your results based on TOTAL from high to low.
*/

SELECT au.au_id AS "AUTHOR ID",
au.au_lname AS "LAST NAME",
au.au_fname AS "FIRST NAME",
IFNULL(SUM(t.ytd_sales), 0) AS "TOTAL"
FROM Labs.authors AS au
LEFT JOIN Labs.titleauthor AS ta
ON au.au_id = ta.au_id
LEFT JOIN Labs.titles AS t
ON ta.title_id = t.title_id
GROUP BY au.au_id
ORDER BY `TOTAL` DESC;

