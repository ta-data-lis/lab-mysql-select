-- Each table authors - titleauthor - titles - publishers 

SELECT  au_id as `AUTHOR ID`, au_lname as `LAST NAME`, au_fname as `FIRST NAME`
FROM publications.authors;

SELECT  au_id as `AUTHOR ID`, title_id as `TITLE ID`
FROM publications.titleauthor;

SELECT  title_id as `TITLE ID`, title as `TITLE`, pub_id as `PUB ID`
FROM publications.titles;

SELECT  pub_id as `PUB ID`, pub_name as `PUBLISHER`
FROM publications.publishers;

-- Challenge 1 - Who Have Published What At Where? /*25 ROWS*/
SELECT DISTINCT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, 
authors.au_fname as `FIRST NAME`, titles.title as `TITLE`, 
publishers.pub_name as `PUBLISHER`, publishers.city AS `CITY`
FROM publications.titles
INNER JOIN publications.titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id
INNER JOIN publications.authors ON authors.au_id = titleauthor.au_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, 
authors.au_fname as `FIRST NAME`, publishers.pub_name as `PUBLISHER`, COUNT(titles.title_id) as `TTL TITLES`
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id
INNER JOIN publications.titleauthor
ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.authors
ON publications.authors.au_id = publications.titleauthor.au_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY COUNT(titles.title_id) DESC, authors.au_fname ASC;

-- Challenge 3 - Best Selling Authors
SELECT DISTINCT authors.au_id as `AUTHOR ID`, authors.au_fname as `FIRST NAME`, authors.au_lname as `LAST NAME`, sum(sales.qty) AS TOTAL
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

-- Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id as `AUTHOR ID`, authors.au_fname as `FIRST NAME`, authors.au_lname as `LAST NAME`,
IFNULL(SUM(sales.qty),0) AS TOTAL
FROM publications.authors
LEFT JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
LEFT JOIN publications.titles
ON publications.titleauthor.title_id = publications.titles.title_id
LEFT JOIN publications.sales
ON publications.titles.title_id = publications.sales.title_id
GROUP BY authors.au_fname, authors.au_lname
ORDER BY TOTAL DESC;

