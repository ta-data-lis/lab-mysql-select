select * from titleauthor;

# 1st Challenge
select authors.au_id as "AUTHOR ID",authors.au_lname AS "AUTHOR LAST NAME" ,
authors.au_fname AS "AUTOR FIRST NAME", titles.title "TITLE", publishers.pub_name as PUBLISHER
from titles
inner join titleauthor on titles.title_id = titleauthor.title_id
inner join publishers on publishers.pub_id = titles.pub_id
INNER JOIN authors on authors.au_id = titleauthor.au_id
order by PUBLISHER;

# 2nd Challenge
select authors.au_id as "AUTHOR ID",authors.au_lname AS "LAST NAME" ,
authors.au_fname AS "FIRST NAME", publishers.pub_name as PUBLISHER, COUNT(titles.title) "TITLE COUNT"
from titles
inner join publishers on publishers.pub_id = titles.pub_id
inner join titleauthor on titles.title_id = titleauthor.title_id
INNER JOIN authors on authors.au_id = titleauthor.au_id
GROUP BY publishers.pub_name, authors.au_id
order by COUNT(titles.title) desc, publishers.pub_name;

# 3rd Challenge
select authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", sum(sales.qty) as "Total"
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join sales on sales.title_id = titleauthor.title_id
Group by authors.au_id
order by sum(sales.qty) desc
limit 3;

# 4th Challenge
select authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", IFNULL(sum(sales.qty),0) as "Total"
from titles
join titleauthor on titles.title_id = titleauthor.title_id
join sales on sales.title_id = titleauthor.title_id
right join authors on titleauthor.au_id = authors.au_id
Group by authors.au_id
order by sum(sales.qty) desc
limit 23;