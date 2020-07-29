/* Challenge 1 */

SELECT a.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors a
INNER JOIN titleauthor ta ON a.au_id=ta.au_id
INNER JOIN titles t ON ta.title_id=t.title_id
INNER JOIN publishers p ON t.pub_id=p.pub_id;

/* Challenge 2 */ 

SELECT a.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", p.pub_name AS PUBLISHER, count(t.title_id) AS "TITLE COUNT"
FROM authors a
INNER JOIN titleauthor ta ON a.au_id=ta.au_id
INNER JOIN titles t ON ta.title_id=t.title_id
INNER JOIN publishers p ON t.pub_id=p.pub_id
GROUP BY a.au_id, p.pub_id;


/*Challenge 3 */

SELECT a.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", sum(s.qty) AS TOTAL
FROM authors a
INNER JOIN titleauthor ta ON ta.au_id = a.au_id
INNER JOIN titles t ON t.title_id = ta.title_id
INNER JOIN sales s ON s.title_id = t.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3

/* Challenge 4 */

SELECT a.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", COALESCE(sum(s.qty), 0) AS TOTAL
FROM authors a
LEFT JOIN titleauthor ta ON ta.au_id = a.au_id
LEFT JOIN titles t ON t.title_id = ta.title_id
LEFT JOIN sales s ON s.title_id = t.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;


