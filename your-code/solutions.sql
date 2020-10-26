#CHALLENGE 1
SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, title AS TITLE, pub_name AS PUBLISHER
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON publishers.pub_id = titles.pub_id;


#CHALLENGE 2
SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, pub_name AS PUBLISHER, count(title) AS TITLE_COUNT
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_id; 



#CHALLENGE 3
SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, SUM(qty) as TOTAL
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON publishers.pub_id = titles.pub_id
INNER JOIN publications.sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id, sales.qty
ORDER BY sales.qty DESC
LIMIT 3;

#CHALLENGE 4
SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, coalesce(sum(qty),0) as TOTAL
FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id 
LEFT JOIN publications.titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publications.publishers
ON publishers.pub_id = titles.pub_id
LEFT JOIN publications.sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id, sales.qty
ORDER BY sales.qty DESC;


