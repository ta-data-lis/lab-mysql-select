SELECT titleauthor.au_id AS Author, authors.au_lname AS Lastname, authors.au_fname AS Firstname, sum(sales.qty) AS Sales
FROM titleauthor
LEFT JOIN authors ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY Sales DESC, Lastname;