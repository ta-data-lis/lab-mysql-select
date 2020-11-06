/* Challenge 1 */
CREATE TEMPORARY TABLE publication.publisher
SELECT titles.title_id, titles.title AS Titles, publishers.pub_name AS Publisher
FROM publication.publishers
INNER JOIN publication.titles
ON publication.publishers.pub_id = publication.titles.pub_id;

CREATE TEMPORARY TABLE publication.author
SELECT DISTINCT titleauthor.au_id, publication.publisher.Titles, publication.publisher.Publisher
FROM publication.titleauthor
INNER JOIN publication.publisher
ON publication.titleauthor.title_id = publication.publisher.title_id
GROUP BY titleauthor.title_id;

SELECT publication.author.au_id, authors.au_lname AS Last_Name, authors.au_fname AS First_Name, publication.author.Titles, publication.author.Publisher
FROM publication.authors
INNER JOIN publication.author
ON publication.authors.au_id = publication.author.au_id;

/* Challenge 2 */
CREATE TEMPORARY TABLE publication.publisher_2
SELECT titleauthor.au_id, titles.pub_id, COUNT(titles.title_id) AS Title_Count
FROM publication.titleauthor
INNER JOIN publication.titles
ON publication.titleauthor.title_id = publication.titles.title_id
GROUP BY au_id, pub_id
ORDER BY au_id DESC;

CREATE TEMPORARY TABLE publication.pubname
SELECT publisher_2.au_id, publishers.pub_name, publisher_2.Title_Count
FROM publication.publishers
INNER JOIN publication.publisher_2
ON publication.publishers.pub_id = publication.publisher_2.pub_id;

SELECT authors.au_id, authors.au_lname AS Last_Name, authors.au_fname AS First_Name, pubname.pub_name, pubname.Title_Count
FROM publication.authors
INNER JOIN publication.pubname
ON publication.authors.au_id = publication.pubname.au_id;