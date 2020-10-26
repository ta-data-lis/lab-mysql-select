/*what titles each author has published at which publishers.*/
SELECT A.au_id, A.au_fname, A.au_lname, T.title, P.pub_name
FROM authors A
INNER JOIN titleauthor TA ON TA.au_id = A.au_id
INNER JOIN titles T ON T.title_id = TA.title_id
INNER JOIN publishers P ON P.pub_id = T.pub_id
ORDER BY A.au_id;

SELECT * FROM authors;
SELECT * FROM titleauthor;
SELECT * FROM titles;
SELECT * FROM publishers;
/*what titles each author has published at which publishers.*/
SELECT COUNT(*)
FROM authors, titleauthor, titles, publishers;

/*Challenge 2 - Who Have Published How Many At Where?*/
/*query how many titles each author has published at each publisher*/
SELECT A.au_id, A.au_fname, A.au_lname, P.pub_name, Count(T.title) as "Title count"
FROM authors A
INNER JOIN titleauthor TA ON TA.au_id = A.au_id
INNER JOIN titles T ON T.title_id = TA.title_id
INNER JOIN publishers P ON P.pub_id = T.pub_id
GROUP BY A.au_id, A.au_fname, A.au_lname, P.pub_name
ORDER BY A.au_id;

/*Challenge 4 - Best Selling Authors*/

SELECT A.au_id, A.au_fname, A.au_lname, sum(ytd_sales) as totals
FROM authors A
INNER JOIN titleauthor TA ON TA.au_id = A.au_id
INNER JOIN titles T ON T.title_id = TA.title_id
GROUP BY A.au_id, A.au_fname, A.au_lname
ORDER BY totals DESC
LIMIT 3;

