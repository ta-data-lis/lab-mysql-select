-- Challenge 1 -- 

SELECT titleauthor.au_id as author_id, au_fname as first_name, au_lname as last_name, title, pub_name
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id = publications.titles.pub_id;


-- Challenge 2 -- 

SELECT titleauthor.au_id as author_id, au_fname as first_name, au_lname as last_name, pub_name, COUNT(title) as title_count
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id = publications.titles.pub_id
GROUP BY author_id, au_fname, au_lname, pub_name
ORDER BY title_count DESC;


-- Challenge 3 -- 

SELECT titleauthor.au_id as author_id, au_fname as first_name, au_lname as last_name, SUM(qty) as total
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.sales
ON publications.sales.title_id = publications.titles.title_id
GROUP BY author_id, first_name, last_name
ORDER BY total DESC
LIMIT 3;

-- Challenge 4 -- (can only find 19 authors, all of them with sales)

SELECT titleauthor.au_id as author_id, au_fname as first_name, au_lname as last_name, SUM(qty) as total
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.sales
ON publications.sales.title_id = publications.titles.title_id
GROUP BY author_id, first_name, last_name
ORDER BY total DESC
