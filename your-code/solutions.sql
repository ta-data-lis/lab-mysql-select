Use publications;
SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, publishers.pub_name 
FROM authors
JOIN titleauthor
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN publishers
ON publishers.pub_id = titles.pub_id;

SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, publishers.pub_name,count(titles.title) AS Title_count
FROM authors
JOIN titleauthor
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY title
ORDER BY Last_name ASC;

SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, sum(sales.qty)as quantity
FROM authors
JOIN titleauthor
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY title
ORDER BY quantity DESC
LIMIT 3;

/** to finish SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, sales.qty
FROM authors
JOIN titleauthor
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id; **\


