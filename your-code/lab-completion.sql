USE publications;

/* CHALLENGE 1 
In this challenge you will write a MySQL SELECT query that joins various tables
to figure out what titles each author has published at which publishers. 
Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published

*/

SELECT * FROM authors;
SELECT * FROM titles;
SELECT * FROM publishers;
SELECT * FROM titleauthor

pub_name AS Publisher
au_id AS Author_ID, au_lname AS Last_Name, au_fname AS First_Name,

SELECT aut.au_id AS Author_ID, aut.au_lname AS Last_Name, aut.au_fname AS First_Name, Title.Title, Title.Publisher
FROM
(SELECT ta.au_id, ta.title_id, Title_Publisher.Title, Title_Publisher.Publisher
FROM
(SELECT ttl.title_id, ttl.title AS Title, pbl.pub_name AS Publisher
FROM titles ttl
JOIN publishers pbl
ON pbl.pub_id = ttl.pub_id) AS Title_Publisher
JOIN titleauthor as ta
ON ta.title_id = Title_Publisher.title_id) AS Title
JOIN authors aut
ON aut.au_id = Title.au_id;

/* CHALLENGE 2 
Elevating from your solution in Challenge 1, 
query how many titles each author has published at each publisher.

*/

SELECT aut.au_id AS Author_ID, aut.au_lname AS Last_Name, aut.au_fname AS First_Name, Title.Publisher AS Publisher, COUNT(Title.Title)
FROM
(SELECT ta.au_id, ta.title_id, Title_Publisher.Title, Title_Publisher.Publisher
FROM
(SELECT ttl.title_id, ttl.title AS Title, pbl.pub_name AS Publisher
FROM titles ttl
JOIN publishers pbl
ON pbl.pub_id = ttl.pub_id) AS Title_Publisher
JOIN titleauthor as ta
ON ta.title_id = Title_Publisher.title_id) AS Title
JOIN authors aut
ON aut.au_id = Title.au_id
GROUP BY Author_ID, Publisher
ORDER BY Author_ID DESC;

/*  Challenge 3 
Who are the top 3 authors who have sold the highest number of titles? 
Write a query to find out.

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.
*/


SELECT sa.title_id, Title_info.Author_ID, Title_info.Last_Name, Title_info.First_Name, SUM(sa.qty) AS Total_Sales
FROM
(SELECT Title.title_id, aut.au_id AS Author_ID, aut.au_lname AS Last_Name, aut.au_fname AS First_Name, Title.Publisher AS Publisher, Title.Title
FROM
(SELECT ta.au_id, ta.title_id, Title_Publisher.Title, Title_Publisher.Publisher
FROM
(SELECT ttl.title_id, ttl.title AS Title, pbl.pub_name AS Publisher
FROM titles ttl
JOIN publishers pbl
ON pbl.pub_id = ttl.pub_id) AS Title_Publisher
JOIN titleauthor as ta
ON ta.title_id = Title_Publisher.title_id) AS Title
JOIN authors aut
ON aut.au_id = Title.au_id) AS Title_info
JOIN sales sa
ON sa.title_id = Title_info.title_id
GROUP BY Author_ID
ORDER BY Total_Sales DESC
LIMIT 3;

/* CHALLENGE 4 
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3.
Note that the authors who have sold 0 titles
should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low.

*/

CREATE TEMPORARY TABLE title_info
SELECT aut.au_id, aut.au_lname, aut.au_fname, tta.title_id
FROM authors aut
LEFT JOIN titleauthor tta
ON aut.au_id = tta.au_id

CREATE TEMPORARY TABLE author_sales
SELECT ti.au_id, ti.au_lname, ti.au_fname, COALESCE(SUM(sa.qty),0) AS TOTAL
FROM sales sa
RIGHT JOIN title_info ti
ON sa.title_id = ti.title_id
GROUP BY ti.au_id
ORDER BY TOTAL DESC;

SELECT * FROM author_sales;

