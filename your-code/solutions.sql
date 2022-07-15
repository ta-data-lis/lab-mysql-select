
-- Challenge 1

SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`,titles.title AS `TITLE`,publishers.pub_name AS `PUBLISHER`
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN publications.titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id=publications.titles.pub_id;



-- Challenge 2


SELECT RESULT.`FIRST NAME`, RESULT.`LAST NAME`,RESULT.`PUBLISHER`, count(*) AS `TITLE COUNT`
FROM (SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`,titles.title AS `TITLE`,publishers.pub_name AS `PUBLISHER`
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN publications.titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publications.publishers
ON publications.publishers.pub_id=publications.titles.pub_id) AS RESULT
GROUP BY RESULT.`FIRST NAME`, RESULT.`LAST NAME`,RESULT.`PUBLISHER`;


-- Challenge 3


SELECT RES.`AUTHOR ID`,RES.`LAST NAME`,RES.`FIRST NAME`,SUM(RES.`SALES`) AS `TOTAL SALES`
FROM (SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, sales.qty AS `SALES`
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id=publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titleauthor.title_id=publications.titles.title_id
INNER JOIN publications.sales
ON publications.titles.title_id = publications.sales.title_id
ORDER BY publications.sales.qty DESC) AS RES
GROUP BY RES.`AUTHOR ID`,RES.`LAST NAME`,RES.`FIRST NAME` 
ORDER BY `TOTAL SALES` DESC
LIMIT 3;


-- Challenge 4

SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, COALESCE (TAB.`TOTAL SALES`,0) AS `TOTAL`
FROM publications.authors
LEFT JOIN (SELECT RES.`AUTHOR ID`,RES.`LAST NAME`,RES.`FIRST NAME`,SUM(RES.`SALES`) AS `TOTAL SALES`
FROM (SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, sales.qty AS `SALES`
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id=publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titleauthor.title_id=publications.titles.title_id
INNER JOIN publications.sales
ON publications.titles.title_id = publications.sales.title_id
ORDER BY publications.sales.qty DESC) AS RES
GROUP BY RES.`AUTHOR ID`,RES.`LAST NAME`,RES.`FIRST NAME` 
ORDER BY `TOTAL SALES` DESC) AS TAB
ON publications.authors.au_id = TAB.`AUTHOR ID`
ORDER BY `TOTAL` DESC;











