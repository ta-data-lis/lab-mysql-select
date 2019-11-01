
# CHALLENGE 1

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM publishers INNER JOIN titles
ON titles.pub_id = publishers.pub_id
INNER JOIN titleauthor
ON titleauthor.title_id = titles.title_id
INNER JOIN AUTHORS 
ON titleauthor.au_id=authors.au_id;

# CHALLENGE 2

SELECT authors.au_id AS "Author ID", authors.au_lname AS "Author Last Name", 
authors.au_fname AS "Author First Name", publishers.pub_name AS "Publisher", COUNT(publishers.pub_id)  AS "Total"
FROM AUTHORS INNER JOIN titleauthor
ON titleauthor.au_id=authors.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON titles.pub_id=publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;

# CHALLENGE 3
/* Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author */

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", COUNT(sales.title_id) AS "TOTAL"
FROM titles INNER JOIN titleauthor
ON titleauthor.title_id = titles.title_id
INNER JOIN AUTHORS 
ON titleauthor.au_id=authors.au_id
INNER JOIN sales
ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY COUNT(sales.title_id) DESC
LIMIT 3;

# CHALLENGE 4
/* Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low.*/

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", COUNT(sales.title_id) AS "TOTAL"
FROM titles INNER JOIN titleauthor
ON titleauthor.title_id = titles.title_id
INNER JOIN AUTHORS 
ON titleauthor.au_id=authors.au_id
INNER JOIN sales
ON sales.title_id=titles.title_id
#WHERE TOTAL >= 0
GROUP BY authors.au_id
ORDER BY COUNT(sales.title_id) DESC;



