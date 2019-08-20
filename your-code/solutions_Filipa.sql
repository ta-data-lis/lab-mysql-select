#Challenge 1
SELECT authors.au_id AS AuthorID, authors.au_lname AS AuthorLastName, authors.au_fname AS AuthorFirstName, titles.title AS BookTitle, publishers.pub_name AS Publisher
FROM publications.titles #because titles as a connections to the other 3 tables
JOIN publications.titleauthor ON titles.title_id = titleauthor.title_id #comparison same keys on different locations
JOIN publications.authors ON titleauthor.au_id = authors.au_id
JOIN publications.publishers ON titles.pub_id = publishers.pub_id;

#Challenge 2
SELECT authors.au_id AS AuthorID, authors.au_lname AS AuthorLastName, authors.au_fname AS AuthorFirstName, publishers.pub_name AS Publisher, COUNT(titles.title) AS TitleCount
FROM publications.titles
JOIN publications.titleauthor ON titles.title_id = titleauthor.title_id
JOIN publications.authors ON titleauthor.au_id = authors.au_id
JOIN publications.publishers ON titles.pub_id = publishers.pub_id
GROUP BY AuthorID, Publisher; #why I had to add GROUP BY Publisher too? Doesn't work without it. Because is titles per EACH author per EACH publisher?

#Challenge 3
SELECT authors.au_id AS AuthorID, authors.au_lname AS AuthorLastName, authors.au_fname AS AuthorFirstName, SUM(sales.qty) AS TotalTitlesSold
FROM publications.titles
JOIN publications.titleauthor ON titles.title_id = titleauthor.title_id
JOIN publications.authors ON titleauthor.au_id = authors.au_id
JOIN publications.sales ON titles.title_id = sales.title_id
GROUP BY AuthorID ORDER BY SUM(sales.qty) DESC LIMIT 3;

#Challenge 4
SELECT authors.au_id AS AuthorID, authors.au_lname AS AuthorLastName, authors.au_fname AS AuthorFirstName, IFNULL(SUM(sales.qty),0) AS TotalTitlesSold
FROM publications.titles
JOIN publications.titleauthor ON titles.title_id = titleauthor.title_id
JOIN publications.sales ON titles.title_id = sales.title_id
RIGHT JOIN publications.authors ON titleauthor.au_id = authors.au_id
GROUP BY AuthorID ORDER BY TotalTitlesSold DESC;
