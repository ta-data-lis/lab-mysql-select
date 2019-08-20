#challenge 1 - who have published what at where?
select authors.au_id as "AUTHOR ID",authors.au_lname AS "AUTHOR LAST NAME" , authors.au_fname AS "AUTHOR FIRST NAME", titles.title "TITLE", publishers.pub_name as PUBLISHER
from titles
inner join titleauthor on titles.title_id = titleauthor.title_id
inner join publishers on publishers.pub_id = titles.pub_id
inner join authors on authors.au_id = titleauthor.au_id
order by 'AUTHOR ID';

# Challenge 2 - Who Have Published How Many At Where?
select authors.au_id as "AUTHOR ID",authors.au_lname AS "AUTHOR LAST NAME" , authors.au_fname AS "AUTHOR FIRST NAME", publishers.pub_name as PUBLISHER, count(titles.title) as "TITLE COUNT"
from titles
inner join titleauthor on titles.title_id = titleauthor.title_id
inner join publishers on publishers.pub_id = titles.pub_id
inner join authors on authors.au_id = titleauthor.au_id
group by publishers.pub_name, authors.au_id
order by count(titles.title) desc, "AUTHORS FIRST NAME";

# Challenge 3 - Best Selling Authors
select authors.au_id as "AUTHOR ID",authors.au_lname AS "AUTHOR LAST NAME" , authors.au_fname AS "AUTHOR FIRST NAME", sum(sales.qty) as "TOTAL"
from authors
inner join titleauthor on authors.au_id = titleauthor.au_id
inner join sales on sales.title_id = titleauthor.title_id
group by authors.au_id
order by sum(sales.qty) desc, "AUTHORS FIRST NAME"
limit 3;