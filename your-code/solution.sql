# challenge 1

CREATE TEMPORARY TABLE challenge
SELECT titles.title, publishers.pub_name, authors.au_id, authors.au_fname, authors.au_lname
FROM titles
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id;

# challenge 2

SELECT au_id, au_fname, au_lname, pub_name,  count(title)
from challenge
group by au_id, au_fname, au_lname, pub_name;

#challenge 3

SELECT authors.au_id, authors.au_fname, authors.au_lname, titleauthor.au_ord
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
order by au_ord DESC
limit 3;

#challenge 4

SELECT authors.au_id, authors.au_fname, authors.au_lname, titleauthor.au_ord
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
order by au_ord DESC;