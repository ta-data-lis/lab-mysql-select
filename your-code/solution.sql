USE publications;

/*Challenge 1 - Who Have Published What At Where?*/

CREATE TEMPORARY TABLE temp_01 (
SELECT t1.au_id,
	   t1.au_lname,
	   t1.au_fname,
       t3.title,
	   t4.pub_name
FROM authors AS t1
INNER JOIN titleauthor AS t2 ON t1.au_id = t2.au_id
INNER JOIN titles AS t3 ON t2.title_id = t3.title_id
INNER JOIN publishers AS t4 ON t3.pub_id = t4.pub_id
);
SELECT * FROM temp_01;

/*Challenge 2 - Who Have Published How Many At Where?*/

SELECT au_id, au_lname, au_fname, pub_name, COUNT(*) AS QTD
FROM temp_01
GROUP BY au_id;

/*Challenge 3 - Best Selling Authors*/

SELECT au_id, au_lname, au_fname, COUNT(*) AS QTD
FROM temp_01
GROUP BY au_id
ORDER BY COUNT(*) DESC
LIMIT 3;

/*Challenge 4 - Best Selling Authors Ranking*/

SELECT au_id, au_lname, au_fname, COUNT(*) AS QTD
FROM temp_01
GROUP BY au_id
ORDER BY COUNT(*) DESC;