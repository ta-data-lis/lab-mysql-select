-- Challenge 1:

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, pub_name
from pubs.authors
INNER JOIN pubs.titleauthor
ON pubs.authors.au_id = pubs.titleauthor.au_id
INNER JOIN pubs.titles
ON pubs.titleauthor.title_id = pubs.titles.title_id
INNER JOIN pubs.publishers
ON pubs.titles.pub_id = pubs.publishers.pub_id;

-- Challenge 2:

SELECT authors.au_id, authors.au_lname, authors.au_fname, pub_name, count(titles.title) AS publications, titles.title
from pubs.authors
INNER JOIN pubs.titleauthor
ON pubs.authors.au_id = pubs.titleauthor.au_id
INNER JOIN pubs.titles
ON pubs.titleauthor.title_id = pubs.titles.title_id
INNER JOIN pubs.publishers
ON pubs.titles.pub_id = pubs.publishers.pub_id
GROUP BY pub_name, authors.au_id, authors.au_lname, authors.au_fname
ORDER BY publications DESC;


-- Challenge 3: 

SELECT authors.au_id, authors.au_fname, authors.au_lname, SUM(sales.qty) AS total_sales
FROM pubs.authors
INNER JOIN pubs.titleauthor
ON pubs.authors.au_id = pubs.titleauthor.au_id
INNER JOIN pubs.titles
ON pubs.titleauthor.title_id = pubs.titles.title_id
INNER JOIN pubs.sales 
on pubs.titles.title_id = pubs.sales.title_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY total_sales DESC
LIMIT 3;

-- Challenge 4: sorry gladys have no idea how to include the 0's <3

SELECT authors.au_id, authors.au_fname, authors.au_lname, COALESCE(SUM(sales.qty), 0) AS total_sales
FROM pubs.authors
INNER JOIN pubs.titleauthor
ON pubs.authors.au_id = pubs.titleauthor.au_id
INNER JOIN pubs.titles
ON pubs.titleauthor.title_id = pubs.titles.title_id
INNER JOIN pubs.sales 
on pubs.titles.title_id = pubs.sales.title_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY total_sales DESC;



