/* Challenge 1 - Who Have Published What At Where? 
In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
* `TITLE` - name of the published title
* `PUBLISHER` - name of the publisher where the title was published

Your output will look something like below:

![Challenge 1 output](./images/challenge-1.png)

*Note: the screenshot above is not the complete output.*

If your query is correct, the total rows in your output should be the same as the total number of records in Table `titleauthor`.
*/

SELECT A.au_id, A.au_lname, A.au_fname, T.title, P.pub_name
FROM ironhack.authors AS A 
INNER JOIN ironhack.titleauthor AT ON AT.au_id = A.au_id
INNER JOIN ironhack.titles T ON T.title_id = AT.title_id
INNER JOIN ironhack.publishers P ON P.pub_id = T.pub_ID;

/* Challenge 2 - Who Have Published How Many At Where?

Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:

![Challenge 2 output](./images/challenge-2.png)

*Note: the screenshot above is not the complete output.*

To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number of records in Table `titleauthor`.

*Hint: In order to count the number of titles published by an author, you need to use [MySQL COUNT](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html). Also check out [MySQL Group By](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html) because you will count the rows of different groups of data. Refer to the references and learn by yourself. These features will be formally discussed in the Temp Tables and Subqueries lesson.*
*/

SELECT A.au_id, A.au_lname, A.au_fname, P.pub_name, COUNT(T.title)
FROM ironhack.authors AS A 
INNER JOIN ironhack.titleauthor AT ON AT.au_id = A.au_id
INNER JOIN ironhack.titles T ON T.title_id = AT.title_id
INNER JOIN ironhack.publishers P ON P.pub_id = T.pub_ID
GROUP BY A.au_id, A.au_lname, A.au_fname, P.pub_name
ORDER BY A.au_id, P.pub_name;

/* Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

* Your output should have the following columns:
	* `AUTHOR ID` - the ID of the author
	* `LAST NAME` - author last name
	* `FIRST NAME` - author first name
	* `TOTAL` - total number of titles sold from this author
* Your output should be ordered based on `TOTAL` from high to low.
* Only output the top 3 best selling authors.
*/

SELECT A.au_id, A.au_lname, A.au_fname, SUM(T.ytd_sales) AS total
FROM ironhack.authors AS A 
INNER JOIN ironhack.titleauthor AT ON AT.au_id = A.au_id
INNER JOIN ironhack.titles T ON T.title_id = AT.title_id
GROUP BY A.au_id, A.au_lname, A.au_fname
ORDER BY total DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking

Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). Also order your results based on `TOTAL` from high to low.
*/

SELECT A.au_id, A.au_lname, A.au_fname, COALESCE(SUM(T.ytd_sales),0) AS total
FROM ironhack.authors AS A 
LEFT JOIN ironhack.titleauthor AT ON AT.au_id = A.au_id
LEFT JOIN ironhack.titles T ON T.title_id = AT.title_id
GROUP BY A.au_id, A.au_lname, A.au_fname
ORDER BY total DESC;
