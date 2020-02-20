select * from titleauthor;
select * from publishers;
select * from titles;
select * from authors;
SELECT * FROM sales;

# Challenge 1
CREATE TEMPORARY TABLE first_table
SELECT auts.au_id AS 'AUTHOR ID', auts.au_fname AS 'LAST NAME', auts.au_lname AS 'FIRST NAME', ta.title_id as 'TitleID', title.title as 'Title',title.pub_id as 'Pub ID', pub.pub_name as 'Publisher'
FROM lab_mysql_select.authors AS auts
LEFT JOIN lab_mysql_select.titleauthor AS ta
ON auts.au_id = ta.au_id
LEFT JOIN lab_mysql_select.titles AS title
ON ta.title_id = title.title_id
LEFT JOIN lab_mysql_select.publishers AS pub
ON title.pub_id = pub.pub_id;
SELECT * FROM first_table;

#Challenge 2
SELECT  auts.au_fname AS 'LAST NAME', auts.au_lname AS 'FIRST NAME', pub.pub_name as 'Publisher', COUNT(title.title)
FROM lab_mysql_select.authors AS auts
LEFT JOIN lab_mysql_select.titleauthor AS ta
ON auts.au_id = ta.au_id
LEFT JOIN lab_mysql_select.titles AS title
ON ta.title_id = title.title_id
LEFT JOIN lab_mysql_select.publishers AS pub
ON title.pub_id = pub.pub_id
GROUP BY auts.au_fname, auts.au_lname, pub.pub_name
ORDER BY auts.au_lname;

#Challenge 3
SELECT aut.au_id AS 'AUTHOR ID', 
aut.au_lname AS 'LAST NAME',
aut.au_fname AS 'FIRST NAME', 
ti.title_id AS 'TITLES',
SUM(sa.qty) AS 'total number of titles sold'
FROM lab_mysql_select.authors AS aut
LEFT JOIN lab_mysql_select.titleauthor AS ti
ON aut.au_id = ti.au_id
LEFT JOIN lab_mysql_select.sales as sa
ON ti.title_id = sa.title_id
GROUP BY aut.au_id, ti.title_id
ORDER BY SUM(sa.qty) DESC
LIMIT 3; 

#Challenge 4
SELECT aut.au_id AS 'AUTHOR ID', 
aut.au_lname AS 'LAST NAME',
aut.au_fname AS 'FIRST NAME', 
COUNT(ti.title_id) AS 'TITLES',
SUM(sa.qty) AS 'total number of titles sold'
FROM lab_mysql_select.authors AS aut
LEFT JOIN lab_mysql_select.titleauthor AS ti
ON aut.au_id = ti.au_id
LEFT JOIN lab_mysql_select.sales as sa
ON ti.title_id = sa.title_id
GROUP BY aut.au_id, ti.title_id
ORDER BY SUM(sa.qty) DESC
