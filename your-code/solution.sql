-- CHALANGE 1

SELECT au_id, au_fname, au_lname
FROM publications.authors;

SELECT titleauthor.au_id, au_lname, au_fname, title_id
FROM publications.titleauthor
INNER JOIN (SELECT au_id, au_fname, au_lname
FROM publications.authors) as aut
ON titleauthor.au_id = aut.au_id;

SELECT aut_t_id.au_id, au_fname, au_lname, title, pub_id
FROM publications.titles
INNER JOIN(SELECT titleauthor.au_id, au_lname, au_fname, title_id
FROM publications.titleauthor
INNER JOIN (SELECT au_id, au_fname, au_lname
FROM publications.authors) as aut
ON titleauthor.au_id = aut.au_id) as aut_t_id
ON titles.title_id= aut_t_id.title_id;

SELECT aut_t_id_pub_id.au_id, au_lname, au_fname, title, pub_name
FROM publications.publishers
INNER JOIN (SELECT aut_t_id.au_id, au_fname, au_lname, title, pub_id
FROM publications.titles
INNER JOIN(SELECT titleauthor.au_id, au_lname, au_fname, title_id
FROM publications.titleauthor
INNER JOIN (SELECT au_id, au_fname, au_lname
FROM publications.authors) as aut
ON titleauthor.au_id = aut.au_id) as aut_t_id
ON titles.title_id= aut_t_id.title_id) as aut_t_id_pub_id
ON publishers.pub_id= aut_t_id_pub_id.pub_id
ORDER BY aut_t_id_pub_id.au_id;

-- CHALANGE 2

SELECT au_id, au_lname, au_fname, pub_name, count(au_id)
FROM publications.publishers
INNER JOIN (SELECT aut_t_id.au_id, au_fname, au_lname, title, pub_id
FROM publications.titles
INNER JOIN(SELECT titleauthor.au_id, au_lname, au_fname, title_id
FROM publications.titleauthor
INNER JOIN (SELECT au_id, au_fname, au_lname
FROM publications.authors) as aut
ON titleauthor.au_id = aut.au_id) as aut_t_id
ON titles.title_id= aut_t_id.title_id) as aut_t_id_pub_id
ON publishers.pub_id= aut_t_id_pub_id.pub_id
GROUP BY publications.publishers.pub_name, au_id
ORDER BY au_id DESC;

-- CHALANGE 3

SELECT DISTINCT *
FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id=titleauthor.au_id;

SELECT DISTINCT au_id, au_lname, au_fname, sum(qty)
FROM publications.sales
RIGHT JOIN (SELECT DISTINCT authors.au_id, au_lname,au_fname, title_id
FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id=titleauthor.au_id) as a_t
ON sales.title_id=a_t.title_id
GROUP BY au_id
ORDER BY sum(qty) DESC
LIMIT 3;

-- CHALANGE 4
SELECT DISTINCT au_id, au_lname, au_fname, sum(qty)
FROM publications.sales
RIGHT JOIN (SELECT DISTINCT authors.au_id, au_lname,au_fname, title_id
FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id=titleauthor.au_id) as a_t
ON sales.title_id=a_t.title_id
GROUP BY au_id
ORDER BY sum(qty) DESC;
