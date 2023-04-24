# CHALLENGE 1

SELECT * 
FROM publications.authors;

SELECT * 
FROM publications.titles;

SELECT * 
FROM publications.titleauthor;

SELECT * 
FROM publications.publishers;



SELECT
 author_id as Author_ID, Last_name, First_name, title AS Title, publications.publishers.pub_name AS Publisher
FROM (
	SELECT author_title AS author_id, au_lname AS Last_name, au_fname AS First_name, title_author AS Title_id, pub_id AS publisher_author, title
FROM (
		SELECT publications.titleauthor.au_id AS author_title, publications.titleauthor.title_id AS title_author, pub_id, publications.titles.title
		FROM publications.titleauthor
		INNER JOIN publications.titles
		ON publications.titles.title_id = publications.titleauthor.title_id
	) AS selection
	INNER JOIN publications.authors
ON publications.authors.au_id = selection.author_title
) AS selection2
INNER JOIN publications.publishers
ON selection2.publisher_author = publications.publishers.pub_id;


# CHALLENGE 2

SELECT author_id AS Author_ID, Last_name, First_name, publications.publishers.pub_name AS Publisher, COUNT(title)
FROM (
	SELECT author_title AS author_id, au_lname AS Last_name, au_fname AS First_name, title_author AS Title_id, pub_id AS publisher_author, title
	FROM (
		SELECT publications.titleauthor.au_id AS author_title, publications.titleauthor.title_id AS title_author, pub_id, publications.titles.title
		FROM publications.titleauthor
		INNER JOIN publications.titles
		ON publications.titles.title_id = publications.titleauthor.title_id
	) AS selection
	INNER JOIN publications.authors
ON publications.authors.au_id = selection.author_title
) AS selection2
INNER JOIN publications.publishers
ON selection2.publisher_author = publications.publishers.pub_id
GROUP BY Author_ID, Publisher
ORDER BY Author_ID DESC;


# CHALLENGE 3


SELECT author_id AS Author_ID, Last_name, First_name, COUNT(title) AS titles_sold
FROM (
	SELECT author_title AS author_id, au_lname AS Last_name, au_fname AS First_name, title_author AS Title_id, pub_id AS publisher_author, title
	FROM(
		SELECT publications.titleauthor.au_id AS author_title, publications.titleauthor.title_id AS title_author, pub_id, publications.titles.title
		FROM publications.titleauthor
		INNER JOIN publications.titles
		ON publications.titles.title_id = publications.titleauthor.title_id
	) AS selection
	INNER JOIN publications.authors
ON publications.authors.au_id = selection.author_title
) AS selection2
INNER JOIN publications.publishers
ON selection2.publisher_author = publications.publishers.pub_id
GROUP BY Author_ID
ORDER BY Author_ID DESC
LIMIT 3;
