/*Challenge 1 - Who Have Published What At Where?*/

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", t.title AS "TITLE", p.pub_name AS "PUBLISHER"
FROM publications.authors AS a
INNER JOIN publications.titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN publications.titles as t
ON t.title_id = ta.title_id
INNER JOIN publications.publishers as p
ON t.pub_id = p.pub_id;


/*Challenge 2 - Who Have Published How Many At Where?*/

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", p.pub_name AS "PUBLISHER", COUNT(*) 
FROM publications.authors AS a
INNER JOIN publications.titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN publications.titles as t
ON t.title_id = ta.title_id
INNER JOIN publications.publishers as p
ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id;

/*Challenge 3 - Best Selling Authors?*/
SELECT a.au_id AS "AUTHOR ID",a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", SUM(s.qty) AS "TOTAL SALES"
FROM publications.authors AS a
INNER JOIN publications.titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN publications.titles as t
ON t.title_id = ta.title_id
INNER JOIN publications.publishers as p
ON t.pub_id = p.pub_id
INNER JOIN publications.sales as s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY SUM(s.qty) DESC
LIMIT 3;

/*Challenge 4 - Best Selling Authors Ranking*/
SELECT a.au_id AS "AUTHOR ID",a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", COALESCE(sum(s.qty),0) AS "TOTAL SALES"
FROM publications.authors AS a
LEFT JOIN publications.titleauthor AS ta
ON a.au_id = ta.au_id
LEFT JOIN publications.titles as t
ON t.title_id = ta.title_id
LEFT JOIN publications.publishers as p
ON t.pub_id = p.pub_id
LEFT JOIN publications.sales as s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY SUM(s.qty) DESC;




