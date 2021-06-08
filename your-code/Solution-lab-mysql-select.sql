USE publication;
/*Solutions 
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published*/


SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', titles.title AS 'Title', publishers.pub_name AS 'Publisher'
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id ASC;

SELECT COUNT(*)
FROM authors;

SELECT COUNT(*)
FROM titleauthor;


#CHALLENGE 2

SELECT authors.au_id AS 'Author ID', authors.au_lname AS "Last Name" , authors.au_fname AS 'First Name', publishers.pub_name AS 'Publisher', COUNT(titles.title) AS 'TITLE COUNT'
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY COUNT(titles.title) DESC;


#CHALLENGE 3
SELECT authors.au_id AS 'Author ID', authors.au_lname AS last_name, authors.au_fname AS 'First Name', SUM(sales.qty) AS total
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

#doubt : same thing desc and asc


#CHALLENGE 4
SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', SUM(coalesce(sales.qty,0)) AS TOTAL
FROM authors
CROSS JOIN titleauthor ON authors.au_id = titleauthor.au_id
CROSS JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(coalesce(sales.qty,0)) DESC;

#error in desc
# how to do this? Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.

SELECT * FROM sales
#they all sold 



