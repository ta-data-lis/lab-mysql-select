
/*-----------CHALLANGE 1--------------*/
/*figure out what titles each author has published at which publishers*/
/* total rows = the total number of records in Table `titleauthor` */

SELECT authors.au_id, authors.au_lname, authors.au_fname,titles.title, publishers.pub_name,  COUNT(*)
/* COUNT(*) at the end lets me get the count of total rows in my new table, in order to compare it to No of rows in titleauthor in the end */
/* COUNT(*) needs to be disabled to see the table*/
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id;

/* showing the count of rows in titleauthot, compared to total count of table above, it is both 25*/
SELECT au_id,COUNT(au_id) FROM titleauthor;



/*-----------CHALLANGE 2--------------*/
/* How many titles each author at each publisher */

SELECT au_id, au_lname, au_fname, pub_name, COUNT(title)
FROM (SELECT authors.au_id , authors.au_lname , authors.au_fname ,titles.title , publishers.pub_name
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titles.title_id=titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id) summary
GROUP BY au_id, pub_name;

/* ALternatively: (Because I created a table out of the results of challenge 1) */
SELECT au_id, au_lname, au_fname, pub_name, COUNT(title)
FROM challenge_1
GROUP BY au_id, pub_name;



/*-----------CHALLANGE 3--------------*/
/* top 3 authors with most-sold titles */

SELECT authors.au_lname, authors.au_fname, t.title_id,SUM(sales.qty) as "Total Sales"
FROM sales
INNER JOIN titleauthor AS t
ON t.title_id=sales.title_id
INNER JOIN authors
ON authors.au_id= t.au_id
GROUP BY authors.au_id, t.title_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;


/*-----------CHALLANGE 4--------------*/
/* 23 authors including those with 0 sales,
 0 instead of NULL as TOTAL, order based on TOTAL */
 
SELECT authors.au_lname, authors.au_fname, t.title_id,SUM(sales.qty) as "Total Sales"
FROM sales
INNER JOIN titleauthor AS t
ON t.title_id=sales.title_id
INNER JOIN authors
ON authors.au_id= t.au_id
GROUP BY t.title_id,authors.au_id
ORDER BY SUM(sales.qty) DESC;