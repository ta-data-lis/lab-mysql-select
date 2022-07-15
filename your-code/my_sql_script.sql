SELECT *
FROM publications.authors;


SELECT publications.authors.au_id, publications.authors.au_lname,publications.authors.au_fname
FROM publications.authors
INNER JOIN publications.titleauthor
ON publications.authors.au_id=publications.titleauthor.au_id
INNER JOIN publications.titles
ON publications.titleauthor.title_id=publications.titles.title_id
INNER JOIN publications.publishers
ON publications.titles.pub_id=publications.publishers.pub_id;






