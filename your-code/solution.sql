USE publications;


# CHALLENGE 1: what titles each author has published at which publishers
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',
	   t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
	FROM authors a
	JOIN titleauthor ta ON ta.au_id=a.au_id
	JOIN titles t ON ta.title_id=t.title_id
	JOIN publishers p ON p.pub_id=t.pub_id
	ORDER BY a.au_id;

# checking number of records to validate results
SELECT COUNT(*) FROM titleauthor;


# CHALLENGE 2: how many titles each author has published at each publisher
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',
	   p.pub_name AS 'PUBLISHER', COUNT(t.title) AS 'TITLE COUNT'
	FROM authors a
	JOIN titleauthor ta ON ta.au_id=a.au_id
	JOIN titles t ON ta.title_id=t.title_id
	JOIN publishers p ON p.pub_id=t.pub_id
	GROUP BY a.au_id, p.pub_id
	ORDER BY a.au_id DESC;

# checking number of records to validate results
SELECT COUNT(t.title)
	FROM authors a
	JOIN titleauthor ta ON ta.au_id=a.au_id
	JOIN titles t ON ta.title_id=t.title_id;


# CHALLENGE 3: top 3 authors who have sold the highest number of titles
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', SUM(s.qty) AS 'TOTAL'
	FROM authors a
	JOIN titleauthor ta ON ta.au_id=a.au_id
	JOIN titles t ON ta.title_id=t.title_id
	LEFT JOIN sales s ON s.title_id=t.title_id
	GROUP BY a.au_id
	ORDER BY SUM(s.qty) DESC
	LIMIT 3;


# CHALLENGE 4: 23 best selling authors ranking
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', SUM(s.qty) AS 'TOTAL'
	FROM authors a
	JOIN titleauthor ta ON ta.au_id=a.au_id
	JOIN titles t ON ta.title_id=t.title_id
	LEFT JOIN sales s ON s.title_id=t.title_id
	GROUP BY a.au_id
	ORDER BY SUM(s.qty) DESC
	LIMIT 23;
