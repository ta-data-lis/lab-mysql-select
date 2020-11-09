SELECT authors.au_id,authors.au_lname, authors.au_fname, publishers.pub_name, titles.title_id
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, titleauthor.title_id, publishers.pub_id, titles.title_id
ORDER BY titleauthor.title_id DESC;
