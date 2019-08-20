SELECT *  FROM publications.titles;

# Challange 1
SELECT authors.au_id AS AuthorID, authors.au_lname AS Last_Name, authors.au_fname AS First_Name,
 titles.title as Title, publishers.pub_name AS Publisher
FROM titles
inner Join titleauthor ON titleauthor.title_id = titles.title_id
inner JOIN publishers ON publishers.pub_id = titles.pub_id
inner JOIN authors ON authors.au_id =titleauthor.au_id;

# Challenge 2
SELECT authors.au_id AS AuthorID, authors.au_lname AS Last_Name, authors.au_fname AS First_Name,
publishers.pub_name AS Publisher,  COUNT(titles.title) as Number_Titles
FROM titles
inner Join titleauthor ON titleauthor.title_id = titles.title_id
inner JOIN publishers ON publishers.pub_id = titles.pub_id
inner JOIN authors ON authors.au_id =titleauthor.au_id
GROUP BY authors.au_id;

# Challenge 3
SELECT authors.au_id AS AuthorID, authors.au_lname AS Last_Name, authors.au_fname AS First_Name,
count(titles.title) as Total, sum(sales.qty) as Sold_books
FROM titles
inner Join titleauthor ON titleauthor.title_id = titles.title_id
inner JOIN authors ON authors.au_id =titleauthor.au_id
inner JOIN sales ON titles.title_id = sales.title_id	
GROUP BY authors.au_id
ORDER BY Total DESC, Sold_books DESC
LIMIT 3;

# Challenge 4
SELECT authors.au_id AS AuthorID, authors.au_lname AS Last_Name, authors.au_fname AS First_Name,
IFNULL(SUM(sales.qty),0) as Sold_books
FROM titles
Join titleauthor ON titleauthor.title_id = titles.title_id
JOIN sales ON titles.title_id = sales.title_id	
right JOIN authors ON authors.au_id =titleauthor.au_id
GROUP BY authors.au_id
ORDER BY Sold_books DESC;