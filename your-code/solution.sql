

/* ## Challenge 1 - Who Have Published What At Where? */
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME' , titles.title AS 'TITLE' , publishers.pub_name AS 'PUBLISHER'
FROM lab_mysql_select.authors
INNER JOIN lab_mysql_select.titleauthor
ON lab_mysql_select.authors.au_id=lab_mysql_select.titleauthor.au_id
INNER JOIN lab_mysql_select.titles
ON lab_mysql_select.titleauthor.title_id=lab_mysql_select.titles.title_id
INNER JOIN lab_mysql_select.publishers
ON lab_mysql_select.titles.pub_id=lab_mysql_select.publishers.pub_id;


/* ## Challenge 2 - Who Have Published How Many At Where? */
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name AS 'PUBLISHER',  COUNT(*) AS 'TITLE COUNT'
FROM lab_mysql_select.authors
INNER JOIN lab_mysql_select.titleauthor
ON lab_mysql_select.authors.au_id=lab_mysql_select.titleauthor.au_id
INNER JOIN lab_mysql_select.titles
ON lab_mysql_select.titleauthor.title_id=lab_mysql_select.titles.title_id
INNER JOIN lab_mysql_select.publishers
ON lab_mysql_select.titles.pub_id=lab_mysql_select.publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;


/* ## Challenge 3 - Best Selling Authors */
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', SUM(sales.qty) AS 'TOTAL'
FROM lab_mysql_select.authors
INNER JOIN lab_mysql_select.titleauthor
ON lab_mysql_select.authors.au_id=lab_mysql_select.titleauthor.au_id
INNER JOIN lab_mysql_select.titles
ON lab_mysql_select.titleauthor.title_id=lab_mysql_select.titles.title_id
INNER JOIN lab_mysql_select.sales
ON lab_mysql_select.titles.title_id=lab_mysql_select.sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;


/* ## Challenge 4 - Best Selling Authors Ranking */
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', COALESCE(SUM(sales.qty),0) AS 'TOTAL'
FROM lab_mysql_select.authors
LEFT JOIN lab_mysql_select.titleauthor
ON lab_mysql_select.authors.au_id=lab_mysql_select.titleauthor.au_id
LEFT JOIN lab_mysql_select.titles
ON lab_mysql_select.titleauthor.title_id=lab_mysql_select.titles.title_id
LEFT JOIN lab_mysql_select.sales
ON lab_mysql_select.titles.title_id=lab_mysql_select.sales.title_id
GROUP BY authors.au_id
ORDER BY COALESCE(SUM(sales.qty),0) DESC;



