-- 1
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id
INNER JOIN publications.titleauthor
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.authors
ON publications.authors.au_id = publications.titleauthor.au_id;

SELECT COUNT(au_id)
FROM publications.titleauthor;

SELECT COUNT(authors.au_id)
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id
INNER JOIN publications.titleauthor
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.authors
ON publications.authors.au_id = publications.titleauthor.au_id;

-- 2
SELECT DISTINCT authors.au_id, authors.au_fname, authors.au_lname, publishers.pub_name, COUNT(titles.title_id)
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id
INNER JOIN publications.titleauthor
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.authors
ON publications.authors.au_id = publications.titleauthor.au_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY authors.au_fname ASC, authors.au_lname ASC;

-- 3
SELECT DISTINCT authors.au_id, authors.au_fname, authors.au_lname, sum(sales.qty) AS TOTAL
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titleauthor.title_id = publications.titles.title_id
INNER JOIN publications.sales
ON publications.titles.title_id = publications.sales.title_id
GROUP BY authors.au_fname, authors.au_lname
ORDER BY TOTAL DESC
LIMIT 3;

-- 4
SELECT authors.au_id, authors.au_fname, authors.au_lname, IFNULL(SUM(sales.qty),0) AS TOTAL
FROM publications.authors
LEFT JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
LEFT JOIN publications.titles
ON publications.titleauthor.title_id = publications.titles.title_id
LEFT JOIN publications.sales
ON publications.titles.title_id = publications.sales.title_id
GROUP BY authors.au_fname, authors.au_lname
ORDER BY TOTAL DESC;