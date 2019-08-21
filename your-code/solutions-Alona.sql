SELECT * FROM publications.authors, publications.publishers, publications.titles;

#Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id AS AuthorID, authors.au_fname AS Name, authors.au_lname AS Surname,
titles.title_id AS BookID, titles.title AS Title, publishers.pub_name AS `Name of publisher`,
titles.price AS Price, DATE(titles.pubdate) AS `Date of publish`
FROM titles
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id;

#Challenge 2 - Who Have Published How Many At Where?
SELECT authors.au_id AS AuthorID, authors.au_fname AS Name, authors.au_lname AS Surname,
COUNT(titles.title) AS `Title count`, publishers.pub_name AS `Name of publisher`
FROM titles
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_id, authors.au_id;

#Challenge 3 - Best Selling Authors
SELECT authors.au_id AS AuthorID, authors.au_fname AS Name, authors.au_lname AS Surname,
COUNT(sales.title_id) AS Total 
FROM titles
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id
INNER JOIN sales ON sales.title_id = titles.title_id
GROUP BY authors.au_id 
ORDER BY Total DESC
LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id AS AuthorID, authors.au_fname AS Name, authors.au_lname AS Surname,
IFNULL(SUM(sales.title_id), 0) AS Total 
#sales.title_id AS Total
FROM titles
INNER JOIN sales ON sales.title_id = titles.title_id
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
RIGHT JOIN authors ON authors.au_id = titleauthor.au_id
#GROUP BY AuthorID, Total 
GROUP BY AuthorID
ORDER BY Total DESC;

