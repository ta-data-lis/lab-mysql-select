## Challenge 1 - Who Have Published What At Where?

#In this challenge you will write a MySQL `SELECT` query that joins various tables to 
#figure out what titles each author has published at which publishers. 
    
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',
	t.title AS 'TITLE', pub_name AS 'PUBLISHER' 
FROM lab2_select.authors AS a 
	JOIN lab2_select.titleauthor AS a_t ON a_t.au_id = a.au_id
	JOIN lab2_select.titles AS t ON a_t.title_id = t.title_id
    JOIN lab2_select.publishers AS p ON t.pub_id = p.pub_id
    ORDER BY a.au_id;
#--returns 25 rows
#--check:
SELECT count(*) FROM lab2_select.titleauthor; #--25 is expected row count



## Challenge 2 - Who Have Published How Many At Where?

#Elevating from your solution in Challenge 1, query how many titles each author 
#has published at each publisher. 
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',
	pub_name AS 'PUBLISHER', count(t.title_id) AS 'TITLE_COUNT'
FROM lab2_select.authors AS a 
	JOIN lab2_select.titleauthor AS a_t ON a_t.au_id = a.au_id
	JOIN lab2_select.titles AS t ON a_t.title_id = t.title_id
    JOIN lab2_select.publishers AS p ON t.pub_id = p.pub_id
    GROUP BY a.au_id, a.au_lname, a.au_fname, pub_name
    ORDER BY count(t.title_id) DESC, a.au_id DESC;



## Challenge 3 - Best Selling Authors

#Who are the top 3 authors who have sold the highest number of titles? Write a query 
#to find out.

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',
sum(s.qty) AS 'TOTAL'
FROM lab2_select.authors AS a 
	JOIN lab2_select.titleauthor AS a_t ON a_t.au_id = a.au_id
	JOIN lab2_select.titles AS t ON a_t.title_id = t.title_id
    JOIN lab2_select.sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY sum(s.qty) DESC LIMIT 3;

#--AUTHOR ID	LAST NAME	FIRST NAME	TOTAL
#--899-46-2035	Ringer		Anne		148
#--998-72-3567	Ringer		Albert		133
#--213-46-8915	Green		Marjorie	50



## Challenge 4 - Best Selling Authors Ranking

#Now modify your solution in Challenge 3 so that the output will display all 
#23 authors instead of the top 3. Note that the authors who have sold 0 titles 
#should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). 
#Also order your results based on `TOTAL` from high to low.

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',
CASE WHEN sum(s.qty) > 0 THEN sum(s.qty)
	ELSE 0
END AS 'TOTAL'
FROM lab2_select.authors AS a 
	LEFT JOIN lab2_select.titleauthor AS a_t ON a_t.au_id = a.au_id
	LEFT JOIN lab2_select.titles AS t ON a_t.title_id = t.title_id
    LEFT JOIN lab2_select.sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY sum(s.qty) DESC;
