USE publications;

# Challenge 1
SELECT a.au_id AS AuthorID, a.au_lname AS LastName, a.au_fname AS FirstName, t.title AS Title, p.pub_name AS Publisher
FROM publications.authors a
INNER JOIN publications.titleauthor ta ON ta.au_id = a.au_id
INNER JOIN publications.titles t ON ta.title_id = t.title_id
INNER JOIN publications.publishers p ON p.pub_id = t.pub_id
ORDER BY AuthorID ASC;

# Challenge 2
SELECT a.au_id AS AuthorID, a.au_lname AS LastName, a.au_fname AS FirstName, p.pub_name AS Publisher, COUNT(t.title_id) AS TitleCount
FROM publications.authors a
INNER JOIN publications.titleauthor ta ON ta.au_id = a.au_id
INNER JOIN publications.titles t ON ta.title_id = t.title_id
INNER JOIN publications.publishers p ON p.pub_id = t.pub_id
GROUP BY p.pub_name, a.au_id
ORDER BY TitleCount DESC, AuthorID DESC, Publisher DESC;

# Challenge 3
SELECT a.au_id AS AuthorID, a.au_lname AS LastName, a.au_fname AS FirstName, SUM(s.qty) AS Total
FROM publications.authors a
INNER JOIN publications.titleauthor ta ON ta.au_id = a.au_id
INNER JOIN publications.sales s ON s.title_id = ta.title_id
GROUP BY AuthorID
ORDER BY Total DESC, AuthorID DESC
LIMIT 3;

# Challenge 4
SELECT a.au_id AS AuthorID, a.au_lname AS LastName, a.au_fname AS FirstName, IFNULL(SUM(s.qty),0) AS Total
FROM publications.authors a
LEFT JOIN publications.titleauthor ta ON ta.au_id = a.au_id
LEFT JOIN publications.sales s ON s.title_id = ta.title_id
GROUP BY AuthorID
ORDER BY Total DESC, AuthorID DESC;