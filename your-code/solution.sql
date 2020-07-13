/* Challenge 1 - Who Have Published What At Where?
AUTHOR ID - the ID of the author  -- primary key
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published */
SELECT authors.au_id as 'AUTHOR ID' , authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',
titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id;

/* Challenge 2 - Who Have Published How Many At Where?	
AUTHOR ID - the ID of the author  -- primary key
LAST NAME - author last name
FIRST NAME - author first name
PUBLISHER - name of the publisher where the title was published
TITLE COUNT - name of the published title */
SELECT authors.au_id as 'AUTHOR ID' , authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',
titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER', COUNT(titles.title) as 'TITLE COUNT'
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id;
GROUP BY publishers.pub_id, authors.au_id;

/* Challenge 3 - Best Selling Authors
Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors. */

CREATE DATABASE IF NOT EXISTS
SELECT authors.au_id as 'AUTHOR ID' , authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',
titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER', sum(sales.qty) as 'TOTAL'
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id;
ORDER BY TOTAL DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors
Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors. */

CREATE DATABASE IF NOT EXISTS publications
SELECT authors.au_id as 'AUTHOR ID' , authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',
titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER', COUNT(titles.title) as 'TITLE COUNT'
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id;
GROUP BY publishers.pub_id, authors.au_id;
ORDER BY TITLE COUNT DESC
LIMIT 23;
