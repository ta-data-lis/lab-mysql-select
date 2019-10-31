# Chalennge 1
SELECT authors.au_id AS Author_ID, authors.au_lname AS Last_name, authors.au_fname AS First_name, titles.title AS TITLE, publishers.pub_name AS PUBLISHER FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id;

# Challenge 2
SELECT titleauthor.au_id AS AUTHOR_ID, authors.au_fname AS FIRST_NAME, authors.au_lname AS LAST_NAME, publishers.pub_name, COUNT(publishers.pub_name) FROM titleauthor
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY COUNT(publishers.pub_name) DESC;

SELECT COUNT(*)
FROM titleauthor;

# Challenge 3
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, sum(qty) AS TOTAL_SALES
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC LIMIT 3;

# Challenge 4 (still not sure about this question)
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, COALESCE (sum(qty), 0) AS TOTAL_SALES FROM titleauthor
RIGHT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC;


