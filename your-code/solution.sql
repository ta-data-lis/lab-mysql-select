#Challenge 1

select titleauthor.au_id as "ID Author", au_lname as "Last Name", au_fname as "First Name", title as "Title", pub_name as "Publication"
from lab2.titleauthor
left join authors
on titleauthor.au_id = authors.au_id
inner join lab2.titles
on titleauthor.title_id = titles.title_id
inner join lab2.publishers
on publishers.pub_id = titles.pub_id;


#Challenge 2
select titleauthor.au_id as "ID Author", au_lname as "Last Name", au_fname as "First Name", title as "Title", pub_name as "Publication", count(titleauthor.title_id) as "Title Count"
from lab2.titleauthor
left join authors
on titleauthor.au_id = authors.au_id
inner join lab2.titles
on titleauthor.title_id = titles.title_id
inner join lab2.publishers
on publishers.pub_id = titles.pub_id
group by titleauthor.au_id, au_lname, au_fname, pub_name
order by titleauthor.au_id desc;

#Challenge 3
select titleauthor.au_id as "ID Author", au_lname as "Last Name", au_fname as "First Name",sum(qty) as "Total"
from lab2.titleauthor
left join authors
on titleauthor.au_id = authors.au_id
inner join lab2.titles
on titleauthor.title_id = titles.title_id
left join lab2.sales
on titles.title_id = sales.title_id
group by titleauthor.au_id, au_lname, au_fname, qty
order by qty desc limit 3;

#Challenge 4
select authors.au_id as "ID Author", au_lname as "Last Name", au_fname as "First Name",sum(qty) as "Total"
from lab2.authors
left join titleauthor
on titleauthor.au_id = authors.au_id
left join lab2.titles
on titleauthor.title_id = titles.title_id
left join lab2.sales
on titles.title_id = sales.title_id
group by authors.au_id
order by qty desc
