/* 1st chalenge */

SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', title as 'TITLE', pub_name as 'PUBLISHER'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id;

/* 2st chalenge */

SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', pub_name as 'PUBLISHER', COUNT(title) as 'TITLE COUNT' 
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id , pub_name
ORDER BY `TITLE COUNT` DESC; 

/* 3st chalenge */

SELECT authors.au_id, au_lname as 'LAST NAME', au_fname as 'FIRST NAME', SUM(sales.qty) as 'TOTAL'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;
 



/* 4st chalenge */

SELECT authors.au_id, au_lname as 'LAST NAME', au_fname as 'FIRST NAME', SUM(sales.qty) as 'TOTAL'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
