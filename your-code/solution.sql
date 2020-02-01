CREATE DATABASE publications;
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id;

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, count(titles.title)
FROM titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id
GROUP BY publishers.pub_name, authors.au_id
ORDER BY count(titles.title) DESC;

SELECT authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty)
FROM titles
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id
INNER JOIN sales ON titles.title_id = sales.title_id	
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC LIMIT 3;

SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(sum(sales.qty),0)
FROM titles
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id
INNER JOIN sales ON titles.title_id = sales.title_id	
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC;

