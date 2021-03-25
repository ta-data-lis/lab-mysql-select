SELECT titleauthor.au_id AS Author, authors.au_lname AS Lastname, authors.au_fname AS Firstname, count(distinct titleauthor.title_id) as Titles
FROM titleauthor
LEFT JOIN authors ON authors.au_id = titleauthor.au_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY Titles DESC, Lastname;