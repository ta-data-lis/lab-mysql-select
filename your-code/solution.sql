SELECT authors.au_id AS Author_ID, au_lname AS Last_Name,au_fname AS First_Name,title,pub_name AS Publisher
FROM publication.authors
INNER JOIN publication.titleauthor
ON publication.authors.au_id=publication.titleauthor.au_id
INNER JOIN publication.titles
ON publication.titleauthor.title_id=publication.titles.title_id
INNER JOIN publication.publishers
ON publication.titles.pub_id= publication.publishers.pub_id
ORDER BY Last_name;

SELECT authors.au_id,authors.au_lname AS Last_Name, authors.au_fname AS First_Name, publishers.pub_name AS Publisher, Count(titles.title) AS Title_Count
FROM publication.authors
INNER JOIN publication.titleauthor
ON publication.authors.au_id=publication.titleauthor.au_id
INNER JOIN publication.titles
ON publication.titleauthor.title_id=publication.titles.title_id
INNER JOIN publication.publishers
ON publication.titles.pub_id= publication.publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY authors.au_id DESC;

SELECT authors.au_id AS author_ID,authors.au_lname AS Last_Name, authors.au_fname AS First_Name, qty
FROM publication.authors
INNER JOIN publication.titleauthor
ON publication.authors.au_id=publication.titleauthor.au_id
INNER JOIN publication.sales
ON publication.titleauthor.title_id=publication.sales.title_id
ORDER BY qty DESC
LIMIT 3;

SELECT authors.au_id AS author_ID,authors.au_lname AS Last_Name, authors.au_fname AS First_Name, qty
FROM publication.authors
INNER JOIN publication.titleauthor
ON publication.authors.au_id=publication.titleauthor.au_id
INNER JOIN publication.sales
ON publication.titleauthor.title_id=publication.sales.title_id
ORDER BY qty DESC
LIMIT 23;