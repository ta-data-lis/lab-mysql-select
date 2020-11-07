USE database_name;

select titleauthor.au_id as AUTOR_ID,
	   authors.au_lname as LAST_NAME,
	   authors.au_fname as FIRST_NAME,
	   titles.title as TITLE,
	   publishers.pub_name as PUBLISHER
from titleauthor
left join authors
on authors.au_id =titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join publishers
on publishers.pub_id = titles.pub_id;



select titleauthor.au_id as AUTOR_ID,
	   authors.au_lname as LAST_NAME,
	   authors.au_fname as FIRST_NAME,
	   publishers.pub_name as PUBLISHER,
	   count(titles.title_id) as TITLE_COUNT 
from titleauthor
left join authors 
on authors.au_id = titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join publishers
on publishers.pub_id = titles.pub_id
group by AUTOR_ID,LAST_NAME,FIRST_NAME,PUBLISHER
;

select titleauthor.au_id as AUTOR_ID,
	   authors.au_lname as LAST_NAME,
	   authors.au_fname as FIRST_NAME,
	   sum(sales.qty) as  TOTAL
from titleauthor
left join authors 
on authors.au_id = titleauthor.au_id
left join sales 
on sales.title_id = titleauthor.title_id 
group by AUTOR_ID,LAST_NAME,FIRST_NAME
order by TOTAL desc 
limit 3
;

select authors.au_id as AUTOR_ID,
	   authors.au_lname as LAST_NAME,
	   authors.au_fname as FIRST_NAME,
	   IFNULL(sum(sales.qty), 0) as  TOTAL
from authors
left join titleauthor 
on authors.au_id = titleauthor.au_id
left join sales 
on sales.title_id = titleauthor.title_id 
group by AUTOR_ID,LAST_NAME,FIRST_NAME
order by TOTAL desc;
