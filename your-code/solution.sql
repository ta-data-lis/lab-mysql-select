-- Challenge 1
SELECT
au_id AS `AUTHOR ID`,
au_lname AS `LAST NAME`,
au_fname AS `FIRST NAME`,
title AS `TITLE`,
pub_name AS `PUBLISHER`
FROM
((SELECT * FROM titles
INNER JOIN
(SELECT * FROM authors
INNER JOIN (
SELECT titleauthor.au_id AS auth_id, title_id AS tit_id
FROM titleauthor) AS mini_tit_aut
ON authors.au_id = mini_tit_aut.auth_id) AS mini_auts
ON titles.title_id = mini_auts.tit_id) AS almost_final
INNER JOIN (SELECT pub_id AS publ_id, pub_name
FROM publishers) AS mini_pub
ON almost_final.pub_id = mini_pub.publ_id);

-- Challenge 2

CREATE TABLE book_author_list
SELECT
au_id AS `AUTHOR ID`,
au_lname AS `LAST NAME`,
au_fname AS `FIRST NAME`,
title AS `TITLE`,
pub_name AS `PUBLISHER`
FROM
((SELECT * FROM titles
INNER JOIN
(SELECT * FROM authors
INNER JOIN (
SELECT titleauthor.au_id AS auth_id, title_id AS tit_id
FROM titleauthor) AS mini_tit_aut
ON authors.au_id = mini_tit_aut.auth_id) AS mini_auts
ON titles.title_id = mini_auts.tit_id) AS almost_final
INNER JOIN (SELECT pub_id AS publ_id, pub_name
FROM publishers) AS mini_pub
ON almost_final.pub_id = mini_pub.publ_id);

SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `PUBLISHER`, COUNT(`TITLE`) AS `TITLE COUNT`
FROM book_author_list
GROUP BY `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `PUBLISHER`;

SELECT SUM(`TITLE COUNT`)
FROM
(SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `PUBLISHER`, COUNT(`TITLE`) AS `TITLE COUNT`
FROM book_author_list) AS challenge_2;

-- Challenge 3
SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, SUM(qty) AS TOTAL
FROM
(SELECT * FROM
(SELECT * FROM book_author_list
INNER JOIN
(SELECT titles.title_id AS book_id, titles.title AS book_name
FROM titles) AS mini_book
ON book_author_list.`TITLE` = mini_book.book_name) AS second_join
INNER JOIN
(SELECT sales.title_id, sales.qty
FROM sales) AS mini_sales
ON second_join.book_id = mini_sales.title_id) AS last_table
GROUP BY `AUTHOR ID`
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4
SELECT auth_id AS `AUTHOR ID`,
au_lname AS `LAST NAME`,
au_fname AS `FIRST NAME`,
COALESCE(SUM(qty), 0)  AS `TOTAL`
FROM
(SELECT * FROM
((SELECT authors.au_id AS auth_id, au_lname, au_fname
FROM authors) AS mini_au
LEFT JOIN
titleauthor
ON mini_au.auth_id = titleauthor.au_id)
LEFT JOIN 
(SELECT qty, title_id AS tit_id
FROM sales) AS mini_sales
ON titleauthor.title_id = mini_sales.tit_id) AS something
GROUP BY `AUTHOR ID`
ORDER BY `TOTAL` DESC;