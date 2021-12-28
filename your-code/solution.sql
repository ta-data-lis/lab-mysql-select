USE publications;

-- Challenge 1 - Who Have Published What At Where?
-- `AUTHOR ID`, `LAST NAME`,`FIRST NAME`, `TITLE`, `PUBLISHER`

SELECT a.au_id, a.au_fname, a.au_lname, t.title, p.pub_name, p.city
FROM authors as a 
INNER JOIN titleauthor AS ta ON ta.au_id = a.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
-- `AUTHOR ID`, `LAST NAME`,`FIRST NAME`, `PUBLISHER`, count title

SELECT a.au_id, a.au_fname, a.au_lname, p.pub_name, count(t.title)
FROM authors as a 
INNER JOIN titleauthor AS ta ON ta.au_id = a.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id
GROUP BY a.au_id, p.pub_name;

-- Challenge 3 - Best Selling Authors
-- `AUTHOR ID`, `LAST NAME`,`FIRST NAME`, ytd_sales, order desc, limit 3

SELECT a.au_id, a.au_fname, a.au_lname, sum(t.ytd_sales)'total_sales'
FROM authors as a 
INNER JOIN titleauthor AS ta ON ta.au_id = a.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY total_sales DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT a.au_id, a.au_fname, a.au_lname, sum(IFNULL(t.ytd_sales, 0))'total_sales'
FROM authors as a 
LEFT JOIN titleauthor AS ta ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON t.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY total_sales DESC;

