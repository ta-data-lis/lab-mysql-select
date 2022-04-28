//* Challenge 1 - Who Have Published What At Where?
In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author 
has published at which publishers. Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published  */

/*select au_id, au_lname, au_fname,title, pub_name from publications.titles inner join publications.titleauthor on titles.title_id = titleauthor.title_id
inner join publications.authors on au_id inner join publications.titleauthor on au_id inner join publications.titles on title_id
inner join publications.publishers on pub_id;*/

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM publications.titles
INNER JOIN publications.titleauthor
ON titles.title_id = titleauthor.title_id
inner join publications.authors
on titleauthor.au_id = authors.au_id
inner join publications.publishers
on titles.pub_id = publishers.pub_id;


/* Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. */

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, count(titles.title) as Title_count 
from publications.titles
INNER JOIN publications.titleauthor
ON titles.title_id = titleauthor.title_id
inner join publications.authors
on titleauthor.au_id = authors.au_id
inner join publications.publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id, authors.au_lname, authors.au_fname;

/* Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.*/

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, count(titles.title) as Title_count 
from publications.titles
INNER JOIN publications.titleauthor
ON titles.title_id = titleauthor.title_id
inner join publications.authors
on titleauthor.au_id = authors.au_id
inner join publications.publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id, authors.au_lname, authors.au_fname 
order by Title_count desc
limit 3;

/* Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc limit (3)' at line 9
 */

/*
Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.*/



/* Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3.
 Note that the authors who have sold 0 titles should also appear in your output 
(ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.*/

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, count(titles.title) as Title_count 
from publications.titles
INNER JOIN publications.titleauthor
ON titles.title_id = titleauthor.title_id
inner join publications.authors
on titleauthor.au_id = authors.au_id
inner join publications.publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id, authors.au_lname, authors.au_fname 
order by Title_count desc;

