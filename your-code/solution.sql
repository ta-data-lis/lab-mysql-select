use lab_mysql;

select titleauthor.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
titles.title as TITLE,
publishers.pub_name as PUBLISHER
from titleauthor 
left join authors on authors.au_id = titleauthor.au_id
left join titles on titles.title_id = titleauthor.title_id
left join publishers on publishers.pub_id = titles.pub_id
order by titleauthor.au_id;

select titleauthor.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
publishers.pub_name as PUBLISHER,
count(titles.title_id) as TITLE_COUNT
from titleauthor 
left join authors on authors.au_id = titleauthor.au_id
left join titles on titles.title_id = titleauthor.title_id
left join publishers on publishers.pub_id = titles.pub_id
group by titleauthor.au_id, publishers.pub_name
order by titleauthor.au_id DESC;


select titleauthor.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
sum(sales.qty) as TOTAL
from titleauthor 
left join authors on authors.au_id = titleauthor.au_id
left join sales on sales.title_id = titleauthor.title_id
group by titleauthor.au_id
order by sum(sales.qty) desc
limit 3;


select titleauthor.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME,
authors.au_fname as FIRST_NAME,
sum(sales.qty) as TOTAL
from titleauthor 
left join authors on authors.au_id = titleauthor.au_id
left join sales on sales.title_id = titleauthor.title_id
group by titleauthor.au_id
order by sum(sales.qty) desc
limit 23;
