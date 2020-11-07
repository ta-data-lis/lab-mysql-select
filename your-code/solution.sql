-- Challenge 1

SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', titles.title as 'TITLE',publishers.pub_name as 'PUBLISHER'
FROM publications.authors authors
INNER JOIN publications.titleauthor titleauthor ON titleauthor.au_id = authors.au_id
INNER JOIN publications.titles titles ON titles.title_id = titleauthor.title_id
INNER JOIN publications.publishers publishers ON publishers.pub_id = titles.pub_id;

-- Challenge 2

SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME',publishers.pub_name as 'PUBLISHER',COUNT(DISTINCT (titles.title)) as 'TITLE COUNT'
FROM publications.authors authors
INNER JOIN publications.titleauthor titleauthor ON titleauthor.au_id = authors.au_id
INNER JOIN publications.titles titles ON titles.title_id = titleauthor.title_id
INNER JOIN publications.publishers publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id,au_lname,au_fname,publishers.pub_name;

-- Challenge 3

SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', SUM(sales.qty) as 'TOTAL'
FROM publications.authors authors
LEFT JOIN publications.titleauthor titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN publications.sales sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id,au_lname,au_fname
ORDER BY 4 DESC
LIMIT 3;

-- Challenge 4

SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', IFNULL(SUM(sales.qty),0) as 'TOTAL'
FROM publications.authors authors
LEFT JOIN publications.titleauthor titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN publications.sales sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id,au_lname,au_fname
ORDER BY 4 DESC;

