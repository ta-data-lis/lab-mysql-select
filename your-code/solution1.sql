SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM newlabs.authors
INNER JOIN newlabs.titleauthor
ON newlabs.authors.au_id = newlabs.titleauthor.au_id
INNER JOIN newlabs.titles
ON newlabs.titleauthor.title_id = newlabs.titles.title_id
INNER JOIN newlabs.publishers
ON newlabs.titles.pub_id = newlabs.publishers.pub_id
ORDER BY titleauthor.au_id ASC; 

