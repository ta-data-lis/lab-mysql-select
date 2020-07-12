/* CHALLENGE#1: */
SELECT au.au_id AS 'AUTHOR ID' , 
au.au_fname AS 'LAST NAME', 
au.au_lname AS 'FIRST NAME', 
ttl.title AS 'TITLE', 
pbs.pub_name AS 'PUBLISHER'
FROM mysql_ex.authors AS au
INNER JOIN mysql_ex.titleauthor AS ttla 
ON au.au_id = ttla.au_id
INNER JOIN mysql_ex.titles AS ttl
ON ttla.title_id = ttl.title_id
INNER JOIN mysql_ex.publishers AS pbs
ON pbs.pub_id = ttl.pub_id ;

/* Challenge#2: */
SELECT 
au.au_id AS 'AUTHOR ID' , 
au.au_fname AS 'LAST NAME', 
au.au_lname AS 'FIRST NAME', 
pbs.pub_name AS 'PUBLISHER' , 
count(ttl.title) AS 'TITTLE COUNT'
FROM mysql_ex.authors AS au
INNER JOIN mysql_ex.titleauthor AS ttla 
ON au.au_id = ttla.au_id
INNER JOIN mysql_ex.titles AS ttl
ON ttla.title_id = ttl.title_id
INNER JOIN mysql_ex.publishers AS pbs
ON pbs.pub_id = ttl.pub_id
GROUP BY au.au_id ;

/* CHALLENGE3: */
SELECT 
au.au_id AS 'AUTHOR ID' , 
au.au_lname AS 'FIRST NAME', 
au.au_fname AS 'LAST NAME', 
SUM(sal.qty) AS 'TITLES SOLD'
FROM mysql_ex.authors AS au
LEFT JOIN mysql_ex.titleauthor AS ttla /* um ator pode ter vários titulos */
ON au.au_id = ttla.au_id 
LEFT JOIN mysql_ex.sales AS sal /* para cada titulo pode haver varias ordens/vendas */
ON ttla.title_id = sal.title_id
GROUP BY au.au_id
ORDER BY SUM(sal.qty) DESC
LIMIT 3 ;

/* CHallenge 4: */
SELECT 
au.au_id AS 'AUTHOR ID' , 
au.au_lname AS 'FIRST NAME', 
au.au_fname AS 'LAST NAME', 
IFNULL(SUM(sal.qty), 0) AS 'TITLES SOLD'
FROM mysql_ex.authors AS au
LEFT JOIN mysql_ex.titleauthor AS ttla 
ON au.au_id = ttla.au_id
LEFT JOIN mysql_ex.sales AS sal
ON ttla.title_id = sal.title_id
GROUP BY au.au_id
ORDER BY SUM(sal.qty) DESC ;