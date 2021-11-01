/* Challenge 1*/
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
from authors

inner join  titleauthor 
on authors.au_id = titleauthor.au_id

inner join titles
on titleauthor.title_id = titles.title_id

inner join publishers
on titles.pub_id = publishers.pub_id;





/*Challenge 2 Who Have Published How Many At Where*/
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', publishers.pub_name as 'PUBLISHER', Count(title) as 'TITLE COUNT'
from authors

inner join  titleauthor 
on authors.au_id = titleauthor.au_id

inner join titles
on titleauthor.title_id = titles.title_id

inner join publishers
on titles.pub_id = publishers.pub_id

group by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;






/*Challenge 3 - Best Selling Authors*/ 
Select *
From 
(select firstjoin.title_id, firstjoin.au_lname, firstjoin.au_fname
from (select title_id, au_lname, au_fname
from secondlab.titleauthor
inner join secondlab.authors
on secondlab.authors.au_id = secondlab.titleauthor.au_id) as firstjoin
inner join titles
on titles.title_id= firstjoin.title_id) as total
Inner join sales
ON total.title_id = sales.title_id
Limit 3;


/*Challenge 4 - Best Selling Authors Ranking*/
Select *
From 
(select firstjoin.title_id, firstjoin.au_lname, firstjoin.au_fname
from (select title_id, au_lname, au_fname
from secondlab.titleauthor
inner join secondlab.authors
on secondlab.authors.au_id = secondlab.titleauthor.au_id) as firstjoin
inner join titles
on titles.title_id= firstjoin.title_id) as total
Inner join sales
ON total.title_id = sales.title_id
order by sales.qty desc
limit 23;

