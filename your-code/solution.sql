SELECT *
FROM authors;

SELECT *
FROM titles;

SELECT *
FROM titleauthor;

SELECT *
FROM publishers;

/* CHALLENGE 1 */

SELECT titleauthor.au_id, au_lname, au_fname, title, pub_name
FROM titleauthor
	INNER JOIN authors
	ON titleauthor.au_id = authors.au_id
	INNER JOIN titles
	ON titleauthor.title_id = titles.title_id
    INNER JOIN publishers
    ON titles.pub_id = publishers.pub_id
    ORDER BY titleauthor.au_id;
    
/* CHALLENGE 2 */

SELECT titleauthor.au_id, au_lname, au_fname, pub_name, COUNT(titles.title_id) AS Title_count
FROM titleauthor
	INNER JOIN authors
	ON titleauthor.au_id = authors.au_id
	INNER JOIN titles
	ON titleauthor.title_id = titles.title_id
    INNER JOIN publishers
    ON titles.pub_id = publishers.pub_id
    GROUP BY titleauthor.au_id, pub_name
    ORDER BY titleauthor.au_id DESC;
    
    /* CHALLENGE 3 */
    
    SELECT authors.au_id, au_lname, au_fname, SUM(sales.qty) AS Total
	FROM authors
	LEFT JOIN titleauthor
	ON titleauthor.au_id = authors.au_id
	LEFT JOIN sales
	ON titleauthor.title_id  = sales.title_id
    GROUP BY authors.au_id
    ORDER BY Total DESC
	LIMIT 3;
    
/* CHALLENGE 4 */
    
    SELECT authors.au_id, au_lname, au_fname, IFNULL(SUM(sales.qty),0) AS Total
	FROM authors
	LEFT JOIN titleauthor
	ON titleauthor.au_id = authors.au_id
	LEFT JOIN sales
	ON titleauthor.title_id  = sales.title_id
    GROUP BY authors.au_id
    ORDER BY Total DESC;

