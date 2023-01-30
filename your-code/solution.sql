#Challenge 1

SELECT authors.au_id, authors.au_fname, authors.au_lname, titles.title, publishers.pub_name
FROM titles
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id;

#Challenge 2

SELECT authors.au_id, authors.au_fname, authors.au_lname, publishers.pub_name, COUNT(*) AS title_count
FROM titles
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id, publishers.pub_name;

#Challenge 3

SELECT authors.au_id, authors.au_fname, authors.au_lname, SUM(sales.qty) as total_sales
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

#Challenge 4

SELECT authors.au_id, authors.au_fname, authors.au_lname, SUM(sales.qty) as total_sales
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY au_id
ORDER BY SUM(sales.qty) DESC;

#I believe I must use the rollup up somewhere, but I can't find the solution.
#In the query above, I've populated the 19 authors that completed a sale.
#In the query below I managed to populate the null values in other columns.
#I think the logic is applying the nulls to the sales column and then set the entries to show "0" as value instead of null.

SELECT authors.au_id, authors.au_fname, authors.au_lname, SUM(sales.qty) as total_sales
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname WITH ROLLUP
ORDER BY SUM(sales.qty) DESC;