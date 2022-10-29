SELECT *
FROM authors;

CREATE TEMPORARY TABLE author_title
SELECT publications.authors.au_id , publications.authors.au_fname, publications.authors.au_lname,
publications.titleauthor.title_id
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id;

SELECT *
FROM author_title;

CREATE TEMPORARY TABLE title_pub
SELECT publications.titles.title_id, publications.titles.title, publications.titles.pub_id,
publications.publishers.pub_name
FROM publications.titles
INNER JOIN publications.publishers
ON publications.titles.pub_id = publications.publishers.pub_id;

SELECT *
FROM title_pub;

CREATE TEMPORARY TABLE author_title_pub
SELECT publications.author_title.au_id, publications.author_title.au_fname, publications.author_title.au_lname, publications.author_title.title_id,
publications.title_pub.title, publications.title_pub.pub_id, publications.title_pub.pub_name
FROM publications.author_title  
INNER JOIN publications.title_pub
ON publications.author_title.title_id = publications.title_pub.title_id;

SELECT *
FROM author_title_pub;

###top top do balaco top

SELECT publications.author_title_pub.au_id, publications.author_title_pub.au_fname, publications.author_title_pub.au_lname, publications.author_title_pub.pub_name,
COUNT(publications.author_title_pub.title)
FROM publications.author_title_pub
GROUP BY publications.author_title_pub.au_id;

#u thought i couldnt do it? me neither <3

CREATE TEMPORARY TABLE author_sales_title
SELECT publications.author_title_pub.au_id, publications.author_title_pub.au_fname, publications.author_title_pub.au_lname,
publications.author_title_pub.title_id, publications.sales.qty
FROM publications.author_title_pub
INNER JOIN publications.sales
ON publications.author_title_pub.title_id = publications.sales.title_id;

SELECT *
FROM author_sales_title;

SELECT publications.author_sales_title.au_id, publications.author_sales_title.au_fname, publications.author_sales_title.au_lname, SUM(publications.author_sales_title.qty) as TOTAL
FROM publications.author_sales_title
GROUP BY publications.author_sales_title.au_id
ORDER BY TOTAL DESC
LIMIT 3;

SELECT publications.author_sales_title.au_id, publications.author_sales_title.au_fname, publications.author_sales_title.au_lname, SUM(publications.author_sales_title.qty) as TOTAL
FROM publications.author_sales_title
GROUP BY publications.author_sales_title.au_id
ORDER BY TOTAL DESC
LIMIT 23;

#i didnt understand why they mention 0 quantity because they want top sales, so thats just clownery luv <3
#and i dont remember how to convert null values to 0, please send help and beer 