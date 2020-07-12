/*Challange 1*/
select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", t.title as "TITLE", p.pub_name as "PUBLISHER"
from publications.authors as a
inner join publications.titleauthor as ta
on a.au_id = ta.au_id
inner join publications.titles as t  
on ta.title_id = t.title_id
inner join publications.publishers as p
on t.pub_id = p.pub_id
order by a.au_id;

/*Challange 2 */
select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", p.pub_name as "PUBLISHER", count(t.title) as "TIME COUNT"
from publications.authors as a
inner join publications.titleauthor as ta
on a.au_id = ta.au_id
inner join publications.titles as t  
on ta.title_id = t.title_id
inner join publications.publishers as p
on t.pub_id = p.pub_id
group by a.au_id, p.pub_name 
order by count(t.title) desc, a.au_id desc;

/*Challange 3*/
select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", sum(s.qty) as "Total Titles Sold"
from publications.authors as a
inner join publications.titleauthor as ta
on a.au_id = ta.au_id
inner join publications.sales as s
on ta.title_id = s.title_id
group by a.au_id
order by sum(s.qty) desc
limit 3;

/*Challange 4*/
select a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", ifnull(sum(s.qty),0) as "Total Titles Sold"
from publications.authors as a
left join publications.titleauthor as ta
on a.au_id = ta.au_id
left join publications.sales as s
on ta.title_id = s.title_id
group by a.au_id
order by sum(s.qty) desc;

