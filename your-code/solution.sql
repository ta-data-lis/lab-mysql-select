CREATE DATABASE publications;
# In this challenge you will write a MySQL SELECT query that joins various tables to figure out
# what titles each author has published at which publishers. 
# Your output should have at least the following columns:

#AUTHOR ID - the ID of the author
#LAST NAME - author last name
#FIRST NAME - author first name
#TITLE - name of the published title
#PUBLISHER - name of the publisher where the title was published

# pick from table authors au_id, pick from table authors.au_lname and rename it as last_name, pick from authors au_fname and rename it as first_name, pick title from titles table and pub_name from publisher table
# than from authors beginning, join with titleauthor table and use the keys au_id form authors and the au_id from titleauthor table
# than connect titleauthor with title, join them using title_id wich is represented in each table
# than connect title with publisher, join them using the pub_id wich is represented in each table

select authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, titles.title, publishers.pub_name as publisher
from authors
inner join titleauthor on authors.au_id = titleauthor.au_id
inner join titles on titles.title_id = titleauthor.title_id
inner join publishers on publishers.pub_id = titles.pub_id;


# Who Have Published How Many At Where?
# au_id, last_name, fist_name, pub_name...
# count titles in column title from titles table

SELECT authors.au_id, authors.au_lname AS last_name, authors.au_fname AS first_name, publishers.pub_name,
COUNT(titles.title) AS title_count
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY title;

SELECT  
COUNT(titleauthor.title_id) AS sum_title
FROM titleauthor;

SELECT  
COUNT(titles.title_id) AS sum_title
FROM titles;

# the titles table has less titles listed than the titlesauthor table, some titles were written by more than one author


# Who are the top 3 authors who have sold the highest number of titles? 

SELECT authors.au_id, authors.au_lname AS last_name, authors.au_fname AS first_name, sales.qty as total
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN sales ON sales.title_id = titleauthor.title_id
ORDER BY sales.qty DESC
LIMIT 3;

# Best Selling Authors Ranking 23 - no author listed who sold zero books

SELECT authors.au_id, authors.au_lname AS last_name, authors.au_fname AS first_name, sales.qty as total
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN sales ON sales.title_id = titleauthor.title_id
ORDER BY sales.qty ASC
LIMIT 23;







