## Challenge 1 - Who Have Published What At Where?
select * from publications.authors;
select * from publications.titles;
select * from publications.titleauthor;

create temporary table publications.yolo
select publications.authors.au_id, au_lname, au_fname, title_id from publications.authors
inner join publications.titleauthor
on publications.authors.au_id = publications.titleauthor.au_id;

select * from publications.yolo;

create temporary table publications.yolo2
select publications.yolo.au_lname, publications.yolo.au_fname, publications.titles.title, publications.titles.pub_id from publications.yolo
inner join publications.titles
on publications.yolo.title_id = publications.titles.title_id;

select * from publications.yolo2;

create table publications.final
select publications.yolo2.au_lname as Last_Name, publications.yolo2.au_fname as First_Name, publications.yolo2.title, publications.publishers.pub_name as publisher from publications.yolo2
inner join publications.publishers
on publications.yolo2.pub_id = publications.publishers.pub_id;

select * from publications.final;


#### This is the second solution from challenge 1 

select publications.publishers.pub_name as Publisher, publishers.yolo3.au_lname as Last_Name, au_fname as First_Name, yolo3.title as Title
from  publications.publishers
inner join
	(select publications.authors.au_id, au_lname, au_fname, yolo2.title_id, yolo2.pub_id, yolo2.title from publications.authors
	inner join (select publications.titleauthor.title_id, au_id, publications.titles.pub_id,publications.titles.title 
				from publications.titleauthor
				inner join publications.titles
				on  publications.titleauthor.title_id = publications.titles.title_id ) as yolo2
	on publications.authors.au_id = publications.yolo2.au_id) as yolo3
on publications.publishers.pub_id = publications.yolo3.pub_id;

#### Challenge 2 - Who Have Published How Many At Where? 

select publications.publishers.pub_name as Publisher, publishers.yolo3.au_lname as Last_Name, au_fname as First_Name, count(yolo3.title) as Title_count
from  publications.publishers
inner join
	(select publications.authors.au_id, au_lname, au_fname, yolo2.title_id, yolo2.pub_id, yolo2.title from publications.authors
	inner join (select publications.titleauthor.title_id, au_id, publications.titles.pub_id,publications.titles.title 
				from publications.titleauthor
				inner join publications.titles
				on  publications.titleauthor.title_id = publications.titles.title_id ) as yolo2
	on publications.authors.au_id = publications.yolo2.au_id) as yolo3
on publications.publishers.pub_id = publications.yolo3.pub_id
group by First_Name;

## Challenge 3 
select sum(publications.sales.qty) as total, publishers.yolo3.au_lname as Last_Name, au_fname as First_Name, yolo3.au_id as Author_id
from  publications.sales
inner join
	(select publications.authors.au_id, au_lname, au_fname, yolo2.title_id, yolo2.pub_id, yolo2.title from publications.authors
	inner join (select publications.titleauthor.title_id, au_id, publications.titles.pub_id,publications.titles.title 
				from publications.titleauthor
				inner join publications.titles
				on  publications.titleauthor.title_id = publications.titles.title_id ) as yolo2
	on publications.authors.au_id = publications.yolo2.au_id) as yolo3
on publications.sales.title_id = publications.yolo3.title_id
group by Author_id
order by total desc
limit 3;




 
