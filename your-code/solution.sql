USE publications;

-- Challenge  1 
SELECT authors.au_id as ID, authors.au_lname AS 'LAST NAME',au_fname AS 'FIRST NAME', titles.title AS TITLE, publishers.pub_name AS PUBLISHER FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id= titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id ;

-- Challenge 2
SELECT authors.au_id as ID, authors.au_lname AS 'LAST NAME',au_fname AS 'FIRST NAME', COUNT(titles.title)  AS 'TITLE COUNT', publishers.pub_name AS PUBLISHER FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id= titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id 
GROUP BY publishers.pub_name, authors.au_id;

-- Challenge 3
SELECT authors.au_id as ID, authors.au_lname AS 'LAST NAME',au_fname AS 'FIRST NAME', SUM(sales.qty) AS TOTAL FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4
SELECT authors.au_id as ID, authors.au_lname AS 'LAST NAME',au_fname AS 'FIRST NAME' , SUM(IFNULL(sales.qty,0)) AS TOTAL FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;
