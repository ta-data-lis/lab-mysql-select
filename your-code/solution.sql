SELECT titles.title, publishers.pub_name, authors.au_id, authors.au_fname, authors.au_lname 
FROM titles
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id;

