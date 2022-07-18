
-- question 1:
USE Publications;

SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`,
		titles.title AS `TITLE` , publishers.pub_name AS `PUBLISHER`
FROM   authors
INNER JOIN titleauthor
ON  authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id;

-- question 2:
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`,
		 publishers.pub_name AS `PUBLISHER`, count(titles.title) AS `TITLE COUNT`
FROM   authors
INNER JOIN titleauthor
ON  authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname,
		 publishers.pub_name;
         
-- question 3:
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`,
		 sum(titles.ytd_sales) AS `TOTAL`
FROM   authors
INNER JOIN titleauthor
ON  authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY sum(titles.ytd_sales) DESC
LIMIT 3;

-- question 4:
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`,
		 IFNULL(sum(titles.ytd_sales),0) AS `TOTAL`
FROM   authors
LEFT JOIN titleauthor
ON  authors.au_id=titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY sum(titles.ytd_sales) DESC
LIMIT 23;
