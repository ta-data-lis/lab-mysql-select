SELECT a.au_id as 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FULL NAME', t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM publications.authors as a
INNER JOIN publications.titleauthor as ta
ON a.au_id = ta.au_id
INNER JOIN publications.titles as t
ON ta.title_id = t.title_id
INNER JOIN publications.publishers as p
ON t.pub_id = p.pub_id;

SELECT a.au_id as 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FULL NAME', p.pub_name AS 'PUBLISHER', count(t.title_id) as 'TITLE COUNT'
FROM publications.authors as a
INNER JOIN publications.titleauthor as ta
ON a.au_id = ta.au_id
INNER JOIN publications.titles as t
ON ta.title_id = t.title_id
INNER JOIN publications.publishers as p
ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY a.au_id DESC;

SELECT a.au_id as 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FULL NAME', count(s.title_id) AS 'TOTAL COUNT'
FROM publications.authors as a
INNER JOIN publications.titleauthor as ta
ON a.au_id = ta.au_id
INNER JOIN publications.sales as s
ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY `TOTAL COUNT` DESC
LIMIT 3;

SELECT a.au_id as 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FULL NAME', count(s.title_id) AS 'TOTAL COUNT'
FROM publications.authors as a
LEFT OUTER JOIN publications.titleauthor as ta
ON a.au_id = ta.au_id
LEFT OUTER JOIN publications.sales as s
ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY `TOTAL COUNT` DESC;