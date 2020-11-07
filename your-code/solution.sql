USE  labselect;

Select * from authors;

#First challenge:
SELECT  t2.au_id AS AuthorID, a2.au_lname AS LastName, a2.au_lname AS FirstName,  t3.title AS Title, p.pub_name AS Publisher from titles t3 
LEFT JOIN titleauthor t2 ON t2.title_id = t3.title_id 
LEFT JOIN authors a2 ON a2.au_id = t2.au_id
LEFT JOIN publishers p on  p.pub_id = t3.pub_id

#Second challenge:

SELECT  t2.au_id AS AuthorID, a2.au_lname AS LastName, a2.au_lname AS FirstName,  COUNT(t3.title) AS TitleCount, p.pub_name AS Publisher from titles t3 
LEFT JOIN titleauthor t2 ON t2.title_id = t3.title_id 
LEFT JOIN authors a2 ON a2.au_id = t2.au_id
LEFT JOIN publishers p on  p.pub_id = t3.pub_id
GROUP by AuthorID, Publisher


#Third challenge:

SELECT  t2.au_id AS AuthorID, a2.au_lname AS LastName, a2.au_fname  AS FirstName, SUM(s.qty) AS Sales from titles t3 
LEFT JOIN titleauthor t2 ON t2.title_id = t3.title_id 
LEFT JOIN authors a2 ON a2.au_id = t2.au_id
LEFT JOIN sales s on  s.title_id = t3.title_id
GROUP by AuthorID ORDER BY Sales DESC LIMIT 3


#Fourth challenge:

SELECT  authors.au_id AS AuthorID, authors.au_lname AS LastName, authors.au_fname  AS FirstName, IFNULL(SUM(sales.qty),0) AS Sales from authors
LEFT JOIN titleauthor ON  titleauthor.au_id = authors.au_id
LEFT JOIN sales ON  sales.title_id = titleauthor.title_id
GROUP by 1,2,3 ORDER BY Sales DESC






