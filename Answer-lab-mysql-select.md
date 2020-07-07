/*In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at 
which publishers. Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published
Your output will look something like below: */

SELECT aut.au_id AS 'AUTHOR ID',
	   aut.au_lname AS 'LAST NAME', 
       aut.au_fname AS 'FIRST NAME',
       pb.title AS 'TITLE',
       pub.pub_name AS 'PUBLISHER'
  FROM publications.titles AS pb
		JOIN publications.titleauthor as ta
			ON ta.title_id = pb.title_id
    
		JOIN publications.authors AS aut  
			ON aut.au_id = ta.au_id
    
		JOIN publications.publishers as pub
			ON pub.pub_id = pb.pub_id;

/* Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:*/

SELECT aut.au_id AS 'AUTHOR ID',
	   aut.au_lname AS 'LAST NAME', 
       aut.au_fname AS 'FIRST NAME',
       pub.pub_name AS 'PUBLISHER',
       COUNT(*) AS 'TITLE COUNT'
  FROM publications.titles AS pb
		JOIN publications.titleauthor as ta
			ON ta.title_id = pb.title_id
    
		JOIN publications.authors AS aut  
			ON aut.au_id = ta.au_id
    
		JOIN publications.publishers as pub
			ON pub.pub_id = pb.pub_id
            
GROUP BY 1, 4
ORDER BY 1 DESC;

/* Challenge 3 - Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
Requirements:
Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors. */ 

SELECT aut.au_id AS 'AUTHOR ID',
	   aut.au_lname AS 'LAST NAME', 
       aut.au_fname AS 'FIRST NAME',
       SUM(sa.qty) AS 'TOTAL'
  FROM publications.titles as pb
		JOIN publications.titleauthor as ta
			ON ta.title_id = pb.title_id
    
		JOIN publications.authors AS aut  
			ON aut.au_id = ta.au_id
    
		JOIN publications.sales as sa
			ON sa.title_id = pb.title_id
            
GROUP BY 1, 2, 3
ORDER BY 4 DESC
LIMIT 3;

 /* Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL).
 Also order your results based on TOTAL from high to low. */
 
 SELECT aut.au_id AS 'AUTHOR ID',
	    aut.au_lname AS 'LAST NAME', 
        aut.au_fname AS 'FIRST NAME',
        IFNULL(SUM(sa.qty), 0) AS 'TOTAL'
  FROM publications.titles AS pb
		RIGHT JOIN publications.sales AS sa
				ON sa.title_id = pb.title_id
                
		RIGHT JOIN publications.titleauthor AS ta
				ON ta.title_id = pb.title_id
                
		RIGHT JOIN publications.authors AS aut
				ON aut.au_id = ta.au_id
                
GROUP BY 1, 2, 3
ORDER BY 4 DESC ; 