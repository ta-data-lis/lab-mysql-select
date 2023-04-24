/* Challenge 1 - Who Have Published What At Where? */ 

SELECT 	authors.au_id AS 'AUTHOR ID',
		authors.au_lname AS 'LAST NAME',
        authors.au_fname AS 'FIRST NAME',
		title AS 'TITLE', 
        pub_name AS 'PUBLISHER'
FROM authors
INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
    INNER JOIN titles
		ON titleauthor.title_id = titles.title_id
        INNER JOIN publishers
			ON titles.pub_id = publishers.pub_id;
            
## Challenge 2 - Who Have Published How Many At Where?

SELECT 	authors.au_id AS 'AUTHOR ID',
		authors.au_lname AS 'LAST NAME',
        authors.au_fname AS 'FIRST NAME',
        publishers.pub_name AS 'PUBLISHER',
        COUNT(titles.title) AS 'TITLE COUNT'
FROM authors
INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
    INNER JOIN titles
		ON titleauthor.title_id = titles.title_id
        INNER JOIN publishers
			ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY COUNT(titles.title) DESC;


 ## Challenge 3 - Best Selling Authors
 
 SELECT authors.au_id AS 'AUTHOR ID',
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
    SUM(sales.qty) AS  'TOTAL'
FROM authors
INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
    INNER JOIN titles
		ON titleauthor.title_id = titles.title_id
        INNER JOIN sales
			ON sales.title_id = titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC
LIMIT 3;



## Challenge 4 - Best Selling Authors Ranking
# to get all the authors in the list left join instead of inner join is used and coalesce function in used to view the null value as 0. 
 
 SELECT authors.au_id AS 'AUTHOR ID',
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
    COALESCE(SUM(sales.qty), 0) AS  'TOTAL'
FROM authors
LEFT JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
    LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
        LEFT JOIN sales
			ON sales.title_id = titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY COALESCE(SUM(sales.qty), 0) DESC;


