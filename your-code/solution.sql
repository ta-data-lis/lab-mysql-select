CREATE TABLE challenge1
SELECT authors.au_id as AuthorID, authors.au_fname as FirstName, authors.au_lname as lastName,titles.title, publishers.pub_name as publishers 
FROM titles
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id;

CREATE TABLE challenge2
SELECT AuthorID, FirstName, lastName, publishers, count(title) as TitleCount
from challenge1
group by AuthorID, FirstName, lastName, publishers;

CREATE TABLE challenge3
SELECT authors.au_id as AuthorID, authors.au_fname as FirstName, authors.au_lname as lastName, titleauthor.au_ord as total
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
order by total DESC
limit 3;

CREATE TABLE challenge4
SELECT authors.au_id as AuthorID, authors.au_fname as FirstName, authors.au_lname as lastName, titleauthor.au_ord as total
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
order by total DESC;