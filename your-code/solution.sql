SELECT authors.au_id,authors.au_lname, authors.au_fname, publishers.pub_name
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers ON titleauthor.pub_id = publishers.pub_id
LEFT JOIN titles on titleauthor.title_id = titles.title_id
GROUP BY authors.au_id, titleauthor.title_id, publishers.pub_id
ORDER BY titleauthor.title_id DESC;
