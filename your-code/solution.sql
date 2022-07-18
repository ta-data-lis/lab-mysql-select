SELECT authors.au_id AS Author_ID, authors.au_lname AS Last_Name, authors.au_fname AS First_Name, titles.title AS Ttile, publishers.pub_name AS Publishers
FROM labs_week2.authors
INNER JOIN labs_week2.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN labs_week2.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN labs_week2.publishers
ON titles.pub_id = publishers.pub_id;

#CHALLENGE 2 # check this

SELECT titleauthor.au_id as author_id, au_fname as first_name, au_lname as last_name, pub_name, COUNT(title) as title_count
FROM labs_week2.authors
INNER JOIN labs_week2.titleauthor
ON labs_week2.authors.au_id = labs_week2.titleauthor.au_id
INNER JOIN labs_week2.titles
ON labs_week2.titles.title_id = labs_week2.titleauthor.title_id
INNER JOIN labs_week2.publishers
ON labs_week2.publishers.pub_id = labs_week2.titles.pub_id
GROUP BY author_id, au_fname, au_lname, pub_name
ORDER BY title_count DESC;

#Challenge 3

SELECT titleauthor.au_id as author_id, au_fname as first_name, au_lname as last_name, SUM(qty) as total
FROM labs_week2.authors
INNER JOIN labs_week2.titleauthor
ON labs_week2.authors.au_id = labs_week2.titleauthor.au_id
INNER JOIN labs_week2.titles
ON labs_week2.titles.title_id = labs_week2.titleauthor.title_id
INNER JOIN labs_week2.sales
ON labs_week2.sales.title_id = labs_week2.titles.title_id
GROUP BY author_id, first_name, last_name
ORDER BY total DESC
LIMIT 3;


#Challenge 4

SELECT titleauthor.au_id as author_id, au_fname as first_name, au_lname as last_name, SUM(qty) as total
FROM labs_week2.authors
INNER JOIN labs_week2.titleauthor
ON labs_week2.authors.au_id = labs_week2.titleauthor.au_id
INNER JOIN labs_week2.titles
ON labs_week2.titles.title_id = labs_week2.titleauthor.title_id
INNER JOIN labs_week2.sales
ON labs_week2.sales.title_id = labs_week2.titles.title_id
GROUP BY author_id, first_name, last_name
ORDER BY total DESC;

