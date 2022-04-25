/* Challenge 1 In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

* `AUTHOR ID` - the ID of the author --> Table Author
* `LAST NAME` - author last name --> Table Author
* `FIRST NAME` - author first name --> Table Author 
* `TITLE` - name of the published title --> Table Titles (via titleauthor table to author)
* `PUBLISHER` - name of the publisher where the title was published  --> Publsiher (via Titles)
--> First go to Schema Builder to see how tables are related to each other
--> We need to connect the Author Table with the Title and Publisher Table. Author Table can be connected via Titleauthor table to Titles
Publisher and Titles have some common keys.*/

/* Join authors and titles table via junction table titleauthor on keys au_id and title_id 
Join titles and publishers table on pub_id and store it in a temporary table */


SELECT *
FROM publications.authors
JOIN publications.titleauthor
  ON authors.au_id = titleauthor.au_id
JOIN publications.titles
  ON titleauthor.title_id = titles.title_id
JOIN publications.publishers
  ON titles.pub_id = publishers.pub_id;
  

/* Challenge 2: Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher*/
SELECT Count(title), pub_name
FROM publications.authors
JOIN publications.titleauthor
  ON authors.au_id = titleauthor.au_id
JOIN publications.titles
  ON titleauthor.title_id = titles.title_id
JOIN publications.publishers
  ON titles.pub_id = publishers.pub_id
GROUP BY pub_name;

/* To check if your output is correct, sum up the `TITLE COUNT` column. 
The sum number should be the same as the total number of records in Table `titleauthor`.*/

SELECT count(title), pub_name
FROM publications.authors
JOIN publications.titleauthor
  ON authors.au_id = titleauthor.au_id
JOIN publications.titles
  ON titleauthor.title_id = titles.title_id
JOIN publications.publishers
  ON titles.pub_id = publishers.pub_id
GROUP BY pub_name; #25

SELECT COUNT(*)
FROM publications.titleauthor;   #25

/* It is the same amount of records = 25 */

/*Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.*/
SELECT authors.au_id, au_lname, au_fname, sum(sales.qty) as TOTAL
FROM publications.authors
JOIN publications.titleauthor
  ON authors.au_id = titleauthor.au_id
JOIN publications.sales
  ON titleauthor.title_id = sales.title_id
GROUP BY au_id, au_lname, au_fname
ORDER BY TOTAL DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking */

SELECT authors.au_id, au_lname, au_fname, sales.qty as TOTAL
FROM publications.authors
JOIN publications.titleauthor
  ON authors.au_id = titleauthor.au_id
JOIN publications.sales
  ON titleauthor.title_id = sales.title_id
GROUP BY au_id, au_lname, au_fname, sales.qty
ORDER BY sales.qty DESC;
/* not sure how to solve that, sorry :((*/
  