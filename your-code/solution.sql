# LAB2 MySQL Select

## Challenge 1 - Who Have Published What At Where?


select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
from lab2.authors
join lab2.titleauthor 
on authors.au_id = titleauthor.au_id
join lab2.titles
on titleauthor.title_id = titles.title_id
join lab2.publishers
on publishers.pub_id = titles.pub_id;

## Challenge 2 - Who Have Published How Many At Where?

select authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, count(titles.title)
from lab2.authors
join lab2.titleauthor 
on authors.au_id = titleauthor.au_id
join lab2.titles
on titleauthor.title_id = titles.title_id
join lab2.publishers
on publishers.pub_id = titles.pub_id
group by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;


## Challenge 3 - Best Selling Authors

select authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) as TOTAL
from lab2.authors
join lab2.titleauthor 
on authors.au_id = titleauthor.au_id
join lab2.titles
on titleauthor.title_id = titles.title_id
join lab2.sales
on titles.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by TOTAL desc
limit 3;


## Challenge 4 - Best Selling Authors Ranking

create temporary table total_sales1
select authors.au_id, authors.au_lname, authors.au_fname, 
case when sum(sales.qty) > 0 then sum(sales.qty) else 0
end as TOTAL
from lab2.authors
left join lab2.titleauthor 
on authors.au_id = titleauthor.au_id
left join lab2.titles
on titleauthor.title_id = titles.title_id
left join lab2.sales
on titles.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by TOTAL desc;

select * from total_sales1;


