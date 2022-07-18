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

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, pub_name, count(pub_name)
from pubs.authors
INNER JOIN pubs.titleauthor
ON pubs.authors.au_id = pubs.titleauthor.au_id
INNER JOIN pubs.titles
ON pubs.titleauthor.title_id = pubs.titles.title_id
INNER JOIN pubs.publishers
ON pubs.titles.pub_id = pubs.publishers.pub_id
WHERE au;

