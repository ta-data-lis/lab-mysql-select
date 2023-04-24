/*## Challenge 1 - Who Have Published What At Where?

In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out
 what titles each author has published at which publishers.
 Your output should have at least the following columns:

* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
* `TITLE` - name of the published title
* `PUBLISHER` - name of the publisher where the title was published

Your output will look something like below:

![Challenge 1 output](./images/challenge-1.png)

*Note: the screenshot above is not the complete output.*

If your query is correct, the total rows in your output should be the same as
 the total number of records in Table `titleauthor`. */
 
SELECT titleauthor.au_id AS ID, authors.au_lname AS LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name AS PUBLISHER
FROM titles
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN authors
ON titleauthor.au_id = authors.au_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;


/*
[Challenge 2 output](./images/challenge-2.png)

*Note: the screenshot above is not the complete output.*

To check if your output is correct, sum up the `TITLE COUNT` column. 
The sum number should be the same as the total number of records in Table
 `titleauthor`.

*Hint: In order to count the number of titles published by an author,
 you need to use [MySQL COUNT](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html).
 Also check out [MySQL Group By](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html) 
 because you will count the rows of different groups of data. Refer to the references and learn by yourself.
 These features will be formally discussed in the Temp Tables and Subqueries lesson.*
*/
SELECT titleauthor.au_id AS ID, authors.au_lname AS LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name AS PUBLISHER, titles.cont
FROM titles
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN authors
ON titleauthor.au_id = authors.au_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;      


## adding a new column to titles table with name count
ALTER TABLE titles ADD cont integer;

#PROTECTION OF UPDATES
SET SQL_SAFE_UPDATES = 0;

#UPDATE OF VALUE NULL TO 1 IN COLUMN 'CONT'

####################WORK IN PROGRESS#################################            
UPDATE titles SET cont = 1 where titles.title='';


