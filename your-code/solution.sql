
/*Creating AuthorsID*/

SELECT authors.au_id,authors.au_lname, authors.au_fname, publishers.pub_name, titles.title_id
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, titleauthor.title_id, publishers.pub_id, titles.title_id
ORDER BY titleauthor.title_id DESC;

/*From AuthorsID 2 & 3 */

SELECT titleauthor.au_id AS Author, authors.au_lname AS Lastname, authors.au_fname AS Firstname, count(distinct titleauthor.title_id) as Titles
FROM titleauthor
LEFT JOIN authors ON authors.au_id = titleauthor.au_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY Titles DESC, Lastname;

SELECT titleauthor.au_id AS Author, authors.au_lname AS Lastname, authors.au_fname AS Firstname, sum(sales.qty) AS Sales
FROM titleauthor
LEFT JOIN authors ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY Sales DESC, Lastname
LIMIT 3;