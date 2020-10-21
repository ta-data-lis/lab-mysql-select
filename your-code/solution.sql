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

/* Challenge 3 */
CREATE TEMPORARY TABLE publication.sales3
SELECT sales.title_id, sales.qty AS Sales
FROM publication.sales
GROUP BY title_id
ORDER BY Sales DESC;

CREATE TEMPORARY TABLE publication.auid
SELECT titleauthor.au_id, sales3.Sales
FROM publication.titleauthor
INNER JOIN publication.sales3
ON publication.titleauthor.title_id = publication.sales3.title_id;

SELECT authors.au_id, authors.au_lname AS Last_name, authors.au_fname AS First_name, auid.Sales
FROM publication.authors
INNER JOIN publication.auid
ON publication.authors.au_id = publication.auid.au_id
ORDER BY Sales DESC
LIMIT 3;

/* Challenge 4 */
CREATE TABLE publication.challenge4
SELECT authors.au_id, authors.au_lname AS Last_name, authors.au_fname AS First_name, auid.Sales
FROM publication.authors
INNER JOIN publication.auid
ON publication.authors.au_id = publication.auid.au_id
ORDER BY Sales DESC;

SELECT COUNT(*)
FROM publication.challenge4; /* My table has 24 lines. I don't have 0 sales */