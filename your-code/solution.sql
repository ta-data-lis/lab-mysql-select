USE database_name3;


SELECT ta.au_id,a.au_lname,a.au_fname,t.title,p.pub_name FROM titles t

LEFT JOIN titleauthor ta  ON t.title_id = ta.title_id 
LEFT JOIN authors a ON ta.au_id = a.au_id 
LEFT JOIN publishers p on t.pub_id = p.pub_id 


SELECT ta.au_id,a.au_lname,a.au_fname,p.pub_name,COUNT(t.title) FROM titles t

LEFT JOIN titleauthor ta  ON t.title_id = ta.title_id 
LEFT JOIN authors a ON ta.au_id = a.au_id 
LEFT JOIN publishers p on t.pub_id = p.pub_id 
GROUP BY ta.au_id,p.pub_name;

SELECT a.au_id,a.au_lname,a.au_fname,sum(s2.qty) FROM authors a 

LEFT JOIN titleauthor t3 ON t3.au_id = a.au_id 
LEFT JOIN sales s2  on s2.title_id  = t3.title_id
GROUP BY 1,2,3
ORDER BY 4 DESC
LIMIT 3;

SELECT a.au_id,a.au_lname,a.au_fname,IFNULL(sum(s2.qty),0) FROM authors a 

LEFT JOIN titleauthor t3 ON t3.au_id = a.au_id 
LEFT JOIN sales s2  on s2.title_id  = t3.title_id
GROUP BY 1,2,3
ORDER BY 4 DESC


