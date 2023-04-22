SELECT * FROM `lab select`.authors;

SELECT * FROM `lab select`.publishers;

SELECT * FROM `lab select`.titleauthor;

SELECT * FROM `lab select`.titles;

# Challenge 1
SELECT  authors.au_id, au_lname, au_fname, title, publishers.pub_name
FROM `lab select`.titles
INNER JOIN `lab select`.titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN `lab select`.authors
ON titleauthor.au_id = authors.au_id
INNER JOIN`lab select`.publishers
ON titles.pub_id = publishers.pub_id;

# Challenge 2 
CREATE VIEW published_authors as 
SELECT  authors.au_id, au_lname, au_fname, titles.title_id, title, publishers.pub_name 
FROM `lab select`.titles
INNER JOIN `lab select`.titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN `lab select`.authors
ON titleauthor.au_id = authors.au_id
INNER JOIN`lab select`.publishers
ON titles.pub_id = publishers.pub_id;

SELECT au_id, au_lname, au_fname,pub_name,count(title) 
FROM published_authors
GROUP BY au_id,au_lname,au_fname,pub_name;

#Challenge 3
CREATE VIEW published_authors2 as 
SELECT  authors.au_id, au_lname, au_fname, titles.title_id, title, publishers.pub_name 
FROM `lab select`.titles
INNER JOIN `lab select`.titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN `lab select`.authors
ON titleauthor.au_id = authors.au_id
INNER JOIN`lab select`.publishers
ON titles.pub_id = publishers.pub_id;

SELECT au_id, au_lname, au_fname, sum(qty) as TOTAL
FROM published_authors2
left JOIN sales
ON published_authors2.title_id = sales.title_id
GROUP BY au_id
order by TOTAL DESC
LIMIT 3;

#CHALLENGE 4
SELECT au_id, au_lname, au_fname, qty
FROM published_authors2
left JOIN sales
ON published_authors2.title_id = sales.title_id;

SELECT au_id, au_lname, au_fname, sum(qty) as TOTAL
FROM published_authors2
left JOIN sales
ON published_authors2.title_id = sales.title_id
GROUP BY au_id
order by TOTAL DESC;
