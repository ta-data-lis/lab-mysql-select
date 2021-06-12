-- ## Challenge 1 - Who Have Published What At Where?

-- In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out what titles each author
-- has published at which publishers. Your output should have at least the following columns:

-- * `AUTHOR ID` - the ID of the author
-- * `LAST NAME` - author last name
-- * `FIRST NAME` - author first name
-- * `TITLE` - name of the published title
-- * `PUBLISHER` - name of the publisher where the title was published

-- Your output will look something like below:

-- ![Challenge 1 output](./images/challenge-1.png)

-- *Note: the screenshot above is not the complete output.*

-- If your query is correct, the total rows in your output should be the same as the total number of records in Table `titleauthor`.

SELECT *
FROM authors;

-- au_id as AUTHOR ID
-- au_lname as LAST NAME
-- au_fname as FIRST NAME

SELECT *
FROM publishers;

-- pub_name as PUBLISHER

SELECT *
FROM titleauthor;

-- title_id as TITLE ID
-- au_id as AUTHOR ID

SELECT *
FROM titles;

-- title as TITLE
-- title_id as TITLE ID
 
CREATE TABLE challenge
AS (SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id, titles.title, titles.pub_id
FROM ((authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id)
LEFT JOIN titles ON titleauthor.title_id = titles.title_id));

SELECT *
FROM challenge;

CREATE TABLE challenge1
AS (SELECT challenge.au_id, challenge.au_lname, challenge.au_fname, challenge.title, publishers.pub_name
FROM challenge
LEFT JOIN publishers
ON challenge.pub_id = publishers.pub_id);

ALTER TABLE challenge1
RENAME COLUMN pub_name TO PUBLISHER;

SELECT *
FROM challenge1;

-- ## Challenge 2 - Who Have Published How Many At Where?

-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
-- Your output should look something like below:

-- ![Challenge 2 output](./images/challenge-2.png)

-- *Note: the screenshot above is not the complete output.*

-- To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number
-- of records in Table `titleauthor`.

-- *Hint: In order to count the number of titles published by an author, you need to use 
-- [MySQL COUNT](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html).
-- Also check out [MySQL Group By](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html)
-- because you will count the rows of different groups of data. Refer to the references and learn by yourself.
-- These features will be formally discussed in the Temp Tables and Subqueries lesson.*


CREATE TABLE IF NOT EXISTS challenge2 AS
(SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, COUNT(DISTINCT(TITLE)) AS TITLE_COUNT
FROM challenge1
GROUP BY AUTHOR_ID);

SELECT *
FROM challenge2;

SELECT SUM(TITLE_COUNT) AS NUMBER_OF_ROWS_IN_titleauthor
FROM challenge2;

-- ## Challenge 3 - Best Selling Authors

-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

-- Requirements:

-- * Your output should have the following columns:
-- 	* `AUTHOR ID` - the ID of the author
-- 	* `LAST NAME` - author last name
-- 	* `FIRST NAME` - author first name
-- 	* `TOTAL` - total number of titles sold from this author
-- * Your output should be ordered based on `TOTAL` from high to low.
-- * Only output the top 3 best selling authors.

CREATE TABLE IF NOT EXISTS challenge3 AS
(SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, COUNT(DISTINCT(TITLE)) AS TOTAL
FROM challenge1
GROUP BY TITLE);

SELECT *
FROM challenge3
ORDER BY TOTAL  DESC
LIMIT 3;

-- ## Challenge 4 - Best Selling Authors Ranking

-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). Also order your results based on `TOTAL` from high to low.

CREATE TABLE challenge4 AS(
SELECT *
FROM challenge3
ORDER BY TOTAL  DESC);

SELECT *
FROM challenge4;