
# 1
select authors.au_id as Author_id, authors.au_lname as Author_LastName, authors.au_fname as Author_FirstName, titles.title as Title, publishers.pub_name as Publisher
from titles  # takes more than one argument
inner join publishers on publishers.pub_id = titles.pub_id
join titleauthor on titles.title_id = titleauthor.title_id
join authors on titleauthor.au_id = authors.au_id
;

# 2
select titleauthor.au_id as Author_id, authors.au_lname as Author_LastName, authors.au_fname as Author_FirstName, count(titles.title) as `#Titles`, publishers.pub_name as Publisher
from titles # takes more than one argument
join publishers on publishers.pub_id = titles.pub_id
join titleauthor on titles.title_id = titleauthor.title_id
join authors on titleauthor.au_id = authors.au_id
group by titleauthor.au_id , publishers.pub_name
;

# 3
select * from sales;

select titleauthor.au_id as Author_id, authors.au_lname as Author_LastName, authors.au_fname as Author_FirstName, count(sales.title_id) as `Total Titles Sold`
from titles
join titleauthor on titles.title_id = titleauthor.title_id
join authors on titleauthor.au_id = authors.au_id
join sales on sales.title_id = titles.title_id
group by authors.au_id
order by `Total Titles Sold` desc
limit 0,3
;

#4
select authors.au_id as Author_id, authors.au_lname as Author_LastName, authors.au_fname as Author_FirstName, count(sales.title_id) as `Total Titles Sold`
from titles
join sales on sales.title_id = titles.title_id
join titleauthor on titles.title_id = titleauthor.title_id
right join authors on titleauthor.au_id = authors.au_id
group by authors.au_id
order by `Total Titles Sold` desc
limit 0,23
;


