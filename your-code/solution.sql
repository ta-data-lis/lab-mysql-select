#0 testind database

select* from lab2.authors limit 10;
select* from lab2.titleauthor  limit 10;
select* from lab2.titles limit 10;
select* from lab2.pub_info limit 10;
select* from lab2.publishers limit 10;
select* from lab2.sales limit 10;

##############################################################

#Challenge 1 - Who Have Published What At Where?
#First, I am doing the query that can be obtained by removing the "with statement. 
#Then, I am checking if the number of rows is equal to the table "titleauthor" to confirm my results
with challenge1 as(
SELECT
a.au_id as author_id
,a.au_fname as author_first_name
,a.au_lname as author_last_name
,t.title
,p.pub_name as publisher
from lab2.authors a
inner join lab2.titleauthor ta on ta.au_id=a.au_id
inner join lab2.titles t on t.title_id = ta.title_id
inner join lab2.publishers p on p.pub_id=t.pub_id)
SELECT
count(*)
from challenge1;
-------------------------------------------------------------
select count(*) from lab2.titleauthor;

## Challenge 2 - Who Have Published How Many At Where?

SELECT
a.au_id as author_id
,a.au_fname as author_first_name
,a.au_lname as author_last_name
,p.pub_name as publisher
,COUNT(t.title) titles_per_author_per_publisher
from lab2.authors a
inner join lab2.titleauthor ta on ta.au_id=a.au_id
inner join lab2.titles t on t.title_id = ta.title_id
inner join lab2.publishers p on p.pub_id=t.pub_id
group by 1,2,3,4
order by 5 desc
;

### Challenge 3 - Best Selling Authors

SELECT
a.au_id as author_id
,a.au_fname as author_first_name
,a.au_lname as author_last_name
,sum(s.qty) as TOTAL
from lab2.authors a
inner join lab2.titleauthor ta on ta.au_id=a.au_id
inner join lab2.titles t on t.title_id = ta.title_id
inner join lab2.sales s on t.title_id=s.title_id
group by 1,2,3
order by 4 desc
limit 3;

## Challenge 4 - Best Selling Authors Ranking

SELECT
a.au_id as author_id
,a.au_fname as author_first_name
,a.au_lname as author_last_name
,case when sum(s.qty) is null then 0 else sum(s.qty) end TOTAL
from lab2.authors a
left join lab2.titleauthor ta on ta.au_id=a.au_id
left join lab2.titles t on t.title_id = ta.title_id
left join lab2.sales s on t.title_id=s.title_id
group by 1,2,3
order by 4 desc
