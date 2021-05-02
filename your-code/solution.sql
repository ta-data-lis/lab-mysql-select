# challenge 1: what are the titles each author has published at which publishers.

SELECT publications.authors.au_id AS "AUTHOR ID", publications.authors.au_lname AS "LAST NAME", publications.authors.au_fname AS "FIRST NAME", titles_with_authors_and_publishers.title AS TITLE, titles_with_authors_and_publishers.pub_name AS PUBLISHER
FROM publications.authors
INNER JOIN (SELECT titles_with_publishers.title, titles_with_publishers.pub_name, publications.titleauthor.au_id
FROM publications.titleauthor
INNER JOIN (SELECT publications.titles.title, publications.titles.title_id, publications.publishers.pub_name
FROM publications.titles
INNER JOIN publications.publishers
ON publications.titles.pub_id = publications.publishers.pub_id) titles_with_publishers
ON publications.titleauthor.title_id = titles_with_publishers.title_id) AS titles_with_authors_and_publishers
ON publications.authors.au_id = titles_with_authors_and_publishers.au_id;

# challenge 2: add title count for each unique pair of author and publisher
SELECT publications.authors.au_id AS "AUTHOR ID", publications.authors.au_lname AS "LAST NAME", publications.authors.au_fname AS "FIRST NAME", titles_with_authors_and_publishers.pub_name AS PUBLISHER, COUNT(titles_with_authors_and_publishers.title) AS "TITLE COUNT"
FROM publications.authors
INNER JOIN (SELECT titles_with_publishers.title, titles_with_publishers.pub_name, publications.titleauthor.au_id
FROM publications.titleauthor
INNER JOIN (SELECT publications.titles.title, publications.titles.title_id, publications.publishers.pub_name
FROM publications.titles
INNER JOIN publications.publishers
ON publications.titles.pub_id = publications.publishers.pub_id) AS titles_with_publishers
ON publications.titleauthor.title_id = titles_with_publishers.title_id) AS titles_with_authors_and_publishers
ON publications.authors.au_id = titles_with_authors_and_publishers.au_id
GROUP BY publications.authors.au_id, titles_with_authors_and_publishers.pub_name;


# challenge 3: who are the top 3 authors who have sold the highest number of titles?
SELECT publications.authors.au_id AS "AUTHOR ID", publications.authors.au_lname AS "LAST NAME", publications.authors.au_fname AS "FIRST NAME", sum(publications.titles.ytd_sales) AS TOTAL
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titleauthor.title_id = publications.titles.title_id
GROUP BY publications.authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

# challenge 4: who are the top 3 authors who have sold the highest number of titles?
SELECT publications.authors.au_id AS "AUTHOR ID", publications.authors.au_lname AS "LAST NAME", publications.authors.au_fname AS "FIRST NAME", COALESCE(sum(publications.titles.ytd_sales), 0) AS TOTAL
FROM publications.authors
LEFT JOIN publications.titleauthor
ON publications.authors.au_id = publications.titleauthor.au_id
LEFT JOIN publications.titles
ON publications.titleauthor.title_id = publications.titles.title_id
GROUP BY publications.authors.au_id
ORDER BY TOTAL DESC;
