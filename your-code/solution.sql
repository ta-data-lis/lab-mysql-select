#Challenge1
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id;

#Challenge2
SELECT authors.au_id, authors.au_lname, authors.au_fname,
publishers.pub_name, count(authors.au_id) AS TOTAL
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;

#Challenge3
SELECT authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) as TOTAL
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

#Challenge4
SELECT authors.au_id, authors.au_lname, authors.au_fname, COALESCE(sum(sales.qty),0) as TOTAL
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON titles.title_id=sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;