	#Challenge 1

SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', titles.title AS 'TItle', publishers.pub_name AS 'Publisher' 
	FROM authors
INNER JOIN titleauthor	
ON	authors.au_id = titleauthor.au_id 
INNER JOIN titles
ON titleauthor.title_id = titles.title_id 
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id 
ORDER BY authors.au_lname, authors.au_fname
;



	#Challenge 2


SELECT authors.au_id AS 'Author ID',
authors.au_lname AS 'Last Name',
authors.au_fname AS 'First Name',
publishers.pub_name AS 'Publisher', COUNT(titles.title) 
	FROM authors
INNER JOIN titleauthor	
ON	authors.au_id = titleauthor.au_id 

INNER JOIN titles
ON titles.title_id = titleauthor.title_id

INNER JOIN publishers
ON publishers.pub_id = titles.pub_id 

GROUP BY 1,2,3,4
ORDER BY authors.au_lname, authors.au_fname
;



	#Challenge 3


SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', SUM(sales.qty) AS 'Titles Sold'
	FROM authors
INNER JOIN titleauthor	
ON	authors.au_id = titleauthor.au_id
INNER JOIN sales
ON sales.title_id = titleauthor.title_id 
GROUP BY authors.au_id 
ORDER BY SUM(sales.qty) DESC
LIMIT 3;



	#Challenge 4

SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', SUM(sales.qty) AS 'Sold Titles'
	FROM authors
LEFT JOIN titleauthor	
ON	authors.au_id = titleauthor.au_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id 
GROUP BY authors.au_id 
ORDER BY SUM(sales.qty) DESC
;

