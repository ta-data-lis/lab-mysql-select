## Challenge 1 - Who Have Published What At Where?

##In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out what titles each author has published at which publishers. 

# Practising with the separate tables:
SELECT publishers.pub_id, pub_name, titles.pub_id
FROM publications.titles titles
INNER JOIN publications.publishers publishers
ON publishers.pub_id = titles.pub_id;

SELECT titleauthor.au_id, titleauthor.title_id, titles.title, titles.pub_id
FROM publications.titleauthor titleauthor
INNER JOIN publications.titles titles
ON titleauthor.title_id = titles.title_id;

SELECT authors.au_id, authors.au_fname, authors.au_lname, titleauthor.title_id
FROM publications.authors authors
INNER JOIN publications.titleauthor titleauthor 
ON authors.au_id = titleauthor.au_id;

# The final query:
SELECT authors.au_id, authors.au_fname, authors.au_lname, titleauthor.title_id, titles.title, titles.pub_id, pub_name
FROM publications.authors authors
INNER JOIN publications.titleauthor titleauthor 
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers publishers
ON publishers.pub_id = titles.pub_id;

## Challenge 2 - Who Have Published How Many At Where?
#Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:

SELECT authors.au_id, authors.au_fname, authors.au_lname, COUNT(titles.title) AS Total, pub_name
FROM publications.authors authors
INNER JOIN publications.titleauthor titleauthor 
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_fname, authors.au_lname, authors.au_id, pub_name;

#To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number of records in Table `titleauthor`.
# Total in the Title Count column and total in the total number of records in Table "titleauthor" are the same: 25

## Challenge 3 - Best Selling Authors

#Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

SELECT authors.au_id, authors.au_fname AS "First Name", authors.au_lname AS "Last Name", SUM(ytd_sales) AS "Total"
FROM publications.titles titles
INNER JOIN publications.titleauthor titleauthor 
ON titles.title_id = titleauthor.title_id
INNER JOIN publications.authors authors 
ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_fname, authors.au_lname, authors.au_id
ORDER BY SUM(ytd_sales) DESC LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

#Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles 
#should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). Also order your results based on `TOTAL` from high to low.
SELECT authors.au_id, authors.au_fname AS "First Name", authors.au_lname AS "Last Name", SUM(ytd_sales) AS "Total"
FROM publications.titles titles
RIGHT JOIN publications.titleauthor titleauthor 
ON titles.title_id = titleauthor.title_id
RIGHT JOIN publications.authors authors 
ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_fname, authors.au_lname, authors.au_id
ORDER BY SUM(ytd_sales) DESC;

# In order to change the value, I would have to add the 
# SET SUM(ytd_sales) = "0"
# WHERE SUM(ytd_sales) = NULL;
# However, this didn´t work when I added it to the query.

