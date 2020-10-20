#Challenge 1
#ignore this method, the one below is better, but this took me too long to write so i didn't have the strength to delete it
select newer_table.au_id as Author_ID, authors.au_lname as Last_Name, authors.au_fname as First_Name, newer_table.Title, newer_table.Publisher_Name
from (select new_table.Title, new_table.au_id, new_table.pub_id as Publisher_ID, publishers.pub_name as Publisher_Name
from 
(select publications.titles.title as Title, publications.titleauthor.au_id, publications.titles.pub_id
from publications.titleauthor
inner join publications.titles
on publications.titleauthor.title_id = publications.titles.title_id) as new_table
inner join publications.publishers
on publications.publishers.pub_id = publications.new_table.pub_id) as newer_table
inner join publications.authors
on publications.authors.au_id = newer_table.au_id;

#Challenge 1
select A.au_id as Author_ID, A.au_lname as Last_Name, A.au_fname as First_Name, T.title as Title, P.pub_name as Publisher_Name
from authors A
inner join titleauthor TA on A.au_id = TA.au_id
inner join titles T on T.title_id = TA.title_id
inner join publishers P on T.pub_id = P.pub_id;

select count(title_id),
from titleauthor

select count(*)
from
(select A.au_id as Author_ID, A.au_lname as Last_Name, A.au_fname as First_Name, T.title as Title, P.pub_name as Publisher_Name
from authors A
inner join titleauthor TA on A.au_id = TA.au_id
inner join titles T on T.title_id = TA.title_id
inner join publishers P on T.pub_id = P.pub_id) as new_table;


#Challenge 2
select A.au_id as Author_ID, A.au_lname as Last_Name, A.au_fname as First_Name, P.pub_name as Publisher, count(T.title) as Title_Count
from authors A
inner join titleauthor TA on A.au_id = TA.au_id
inner join titles T on T.title_id = TA.title_id
inner join publishers P on T.pub_id = P.pub_id
group by A.au_id, T.pub_id;

select sum(new_table_2.Title_Count)
from 
(select A.au_id as Author_ID, A.au_lname as Last_Name, A.au_fname as First_Name, P.pub_name as Publisher, count(T.title) as Title_Count
from authors A
inner join titleauthor TA on A.au_id = TA.au_id
inner join titles T on T.title_id = TA.title_id
inner join publishers P on T.pub_id = P.pub_id
group by A.au_id, T.pub_id) as new_table_2;

#Challenge 3
select A.au_id as Author_ID, A.au_lname as Last_Name, A.au_fname as First_Name, sum(T.ytd_sales) as Total
from authors A
inner join titleauthor TA on A.au_id = TA.au_id
inner join titles T on T.title_id = TA.title_id
inner join publishers P on T.pub_id = P.pub_id
group by A.au_id
order by Total desc
limit 3;


#Challenge 4

select A.au_id as Author_ID, A.au_lname as Last_Name, A.au_fname as First_Name, coalesce(sum(T.ytd_sales),0) as Total
from authors A
left join titleauthor TA on A.au_id = TA.au_id
left join titles T on T.title_id = TA.title_id
left join publishers P on T.pub_id = P.pub_id
group by A.au_id
order by Total desc;


