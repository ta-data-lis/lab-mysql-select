CREATE DATABASE publications;
USE publications;
/*Challenge 1 */

CREATE TEMPORARY TABLE publications.tabl1
SELECT au_lname, au_fname, authors.au_id AS AUTHOR_ID, titleauthor.title_id, titleauthor.au_id                                                           
FROM authors
RIGHT JOIN titleauthor
ON titleauthor.au_id = authors.au_id
;

CREATE TEMPORARY TABLE tabl2
SELECT tabl1.*,  titles.title, titles.pub_id
FROM tabl1
INNER JOIN titles
ON tabl1.title_id = titles.title_id
;

CREATE TEMPORARY TABLE tabl3
SELECT tabl2.AUTHOR_ID, tabl2.au_lname AS LAST_NAME, tabl2.au_fname AS FIRST_NAME, tabl2.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM tabl2
INNER JOIN publishers 
ON tabl2.pub_id = publishers.pub_id
;
 
/*Challenge 2*/
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, COUNT(TITLE) AS TITLE_COUNT
FROM tabl3
GROUP BY AUTHOR_ID
;
/*Challenge 3*/
select AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, SUM(qty) AS TOTAL
from tabl1
LEFT JOIN sales
ON tabl1.title_id = sales.title_id
GROUP BY AUTHOR_ID 
ORDER BY TOTAL DESC
LIMIT 3
;
/*Challenge 4*/
select AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, SUM(qty) AS TOTAL
from tabl1
LEFT JOIN sales
ON tabl1.title_id = sales.title_id
GROUP BY AUTHOR_ID 
ORDER BY TOTAL DESC
;
select *
from tabl1
group by AUTHOR_ID