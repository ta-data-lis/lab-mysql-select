USE apps;

select * from titles;
select *from titleauthor;
select * from authors;
select * from publishers;
/* Challenge 1 - Who Have Published What At Where?*/
select ta.au_id "authorsid", au_lname "lastname au_lname", au_fname "first name", t.title"title", p.pub_name "publishers"
from titleauthor ta
join authors a on ta.au_id = a.au_id
join titles t on ta.title_id = t.title_id
join publishers p on t.pub_id = t.pub_id;

/* Challenge 2 - Who Have Published How Many At Where? */

select * from authors;
select * from titleauthor;
select * from publishers;
select * from titles;

select ta.au_id "author id", a.au_fname "fisrt name", p.pub_name "publishers", count(t.title) "title count"
from titleauthor ta
join authors on ta.au_id = a.au_id
join titles t on ta.title_id = t.title_id 
join publishers p on t.pub_id = p.pub_id
group by ta.au_id, p.pub_id
order by count(t.title) desc;
 

/* Challenge 3 - Best Selling Authors*/
select a.au_id "author id", a.au_lname "last name", a.au_fname"first name", sum(s.qty) "total"
from authors a 
join titleauthor ta on a.au_id = ta.au_id
join sales s on ta.title_id = s.title_id 
group by a.au_id
order by sum(s.qty)desc
limit 3; 


/* Challenge 4 - Best Selling Authors Ranking*/

