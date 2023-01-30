/*Challenge 1 */

select *
from publishers;
select *
from titleauthor;
select *
from jobs;

select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME',  authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titles.title_id = titleauthor.title_id
inner join publishers
on publishers.pub_id  = titles.pub_id;

/* Challnege 2 */

select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', COUNT(publishers.pub_name) as 'TITLE COUNT'
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titles.title_id = titleauthor.title_id
inner join publishers
on publishers.pub_id  = titles.pub_id
group by authors.au_id;

/* Challnege 3 */

select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', sales.qty as 'TOTAL'
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join sales
on sales.title_id = titleauthor.title_id
group by authors.au_id, sales.qty
order by sales.qty desc
limit 3;