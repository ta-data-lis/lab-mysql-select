#1
SELECT au.au_id AS 'AUTHOR ID', au.au_lname 'AS LAST NAME',
au.au_fname AS 'FIRST NAME', t.title AS 'TITLE',
pu.pub_name AS 'PUBLISHER'
FROM Publications.authors au
LEFT JOIN Publications.titleauthor ta
ON au.au_id = ta.au_id
LEFT JOIN Publications.titles t 
ON ta.title_id = t.title_id
LEFT JOIN Publications.publishers pu
ON t.pub_id = pu.pub_id;

SELECT count(*)
FROM titleauthor;

#2
SELECT au.au_id AS 'AUTHOR ID', au.au_lname 'AS LAST NAME',
au.au_fname AS 'FIRST NAME',
pu.pub_name AS 'PUBLISHER',
COUNT(t.title) AS 'TITLE COUNT'
FROM Publications.authors au
LEFT JOIN Publications.titleauthor ta
ON au.au_id = ta.au_id
LEFT JOIN Publications.titles t
ON ta.title_id = t.title_id
LEFT JOIN Publications.publishers pu
ON t.pub_id = pu.pub_id
GROUP BY au.au_id, pu.pub_name
ORDER BY count(t.title) DESC;


#3

SELECT au.au_id AS 'AUTHOR ID', au.au_lname AS 'LAST NAME', au.au_fname AS 'FIRST NAME', SUM(sal.qty) AS 'TOTAL'
FROM Publications.authors au
LEFT JOIN titleauthor ta 
ON au.au_id = ta.au_id
LEFT JOIN Publications.titles t 
ON ta.title_id = t.title_id
LEFT JOIN sales sal 
ON t.title_id = sal.title_id
GROUP BY au.au_id
ORDER BY SUM(sal.qty) DESC
LIMIT 3;

#4

SELECT au.au_id AS 'AUTHOR ID', au.au_lname AS 'LAST NAME', au.au_fname AS 'FIRST NAME', SUM(sal.qty) AS 'TOTAL'
FROM Publications.authors au
LEFT JOIN titleauthor ta 
ON au.au_id = ta.au_id
LEFT JOIN Publications.titles t 
ON ta.title_id = t.title_id
LEFT JOIN Publications.sales sal 
ON t.title_id = sal.title_id
GROUP BY au.au_id
ORDER BY SUM(sal.qty) DESC
LIMIT 23;

#DONT KNOW HOW TO CHANGE THE NULL TO ZERO: tried to use  SELECT IS NULL( col, 0) from table but dont understand where should i put it 
