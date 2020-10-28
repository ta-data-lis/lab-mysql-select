/* CHALLENGE 1 */
/* join various tables to figure out what titles each author has published at which publishers. */
/* output should have at least the following columns:
   - AUTHOR ID: ID of author
   - LAST NAME: author last name
   - FIRST NAME: author first name
   - TITLE: name of the published title
   - PUBLISHER: name of the publisher where the title was published */
   
SELECT authors.au_id AS Author_ID, authors.au_fname AS First_name, authors.au_lname AS Last_name, titles.title AS Title, publishers.pub_name AS Publisher
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id 
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
ORDER BY authors.au_id; 







/* CHALLENGE 2 */
/* Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 
Your output should look something like below:
   - Author ID
   - First Name
   - Last Name
   - Publisher
   - Title Count
To check if the output is correct, sum the `TITLE COUNT` column 
(sum should be the same as the total nº of records in Table `titleauthor`) */
   
SELECT * FROM publications.authors;
SELECT * FROM publications.publishers;
SELECT * FROM publications.titleauthor;
SELECT * FROM publications.titles;
   

SELECT authors.au_id, authors.au_fname, authors.au_lname, publishers.pub_name, titles.title_id, count(titles.title)
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id 
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY authors.au_id DESC;  




/* CHALLENGE 3 */
/* Who are the top 3 authors who have sold the highest number of titles?
Requirements: output should have the columns:
   - AUTHOR ID - ID of the author
   - LAST NAME - author last name
   - FIRST NAME - author first name
   - TOTAL - total nº of titles sold from this author
Your output should be ordered based on `TOTAL` from high to low
Only output the top 3 best selling authors */

SELECT * FROM authors;
SELECT * FROM titles;
SELECT * FROM sales;
SELECT * FROM titleauthor;

SELECT authors.au_id, authors.au_fname, authors.au_lname, titleauthor.title_id, SUM(sales.qty) AS TOTAL_SALES 
FROM sales
INNER JOIN titleauthor
ON sales.title_id = titleauthor.title_id
INNER JOIN authors
ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id, titleauthor.title_id
ORDER BY TOTAL_SALES DESC
LIMIT 3; 





/* CHALLENGE 4 */
/* modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
The authors who have sold 0 titles should also appear in your output (display `0` instead of `NULL` as the `TOTAL`).
Also order your results based on `TOTAL` from high to low */

SELECT authors.au_id, authors.au_fname, authors.au_lname, titleauthor.title_id, SUM(sales.qty) AS TOTAL_SALES 
FROM sales
INNER JOIN titleauthor
ON sales.title_id = titleauthor.title_id
INNER JOIN authors
ON titleauthor.au_id = authors.au_id
GROUP BY titleauthor.title_id, authors.au_id 
ORDER BY TOTAL_SALES DESC
LIMIT 23; 


