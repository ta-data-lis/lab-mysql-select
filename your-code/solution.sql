create database publications;
select * from publications.authors;
select * from publications.pub_info;
select * from publications.publishers;
select * from publications.titles;
select * from publications.titlesauthor;
# Ch 1
create temporary table challenge1
select authors.au_id, authors.au_lname, 
authors.au_fname, titles.title, publishers.pub_name
from titleauthor  
left join authors on titleauthor.au_id = authors.au_id 
left join titles on titleauthor.title_id = titles.title_id
left join publishers ON titles.pub_id = publishers.pub_id;
select * from challenge1;
# check 
# rows in your output 
select count(au_id) from challenge1;
#should be the same as the total number of records in Table `titleauthor`.
select count(au_id) from titleauthor;

## Ch 2 how many titles each author has published at each publisher.
select * from challenge1;

select au_id, au_lname, au_fname, title, pub_name, count(pub_name) as titlecount
from challenge1
group by au_id, pub_name;

#CHECK
select sum(titlecount) 
from (select au_id, au_lname, au_fname, title, pub_name, count(pub_name) as titlecount
from challenge1
group by au_id, pub_name)summary;



#Ch 3
select * from publications.pub_info;
select * from publications.publishers;
select * from publications.roysched;
select * from publications.sales;

select authors.au_id, authors.au_lname, 
authors.au_fname, SUM(sales.qty) as "TotalSales"
from titleauthor  
left join authors on titleauthor.au_id = authors.au_id 
left join titles on titleauthor.title_id = titles.title_id
left join sales on titles.title_id = sales.title_id
group by au_id
order by TotalSales desc
limit 3;

## ch 4
select authors.au_id, authors.au_lname, 
authors.au_fname, ifnull(sum(sales.qty), 0) as "TotalSales"
from titleauthor  
left join authors on titleauthor.au_id = authors.au_id 
left join titles on titleauthor.title_id = titles.title_id
left join sales on titles.title_id = sales.title_id
group by authors.au_id
order by TotalSales desc;

### all the authors have sold sth....



