# Challenge 1
SELECT
	authors.au_id as "AUTHOR ID",
	authors.au_lname as "LAST NAME",
	authors.au_fname as "FIRST NAME",
	titles.title as "TITLE",
    publishers.pub_name as "PUBLISHER"
    
FROM authors INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
	INNER JOIN titles ON titleauthor.title_id = titles.title_id
	INNER JOIN publishers ON titles.pub_id = publishers.pub_id

ORDER BY authors.au_id;


# Challenge 2
SELECT
	authors.au_id as "AUTHOR ID",
	authors.au_lname as "LAST NAME",
	authors.au_fname as "FIRST NAME",
	publishers.pub_name as "PUBLISHER",
	COUNT(titles.title) as "TITLE COUNT"

FROM authors INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
	INNER JOIN titles ON titleauthor.title_id = titles.title_id
	INNER JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_name

ORDER BY COUNT(titles.title) DESC;

# Challenge 3
SELECT
	authors.au_id as "AUTHOR ID", 
	authors.au_lname as "LAST NAME", 
	authors.au_fname as "FIRST NAME", 
	SUM(titles.ytd_sales) as "TOTAL"

FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
	INNER JOIN titles ON titleauthor.title_id=titles.title_id

GROUP BY authors.au_id

ORDER BY SUM(titles.ytd_sales) DESC

LIMIT 3;

# Challenge 4

SELECT
	authors.au_id as "AUTHOR ID",
	authors.au_lname as "LAST NAME",
	authors.au_fname as "FIRST NAME",
	SUM(titles.ytd_sales) as "TOTAL"

FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
	INNER JOIN titles ON titleauthor.title_id=titles.title_id

GROUP BY authors.au_id

ORDER BY SUM(titles.ytd_sales) DESC;