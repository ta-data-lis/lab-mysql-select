/*Challenge 1*/
SELECT au.au_id AS 'AUTHOR ID',
au.au_lname AS 'LAST NAME',
au.au_fname AS 'FIRST NAME',
tt.title AS 'TITLE',
pub.pub_name AS 'PUBLISHER'
FROM Publications.titles as tt
INNER JOIN Publications.titleauthor as tau
ON tau.title_id = tt.title_id
INNER JOIN Publications.authors AS au
	ON au.au_id = tau.au_id 
INNER JOIN Publications.publishers as pub
	ON pub.pub_id = tt.pub_id;
	

/*Challenge 2*/
SELECT au.au_id AS 'AUTHOR ID',
au.au_lname AS 'LAST NAME',
au.au_fname AS 'FIRST NAME',
pub.pub_name AS 'PUBLISHER',
count(*) AS 'TITLE COUNT'
FROM Publications.titles as tt
INNER JOIN Publications.titleauthor as tau
ON tau.title_id = tt.title_id
INNER JOIN Publications.authors AS au
	ON au.au_id = tau.au_id 
INNER JOIN Publications.publishers as pub
	ON pub.pub_id = tt.pub_id
GROUP BY
	au.au_id,
	au.au_lname,
	au.au_fname,
	pub.pub_name; 
		
/*Challenge 3*/
SELECT au.au_id AS 'AUTHOR ID',
au.au_lname AS 'LAST NAME',
au.au_fname AS 'FIRST NAME',
sum(sa.qty) AS 'TOTAL'
FROM Publications.titles as tt
INNER JOIN Publications.titleauthor as tau
ON tau.title_id = tt.title_id
INNER JOIN Publications.authors AS au
	ON au.au_id = tau.au_id 
INNER JOIN Publications.sales as sa
	ON sa.title_id = tt.title_id
GROUP BY
	au.au_id,
	au.au_lname,
	au.au_fname
ORDER BY TOTAL DESC
LIMIT 3;
		
/*Challenge 4*/
SELECT au.au_id AS 'AUTHOR ID',
au.au_lname AS 'LAST NAME',
au.au_fname AS 'FIRST NAME',
IFNULL(sum(sa.qty),0) AS 'TOTAL'
FROM Publications.titles as tt
RIGHT JOIN Publications.sales as sa
	ON sa.title_id = tt.title_id
RIGHT JOIN Publications.titleauthor as tau
	ON tau.title_id = tt.title_id
RIGHT JOIN Publications.authors AS au
	ON au.au_id = tau.au_id 
GROUP BY
	au.au_id,
	au.au_lname,
	au.au_fname
ORDER BY TOTAL DESC;


	