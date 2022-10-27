SELECT * FROM publications.publishers;

select * from authors;
select * from publishers;
select * from stores; 
select * from sales;
select * from titles;
select * from roysched;
select * from employee;
select * from pub_info; 
select * from jobs;
select * from titleauthor;

select titles.title_id, titles.title, titles.pub_id
from titles
left join titleauthor
on titles.title_id = titleauthor.title_id;

create temporary table publications.author_title_
select publications.titles.title_id, publications.titles.pub_id, publications.titles.title, publications.titleauthor.au_id from publications.titles
inner join publications.titleauthor on publications.titles.title_id = publications.titleauthor.title_id;

select * from publications.author_title_;

drop table if exists publications.author_name_title;
create temporary table publications.author_name_title
select publications.author_title_.au_id, publications.author_title_.title, publications.author_title_.title_id, publications.authors.au_lname, publications.authors.au_fname from publications.author_title_
inner join publications.authors  on publications.authors.au_id = publications.author_title_.au_id;

select * from publications.author_name_title;

create temporary table publications.info_name_pub
select publications.titles.pub_id, publications.titles.title_id, publications.publishers.pub_name from publications.titles
inner join publications.publishers on publications.titles.pub_id = publications.publishers.pub_id;

select * from publications.info_name_pub;

create temporary table publications.name_title_pub_
select publications.author_name_title.au_id, publications.author_name_title.title, publications.author_name_title.au_lname, publications.author_name_title.au_fname, publications.info_name_pub.pub_name
from publications.author_name_title
inner join publications.info_name_pub on publications.author_name_title.title_id = publications.info_name_pub.title_id;

select * from publications.name_title_pub_;

ALTER TABLE publications.name_title_pub_
RENAME COLUMN au_lname TO `LAST NAME`;

ALTER TABLE publications.name_title_pub_
RENAME COLUMN au_fname TO `FIRST NAME`;

ALTER TABLE publications.name_title_pub_
RENAME COLUMN pub_name TO PUBLISHER;

ALTER TABLE publications.name_title_pub_
RENAME COLUMN title TO TITLE;

ALTER TABLE publications.name_title_pub_
RENAME COLUMN au_id TO `AUTHOR ID`;

####### Challenge 2

select `AUTHOR ID`, `PUBLISHER`, `LAST NAME`, `FIRST NAME`, count(TITLE) as `TITLE COUNT`
from publications.name_title_pub_
group by `AUTHOR ID`;

##### Challenge 3

create temporary table publications.authors_sales
select publications.author_name_title.au_id, publications.author_name_title.title_id, publications.author_name_title.au_lname,publications.author_name_title.au_fname, publications.sales.qty
from publications.author_name_title
inner join publications.sales on  publications.author_name_title.title_id = publications.sales.title_id;

select * from publications.authors_sales;

select au_id as `AUTHOR ID`, au_lname as `LAST NAME`, au_fname as `FIRST NAME`, sum(qty) as TOTAL
from publications.authors_sales
group by au_id
order by `TOTAL` DESC
Limit 3;

#### Challenge 4
#table with all authors:
create temporary table sales_top
select au_id as `AUTHOR ID`, au_lname as `LAST NAME`, au_fname as `FIRST NAME`, sum(qty) as TOTAL
from publications.authors_sales
group by au_id
order by `TOTAL` DESC;


select qty from sales
where qty is null;


