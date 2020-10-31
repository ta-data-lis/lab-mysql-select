--1)

select authors.au_id as 'AUTHORS ID' , authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME' , titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER', titles.pubdate 'TITLE' , titles.price as 'PRICE', titles.title_id as 'TITLE ID'
from authors
inner join titleauthor
on authors.au_id=titleauthor.au_id
inner join titles
on titleauthor.title_id=titles.title_id
inner join publishers
on titles.pub_id=publishers.pub_id;

--2)

select authors.au_id,authors.au_lname, authors.au_fname, publishers.pub_name, count(titles.title_id)
from authors
inner join titleauthor
on authors.au_id=titleauthor.au_id
inner join titles
on titleauthor.title_id=titles.title_id
inner join publishers
on titles.pub_id=publishers.pub_id
group by authors.au_id, publishers.pub_id
order by authors.au_id desc;

--3)

select authors.au_id as 'AUTHORS ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',sum(titles.ytd_sales) as 'TOTAL'
from authors
inner join titleauthor
on authors.au_id=titleauthor.au_id
inner join titles
on titleauthor.title_id=titles.title_id
inner join publishers
on titles.pub_id=publishers.pub_id
group by titles.title
order by total desc
limit 3;

--4)

select authors.au_id as 'AUTHORS ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',sum(titles.ytd_sales) as 'TOTAL'
from authors
left join titleauthor
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join publishers
on titles.pub_id=publishers.pub_id
group by titles.title
order by total desc;