/* Challenge 1 - Who Have Published What At Where?  */
/* Figure out what titles each author has published at which publishers. Your output should have at least the following columns:
 `AUTHOR ID` - the ID of the author
 `LAST NAME` - author last name
 `FIRST NAME` - author first name
 `TITLE` - name of the published title
 `PUBLISHER` - name of the publisher where the title was published */
  
SELECT authors.au_id AS "AUTHOR ID",authors.au_lname AS "AUTHOR LAST NAME" , authors.au_fname AS "AUTHOR FIRST NAME", titles.title "TITLE", publishers.pub_name as PUBLISHER
FROM labs_mysql_select.titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id
ORDER BY 'AUTHOR ID';

/* Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. */

SELECT authors.au_id AS "AUTHOR ID",authors.au_lname AS "AUTHOR LAST NAME" , authors.au_fname AS "AUTHOR FIRST NAME", publishers.pub_name AS PUBLISHER, count(titles.title) AS "TITLE COUNT"
FROM labs_mysql_select.titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id
GROUP BY publishers.pub_name, authors.au_id
ORDER BY count(titles.title) DESC, "AUTHORS FIRST NAME";

/* Challenge 3 - Best Selling Authors 
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors. */

SELECT authors.au_id AS "AUTHOR ID",authors.au_lname AS "AUTHOR LAST NAME" , authors.au_fname AS "AUTHOR FIRST NAME", sum(sales.qty) AS "TOTAL"
FROM labs_mysql_select.authors
INNER JOIN titleauthor on authors.au_id = titleauthor.au_id
INNER JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC, "AUTHORS FIRST NAME"
LIMIT 3;

/*Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low. */

SELECT authors.au_id AS "AUTHOR ID",authors.au_lname AS "AUTHOR LAST NAME" , authors.au_fname AS "AUTHOR FIRST NAME", sum(sales.qty) AS "TOTAL"
FROM labs_mysql_select.authors
INNER JOIN titleauthor on authors.au_id = titleauthor.au_id
INNER JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC, "AUTHORS FIRST NAME"

#How can i add authors who sold zero books?