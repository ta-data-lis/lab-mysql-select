/*CHALLENGE 1*/
/*Who Has Published What At Where?*/

SELECT authors.au_id AS "AUTHOR ID", 
au_lname AS "LAST NAME", 
au_fname AS "FIRST NAME", 
title AS "TITLE", 
pub_name AS "PUBLISHER"  
FROM labSQL1.authors
LEFT JOIN labSQL1.titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN labSQL1.titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN labSQL1.publishers
ON publishers.pub_id = titles.pub_id; 


/*CHALLENGE 2*/
/*Who Has Published How Many At Where?*/

SELECT authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
publishers.pub_name AS "PUBLISHER",  
COUNT(title) AS "TITLECOUNT"
FROM labSQL1.titleauthor
INNER JOIN labSQL1.authors
ON titleauthor.au_id = authors.au_id  
INNER JOIN labSQL1.titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN labSQL1.publishers
ON publishers.pub_id = titles.pub_id
GROUP BY titleauthor.au_id, publishers.pub_id
ORDER BY TITLECOUNT DESC; 


/*CHALLENGE 3*/
/*Best Selling Authors: Who are the top 3 authors who have sold the highest number of titles?*/

SELECT authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
publishers.pub_name AS "PUBLISHER",  
COUNT(title) AS "TITLECOUNT"
FROM labSQL1.titleauthor
INNER JOIN labSQL1.authors
ON titleauthor.au_id = authors.au_id  
INNER JOIN labSQL1.titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN labSQL1.publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY TITLECOUNT DESC
LIMIT 3;


/*CHALLENGE 4*/
/*Best Selling Authors Ranking*/


SELECT authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
publishers.pub_name AS "PUBLISHER",  
COUNT(title) AS "TITLECOUNT"
FROM labSQL1.titleauthor
INNER JOIN labSQL1.authors
ON titleauthor.au_id = authors.au_id  
INNER JOIN labSQL1.titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN labSQL1.publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY TITLECOUNT DESC;
