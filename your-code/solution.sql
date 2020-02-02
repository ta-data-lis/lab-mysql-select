use publications;
select * from sales;
select * from authors;
WITH third_touch as (WITH second_touch as (WITH first_touch as (SELECT authors.au_id,au_lname,au_fname,titleauthor.title_id
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id)
select au_id,au_lname,au_fname,first_touch.title_id,title,pub_id from first_touch inner join titles on first_touch.title_id=titles.title_id)
select au_id,au_lname,au_fname,title,pub_name from second_touch inner join publishers on second_touch.pub_id=publishers.pub_id)
select au_id,au_lname,au_fname,pub_name,count(*) as title_count from third_touch group by title,pub_name order by pub_name;

select c.au_id,d.au_fname,d.au_lname,a.qty as total from sales as a inner join titles as b on a.title_id=b.title_id 
inner join titleauthor as c on b.title_id=c.title_id inner join authors as d on c.au_id=d.au_id  order by 4 desc limit 3;

select d.au_id,d.au_fname,d.au_lname,a.qty as total from sales as a inner join titles as b on a.title_id=b.title_id 
inner join titleauthor as c on b.title_id=c.title_id right join authors as d on c.au_id=d.au_id order by 4 desc;


