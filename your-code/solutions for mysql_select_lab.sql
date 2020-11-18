select * from authors;


#Qu 1
select titleauthor.au_id as author_id,
	   authors.au_fname as first_name,
	   authors.au_lname as last_name,
	   titles.title as title,
	   publishers.pub_name as PUBLISHER
from titleauthor
left join authors
on authors.au_id =titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join publishers
on publishers.pub_id = titles.pub_id;
 
#counting rows to see if they match
select count(*)
from titleauthor;
#Qu 1

#Qu 2
select titleauthor.au_id as author_id,
	   authors.au_fname as first_name,
	   authors.au_lname as last_name,
	   publishers.pub_name as publisher,
       COUNT(titleauthor.title_id) as no_of_titles
from authors
join titleauthor ON authors.au_id = titleauthor.au_id 
join titles ON titleauthor.title_id = titles.title_id 
join publishers ON publishers.pub_id = titles.pub_id
group by author_id, first_name, last_name, publisher;

#Qu3
select titleauthor.au_id as author_id,
	   authors.au_fname as first_name,
	   authors.au_lname as last_name,
	   sum(sales.qty) as TOTAL
from authors
join titleauthor ON authors.au_id = titleauthor.au_id 
join titles ON titleauthor.title_id = titles.title_id 
join sales on titles.title_id = sales.title_id
group by author_id
order by TOTAL desc
limit 3;

select * from sales;