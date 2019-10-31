#Challenge 1
SELECT authors.au_id AS 'Author ID', au_fname AS 'First Name', au_lname AS 'Last Name', title AS 'Publication Title', pub_name AS 'Publisher'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
ORDER BY au_lname;

#Challenge 2
SELECT authors.au_id AS 'Author ID', au_fname AS 'First Name', au_lname AS 'Last Name', pub_name AS 'Publisher', COUNT(titleauthor.au_id)
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY title;

#Challenge 3
SELECT authors.au_id AS 'Author ID', au_fname AS 'First Name', au_lname AS 'Last Name', SUM(titles.ytd_sales) AS 'Total Sales'
FROM authors
INNER JOIN titleauthor
ON  authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(titles.ytd_sales) DESC
LIMIT 3;

#Challenge 4
SELECT authors.au_id AS 'Author ID', au_fname AS 'First Name', au_lname AS 'Last Name', SUM(titles.ytd_sales) AS 'Total Sales'
FROM authors
LEFT JOIN titleauthor
ON  authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(titles.ytd_sales) DESC;