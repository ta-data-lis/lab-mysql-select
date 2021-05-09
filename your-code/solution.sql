/*Lab | MySQL Select*/
/* Challenge 1 - Who Have Published What At Where?  */
/* Figure out what titles each author has published at which publishers. Your output should have at least the following columns:
 `AUTHOR ID` - the ID of the author
 `LAST NAME` - author last name
 `FIRST NAME` - author first name
 `TITLE` - name of the published title
 `PUBLISHER` - name of the publisher where the title was published
  25 rows     */

/*Selecting from table authors th author id, author last name and author first name */
SELECT au_id,au_lname,au_fname
FROM lab2.authors;

/*Add Title id from title author table */
SELECT lab2.authors.au_id,lab2.authors.au_lname,lab2.authors.au_fname, lab2.titleauthor.title_id
FROM lab2.authors
INNER JOIN lab2.titleauthor
ON lab2.authors.au_id = lab2.titleauthor.au_id;

/*Add title and pub_id from titles*/
SELECT lab2.author_title.au_id,lab2.author_title.au_lname,lab2.author_title.au_fname, lab2.titles.title,lab2.titles.pub_id
FROM lab2.titles
INNER JOIN (SELECT lab2.authors.au_id,lab2.authors.au_lname,lab2.authors.au_fname, lab2.titleauthor.title_id
FROM lab2.authors
INNER JOIN lab2.titleauthor
ON lab2.authors.au_id = lab2.titleauthor.au_id) AS author_title 
ON lab2.author_title.title_id = lab2.titles.title_id;

/*Add publisher name*/
SELECT lab2.author_title_pubid.au_id,lab2.author_title_pubid.au_lname,lab2.author_title_pubid.au_fname,lab2.author_title_pubid.title,lab2.publishers.pub_name
FROM lab2.publishers
INNER JOIN (SELECT lab2.author_title.au_id,lab2.author_title.au_lname,lab2.author_title.au_fname, lab2.titles.title,lab2.titles.pub_id
FROM lab2.titles
INNER JOIN (SELECT lab2.authors.au_id,lab2.authors.au_lname,lab2.authors.au_fname, lab2.titleauthor.title_id
FROM lab2.authors
INNER JOIN lab2.titleauthor
ON lab2.authors.au_id = lab2.titleauthor.au_id) AS author_title 
ON lab2.author_title.title_id = lab2.titles.title_id) AS author_title_pubid
ON lab2.author_title_pubid.pub_id = lab2.publishers.pub_id;


/* Challenge 2 - Who Have Published How Many At Where? */
/* Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number of records in Table `titleauthor`.*/

/*Create temporary table with the results from challenge1*/
CREATE TEMPORARY TABLE lab2.challenge1
SELECT lab2.author_title_pubid.au_id,lab2.author_title_pubid.au_lname,lab2.author_title_pubid.au_fname,lab2.author_title_pubid.title,lab2.publishers.pub_name
FROM lab2.publishers
INNER JOIN (SELECT lab2.author_title.au_id,lab2.author_title.au_lname,lab2.author_title.au_fname, lab2.titles.title,lab2.titles.pub_id
FROM lab2.titles
INNER JOIN (SELECT lab2.authors.au_id,lab2.authors.au_lname,lab2.authors.au_fname, lab2.titleauthor.title_id
FROM lab2.authors
INNER JOIN lab2.titleauthor
ON lab2.authors.au_id = lab2.titleauthor.au_id) AS author_title 
ON lab2.author_title.title_id = lab2.titles.title_id) AS author_title_pubid
ON lab2.author_title_pubid.pub_id = lab2.publishers.pub_id;

/*Titles published by each author in each publisher*/
CREATE TEMPORARY TABLE lab2.challenge2
SELECT au_id, au_lname, au_fname,pub_name,COUNT(title) AS title_count
FROM lab2.challenge1
GROUP BY au_id, pub_name
ORDER BY au_id DESC;

/*Check the solution*/
SELECT SUM(title_count)
FROM lab2.challenge2;


/* Challenge 3 - Best Selling Authors */
/* Who are the top 3 authors who have sold the highest number of titles? Your output should be ordered based on `TOTAL` from high to low. Only output the top 3 best selling authors.
`AUTHOR ID` - the ID of the author
`LAST NAME` - author last name
`FIRST NAME` - author first name
`TOTAL` - total number of titles sold from this author */

/*Selecting from table authors the author id, author last name and author first name */
SELECT au_id,au_lname,au_fname
FROM lab2.authors;

/*Add Title id from title author table */
/*Inner join removes authors without titles published */
CREATE TEMPORARY TABLE lab2.author_and_titles
SELECT lab2.authors.au_id,lab2.authors.au_lname,lab2.authors.au_fname, lab2.titleauthor.title_id
FROM lab2.authors
INNER JOIN lab2.titleauthor
ON lab2.authors.au_id = lab2.titleauthor.au_id;

/*Highest number of titles*/ 
SELECT au_id, au_lname, au_fname,COUNT(title_id) AS Total
FROM lab2.author_and_titles
GROUP BY au_id
ORDER BY Total DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking */ 
/* output will display all 23 authors instead of the top 3. authors who have sold 0 titles should also appear in your output. ideally display `0` instead of `NULL` as the `TOTAL`
Also order your results based on `TOTAL` from high to low.*/

/* LEFT JOIN gives all authors even without titles published */
CREATE TEMPORARY TABLE lab2.author_and_titles_complete
SELECT lab2.authors.au_id,lab2.authors.au_lname,lab2.authors.au_fname, lab2.titleauthor.title_id
FROM lab2.authors
LEFT JOIN lab2.titleauthor
ON lab2.authors.au_id = lab2.titleauthor.au_id;

/*List of authors by total titles published */
SELECT au_id, au_lname, au_fname,COUNT(title_id) AS Total_titles
FROM lab2.author_and_titles_complete
GROUP BY au_id
ORDER BY Total_titles DESC;
