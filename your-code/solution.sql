SELECT * FROM publications.publishers;

SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id;

SELECT publications.authors.au_id AS Author_id, publications.authors.au_lname AS Last_Name, publications.authors.au_fname AS First_Name, Title, Publisher
FROM 
(SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id) AS Pub_Title
INNER JOIN publications.authors
ON publications.authors.au_id = publications.authors.au_id;

CREATE TEMPORARY TABLE publications.pub_title AS 
SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id;

SELECT *
FROM pub_title;

CREATE VIEW publications.pub_title AS 
SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id;

/* CHALLENGE 2 */

/* creating first a temporary table called challenge_1 from the qury before */

CREATE TEMPORARY TABLE publications.challenge_1 AS
SELECT publications.authors.au_id AS Author_id, publications.authors.au_lname AS Last_Name, publications.authors.au_fname AS First_Name, Title, Publisher
FROM 
(SELECT publications.publishers.pub_name AS Publisher, publications.titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publications.publishers.pub_id = publications.titles.pub_id) AS Pub_Title
INNER JOIN publications.authors
ON publications.authors.au_id = publications.authors.au_id;

/* showing the results request: query how many titles each author has published at each publisher */

SELECT Author_id, Last_Name, First_Name, Publisher, COUNT(Title) AS Title_count
FROM publications.challenge_1
GROUP BY Author_id, Last_Name, First_Name, Publisher
ORDER BY Title_count DESC;


/* CHALLENGE 3: Who are the top 3 authors who have sold the highest number of titles? */

/* Create temporary table (Authors_id) with au_id, fist name, last name (within his view) */

CREATE TEMPORARY TABLE publications.Authors_id AS
SELECT publications.authors.au_id AS Author_id, publications.authors.au_lname AS Last_Name, publications.authors.au_fname AS First_Name
FROM publications.authors;

CREATE VIEW publications.Authors_id AS
SELECT publications.authors.au_id AS Author_id, publications.authors.au_lname AS Last_Name, publications.authors.au_fname AS First_Name
FROM publications.authors;


/* Create temporary table(Sale) with author_id, title_id, ytd_sles(within his view) */

CREATE TEMPORARY TABLE publications.Sale AS
SELECT publications.titleauthor.au_id AS Author_id, publications.titleauthor.title_id AS Title_id, publications.titles.ytd_sales AS SALES
FROM publications.titleauthor
INNER JOIN publications.titles
ON publications.titleauthor.title_id = publications.titles.title_id;


CREATE VIEW publications.Sale AS
SELECT publications.titleauthor.au_id AS Author_id, publications.titleauthor.title_id AS Title_id, publications.titles.ytd_sales AS SALES
FROM publications.titleauthor
INNER JOIN publications.titles
ON publications.titleauthor.title_id = publications.titles.title_id;

/* Now we can finally connect the two tables through Author_id */

SELECT publications.Authors_id.Author_id, publications.Authors_id.Last_Name, publications.Authors_id.First_Name, SUM(SALES) AS TOTAL
FROM authors_id
LEFT JOIN Sale
ON publications.Authors_id.Author_id = publications.sale.Author_id
GROUP BY Author_id, Last_Name, First_Name
ORDER BY TOTAL DESC
LIMIT 3;

/* CHALLENGE 4:  output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). Also order your results based on `TOTAL` from high to low. */

SELECT publications.Authors_id.Author_id, publications.Authors_id.Last_Name, publications.Authors_id.First_Name, IFNULL(SUM(SALES),0) AS TOTAL
FROM authors_id
LEFT JOIN Sale
ON publications.Authors_id.Author_id = publications.sale.Author_id
GROUP BY Author_id, Last_Name, First_Name
ORDER BY TOTAL DESC;