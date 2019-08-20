#Challenge 1 | Who Have Published What At Where? | what titles each author has published at which publishers

SELECT au_lname, `au_fname`, title, `authors`.au_id, pub_name
FROM titleauthor
INNER JOIN titles ON titleauthor.`title_id` = titles.`title_id`
INNER JOIN `authors` ON titleauthor.`au_id` = authors.`au_id`
INNER JOIN publishers ON publishers.pub_id = titles.`pub_id`;


#Challenge 2 | Who Have Published How Many At Where? | how many titles each author has published at each publisher

SELECT au_lname AS Author_last_name, `au_fname` AS Author_first_name,  COUNT(title) AS Number_titles, `authors`.au_id AS author_ID, pub_name
FROM titleauthor
INNER JOIN titles ON titleauthor.`title_id` = titles.`title_id`
INNER JOIN authors ON titleauthor.`au_id` = authors.`au_id`
INNER JOIN publishers ON publishers.pub_id = titles.`pub_id`
GROUP BY titleauthor.au_id, pub_name;


#Challenge 3 - Best Selling Authors | Who are the top 3 authors who have sold the highest number of titles?

SELECT au_lname AS Author_last_name, `au_fname` AS Author_first_name, `authors`.au_id AS author_ID, SUM(qty) AS Total
FROM titleauthor
INNER JOIN sales ON sales.title_id = titleauthor.title_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id
GROUP BY titleauthor.au_id
ORDER BY SUM(qty) DESC
LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking 

SELECT au_lname AS Author_last_name, `au_fname` AS Author_first_name, `authors`.au_id AS author_ID, SUM(qty) AS Total
FROM titleauthor
RIGHT JOIN authors ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(qty) DESC;
