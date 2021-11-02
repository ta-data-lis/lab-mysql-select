
/* CHALLENG 1*/
SELECT apple_store.authors.au_id AS Author_id, apple_store.authors.au_lname AS Last_Name,
apple_store.authors.au_fname AS First_Name, apple_store.titles.title AS title, 
apple_store.publishers.pub_name AS Publishers
FROM apple_store.authors, apple_store.titles, apple_store.publishers;

/* CHALLENG 2*/
SELECT apple_store.authors.au_id AS Author_id, apple_store.authors.au_lname AS Last_Name,
apple_store.authors.au_fname AS First_Name, apple_store.publishers.pub_name AS Publishers, 
COUNT(apple_store.titles.title)
FROM apple_store.authors, apple_store.titles, apple_store.publishers;

SELECT au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', pub_name AS 'PUBLISHER', 
COUNT(title)
FROM apple_store.authors, apple_store.titles, apple_store.publishers
GROUP BY pub_name, au_id
ORDER BY COUNT(title) DESC;

SELECT au_id AS AUTHOR_ID, au_lname AS Last_Name, au_fname AS First_Name, 
COUNT(title) AS TITLE_COUNT, pub_name AS Publisher, count(pub_name) 
FROM apple_store.titles
INNER JOIN (SELECT apple_store.authors.au_id, au_lname, au_fname, title_id
FROM apple_store.authors
INNER JOIN apple_store.titleauthor
ON apple_store.authors.au_id = apple_store.titleauthor.au_id) as select_title_id
ON apple_store.titles.title_id = apple_store.select_title_id.title_id
INNER JOIN apple_store.publishers
ON apple_store.publishers.pub_id = apple_store.titles.pub_id
GROUP BY apple_store.authors.AUTHOR_ID, Publisher, apple_store.authors.Last_Name, 
apple_store.authors.First_Name;

/* Challenge 3 - Best Selling Authors 
Who are the top 3 authors who have sold the highest number of titles?
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.*/


SELECT apple_store.authors.au_id, au_lname, au_fname, count(title)
FROM apple_store.sales
INNER JOIN apple_store.titles
ON apple_store.sales.title_id = apple_store.titles.title_id
INNER JOIN apple_store.titleauthor
ON apple_store.titles.title_id = apple_store.titleauthor.title_id
INNER JOIN apple_store.authors
ON apple_store.titleauthor.au_id = apple_store.authors.au_id
GROUP BY au_id, title
ORDER BY count(title) DESC
LIMIT 3;


/* CHALLENGE 4 
Now modify your solution in Challenge 3
so that the output will display all 23 authors instead of the top 3.
 Note that the authors who have sold 0 titles should also appear in your output
 (ideally display 0 instead of NULL as the TOTAL).
 Also order your results based on TOTAL from high to low*/





