
/*Challenge 1*/
/*database is designed and what entity tables relate in what ways to other entity tables,the code are queries that join those entities together in a single table  */

SELECT pa.au_id AS 'AUTHOR ID',
	   pa.au_lname AS 'LAST NAME', 
       pa.au_fname AS 'FIRST NAME',
       pt.title AS 'TITLE',
       pp.pub_name AS 'PUBLISHER'
  FROM publications.titles AS pt
  JOIN publications.titleauthor AS pta
  ON pta.title_id = pt.title_id
  JOIN publications.authors AS pa  
  ON pa.au_id = pta.au_id
  JOIN publications.publishers AS pp
  ON pp.pub_id = pt.pub_id;

/*Challenge 2*/
SELECT au.au_id As "AUTHOR ID", au.au_lname AS "LAST NAME" , au.au_fname AS "FIRST NAME", p.pub_name AS "PUBLISHER", t.title AS "TITLE", count(t.title) AS "TITLE COUNT"
FROM authors AS au
INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
INNER JOIN titles AS t on t.title_id = ta.title_id
INNER JOIN publishers AS p on p.pub_id = t.pub_id
GROUP BY au.au_id, p.pub_name;

/*Challenge 3*/
SELECT au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME" , au.au_fname AS "FIRST NAME", t.title AS "TITLE", sales.qty AS "TOTAL"
FROM authors AS au
INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
INNER JOIN titles AS t on t.title_id = ta.title_id
INNER JOIN publishers AS p on p.pub_id = t.pub_id
INNER JOIN sales AS sales on sales.title_id = t.title_id
ORDER BY sales.qty DESC
LIMIT 3;

/* The left joins makes the row with null value appear*/

/* Challenge 4 */
SELECT au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME" , au.au_fname AS "FIRST NAME", t.title AS "TITLE", sales.qty AS "TOTAL"
FROM authors AS au
INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
INNER JOIN titles AS t on t.title_id = ta.title_id
INNER JOIN publishers AS p on p.pub_id = t.pub_id
LEFT JOIN sales AS sales on sales.title_id = t.title_id
ORDER BY sales.qty DESC