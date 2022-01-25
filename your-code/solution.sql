/* CHALLENGE 1: In this challenge you will write a MySQL SELECT query that joins various tables to figure out
 what titles each author has published at which publishers. 
 Your output should have at least the following columns:

- AUTHOR ID - the ID of the author
- LAST NAME - author last name
- FIRST NAME - author first name
- TITLE - name of the published title
- PUBLISHER - name of the publisher where the title was published */

SELECT au_lname, au_fname FROM publications.authors;
SELECT title FROM publications.titles;
SELECT au_id,title_id FROM publications.titleauthor;
SELECT pub_name FROM publications.publishers;


SELECT titleauthor.au_id, authors.au_lname,authors.au_fname ,titles.title AS book_title,publishers.pub_name AS publisher FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN  publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON publishers.pub_id = titles.pub_id;


/* CHALLENGE 2: Elevating from your solution in Challenge 1, query 
how many titles each author has published at each publisher. */
SELECT titleauthor.au_id, authors.au_lname,authors.au_fname,publishers.pub_name,COUNT(titles.title) FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN  publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON publishers.pub_id = titles.pub_id 
GROUP BY titleauthor.au_id, authors.au_lname,authors.au_fname,publishers.pub_name
ORDER BY authors.au_fname ASC;

/* Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
Requirements --> Your output should have the following columns:
	AUTHOR ID - the ID of the author
	LAST NAME - author last name
	FIRST NAME - author first name
	TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.*/

SELECT titleauthor.au_id, authors.au_lname,authors.au_fname, SUM(sales.qty) AS total FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN  publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.sales
ON sales.title_id = titles.title_id 
GROUP BY titleauthor.au_id, authors.au_lname,authors.au_fname
ORDER BY total DESC LIMIT 3;
/* Anne Ringer -75
	Albert Ringer - 75
	Ann Dull - 50*/

/* CHALLENGE4: Now modify your solution in Challenge 3 so that the output will display all 23 authors 
instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output 
(ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low. */
SELECT titleauthor.au_id, authors.au_lname,authors.au_fname, IFNULL(SUM(sales.qty), 0) AS total  FROM publications.authors
LEFT JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
LEFT JOIN  publications.titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publications.sales
ON publications.titleauthor.title_id = publications.sales.title_id
GROUP BY titleauthor.au_id, authors.au_lname,authors.au_fname
ORDER BY total DESC;
