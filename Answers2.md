#Answers LUCIE FLEURY

# Lab | MySQL Select

## Introduction

In this lab you will practice how to use the MySQL `SELECT` statement which will be extremely useful in your future work as a data analyst/scientist/engineer. **You will use the `publications` database**. You can find it in "Your code" folder. **If you have any trouble importing it to Workbench/Sequel Pro, select latin1 encoding**

You will create a `solutions.sql` file in the `your-code` directory to record your solutions to all challenges.

## Challenge 1 - Who Have Published What At Where?

In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
* `TITLE` - name of the published title
* `PUBLISHER` - name of the publisher where the title was published

Answer :
SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, publishers.pub_name 
FROM authors
JOIN titleauthor
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN publishers
ON publishers.pub_id = titles.pub_id;




If your query is correct, the total rows in your output should be the same as the total number of records in Table `titleauthor`. #25 rows returned

## Challenge 2 - Who Have Published How Many At Where?

Query how many titles each author has published at each publisher. Your output should look something like below:
 
SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, publishers.pub_name,count(titles.title) AS Title_count
FROM authors
JOIN titleauthor
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY title
ORDER BY Last_name ASC;
 


To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number of records in Table `titleauthor`.



*Hint: In order to count the number of titles published by an author, you need to use [MySQL COUNT](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html). Also check out [MySQL Group By](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html) because you will count the rows of different groups of data. Refer to the references and learn by yourself. These features will be formally discussed in the Temp Tables and Subqueries lesson.*

## Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

* Your output should have the following columns:
	* `AUTHOR ID` - the ID of the author
	* `LAST NAME` - author last name
	* `FIRST NAME` - author first name
	* `TOTAL` - total number of titles sold from this author
* Your output should be ordered based on `TOTAL` from high to low.
* Only output the top 3 best selling authors.

SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, sum(sales.qty)as quantity
FROM authors
JOIN titleauthor
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY title
ORDER BY quantity DESC
LIMIT 3;



## Challenge 4 - Best Selling Authors Ranking

Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). Also order your results based on `TOTAL` from high to low.

SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, sales.qty
FROM authors
JOIN titleauthor
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id;

###TO FINISH






## Deliverables

* `solution.sql` that contains all your MySQL queries.

## Submission

* Add `solutions.sql` to git.
* Commit your code.
* Push to your fork.
* Create a pull request to the class repo.

## References

[MySQL Reference: Counting Rows](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html)

[MySQL Reference: Group By](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html)

[MySQL Reference: SUM Function](https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html#function_sum)
