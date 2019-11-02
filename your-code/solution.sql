/*CHALLENGE 1*/

CREATE temporary TABLE tit_pubs2
Select titles.title as TITLE, titles.pub_id, titles.title_id, pubs.pub_name as PUBLISHER
from sub_queries.publishers pubs
LEFT join sub_queries.titles titles
on pubs.pub_id = titles.pub_id;

CREATE temporary TABLE tit_au_2
Select tp.pub_id, tita.au_id, tp.TITLE, tp.PUBLISHER
from sub_queries.titleauthor tita
LEFT join sub_queries.tit_pubs2 tp
on tita.title_id = tp.title_id;

CREATE temporary TABLE tit_pubs_au
Select titles.title as TITLE, titles.pub_id, pubs.pub_name as PUBLISHER
from sub_queries.publishers pubs
LEFT join sub_queries.titles titles
on pubs.pub_id = titles.pub_id;

CREATE TABLE author_title
Select authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, tp.TITLE, tp.PUBLISHER
from sub_queries.authors authors
right join sub_queries.tit_au_2 tp
on authors.au_id = tp.au_id;

/*Challenge_2*/

Select `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `PUBLISHER`, COUNT(PUBLISHER) as `TITLE COUNT`
from author_title
GROUP BY `AUTHOR ID`, PUBLISHER
ORDER BY `AUTHOR ID` DESC;

/*Challenge 3*/

CREATE temporary TABLE tita
Select tita.au_id, tita.title_id
from sub_queries.titleauthor tita
LEFT join sub_queries.tit_pubs2 tp
on tita.title_id = tp.title_id;

create temporary table idd
select tita.title_id, sale.qty, tita.au_id
from sub_queries.tita tita
inner join sub_queries.sales sale
on tita.title_id = sale.title_id;

create temporary table sums
select title_id, au_id, SUM(qty) as TOTAL from idd
group by au_id;

CREATE temporary TABLE final
Select auti.`AUTHOR ID`, auti.`LAST NAME`, auti.`FIRST NAME`, tot.TOTAL
from sub_queries.author_title auti
LEFT join sub_queries.sums tot
on tot.au_id = auti.`AUTHOR ID`;

select distinct * from final order by TOTAL desc limit 3;

/*Challenge 4*/

CREATE TABLE oneunion1
SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, tp.title_id
FROM sub_queries.authors authors
RIGHT JOIN sub_queries.titleauthor tp
ON authors.au_id = tp.au_id
UNION
SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, tp.title_id
FROM sub_queries.authors authors
LEFT JOIN sub_queries.titleauthor tp
ON authors.au_id = tp.au_id;

CREATE temporary TABLE tt
SELECT t7.`AUTHOR ID`, t7.`LAST NAME`, t7.`FIRST NAME`, t7.title_id, ifnull(sales.qty, 0) as TOTAL
FROM sub_queries.oneunion1 t7
RIGHT JOIN sub_queries.sales sales
ON t7.title_id = sales.title_id
UNION
SELECT t7.`AUTHOR ID`, t7.`LAST NAME`, t7.`FIRST NAME`, t7.title_id, ifnull(sales.qty, 0) as TOTAL
FROM sub_queries.oneunion t7
LEFT JOIN sub_queries.sales sales
ON t7.title_id = sales.title_id;

Select `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, sum(TOTAL) as TOTAL
from tt
group by `AUTHOR ID`
order by TOTAL DESC;
