/* Challenge 1 - Who Have Published What At Where? */

/* The requested table */
SELECT TA.au_id, au_lname, au_fname, title, pub_name
FROM ironhack.authors A
INNER JOIN ironhack.titleauthor TA ON A.au_id = TA.au_id
INNER JOIN ironhack.titles T ON TA.title_id = T.title_id 
INNER JOIN ironhack.publishers P ON T.pub_id = P.pub_id;

SELECT COUNT(*)
FROM (
SELECT au_fname, au_lname, title, TA.au_id, pub_name
FROM ironhack.authors A
INNER JOIN ironhack.titleauthor TA ON A.au_id = TA.au_id
INNER JOIN ironhack.titles T ON TA.title_id = T.title_id 
INNER JOIN ironhack.publishers P ON T.pub_id = P.pub_id) alias;
/* the table created has 25 lines */

SELECT COUNT(*)
FROM ironhack.titleauthor;
/* table titleauthor also has 25 lines, yeay! */

/* Challenge 2 - Who Have Published How Many At Where? */
SELECT TA.au_id, au_lname, au_fname, pub_name, count(title) AS "title_count"
FROM ironhack.authors A
INNER JOIN ironhack.titleauthor TA ON A.au_id = TA.au_id
INNER JOIN ironhack.titles T ON TA.title_id = T.title_id 
INNER JOIN ironhack.publishers P ON T.pub_id = P.pub_id
GROUP BY au_id, pub_name;

/* Challenge 3 - Best Selling Authors */
SELECT A.au_id, au_lname, au_fname, sum(ytd_sales) AS "total"
FROM ironhack.authors A
INNER JOIN ironhack.titleauthor TA ON A.au_id = TA.au_id
INNER JOIN ironhack.titles T ON TA.title_id = T.title_id 
GROUP BY A.au_id
ORDER BY total DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking */
SELECT A.au_id, au_lname, au_fname, COALESCE(sum(ytd_sales),0) AS "total"
FROM ironhack.authors A
LEFT JOIN ironhack.titleauthor TA ON A.au_id = TA.au_id
LEFT JOIN ironhack.titles T ON TA.title_id = T.title_id 
GROUP BY A.au_id
ORDER BY total DESC;