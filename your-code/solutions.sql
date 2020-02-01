#CREATE DATABASE publications;

# Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM titleauthor  
LEFT JOIN authors ON titleauthor.au_id = authors.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;

#Challenge 2 - Who Have Published How Many At Where?
SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, 
COUNT(titles.title) AS "title_count"
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_id = authors.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id;

#Challenge 3 - Best Selling Authors Top 3
SELECT authors.au_id, authors.au_lname, authors.au_fname, 
SUM(sales.qty) AS "total"
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_id = authors.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY total DESC
LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id, authors.au_lname, authors.au_fname, 
COALESCE(SUM(sales.qty), 0) AS 'total'
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_id = authors.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY total DESC;
