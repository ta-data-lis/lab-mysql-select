select distinct titleauthor.au_id as Author_ID, authors.au_lname as Last_name, authors.au_fname as First_name, titles.title as Title, publishers.pub_name as Publisher
from titles,titleauthor, publishers, authors
where titleauthor.title_id = titles.title_id and titles.pub_id = publishers.pub_id and titleauthor.au_id = authors.au_id;


select distinct titleauthor.au_id as Author_ID, authors.au_lname as Last_name, authors.au_fname as First_name, publishers.pub_name as Publisher, count(title) as Title_count
from titles,titleauthor, publishers, authors
where titleauthor.title_id = titles.title_id and titles.pub_id = publishers.pub_id and titleauthor.au_id = authors.au_id
group by Author_ID desc, Publisher;

select distinct titleauthor.au_id as Author_ID, authors.au_lname as Last_name, authors.au_fname as First_name, publishers.pub_name as Publisher, sales.qty as Total
from titles,titleauthor, publishers, authors, sales
where titleauthor.title_id = titles.title_id and titles.pub_id = publishers.pub_id and titleauthor.au_id = authors.au_id and sales.title_id = titles.title_id
order by Total desc
limit 3;


select titleauthor.au_id as Author_ID, authors.au_lname as Last_name, authors.au_fname as First_name, publishers.pub_name as Publisher, coalesce((sales.qty),0) as Total
from titles,titleauthor, publishers, authors, sales
where titleauthor.title_id = titles.title_id and titles.pub_id = publishers.pub_id and titleauthor.au_id = authors.au_id and sales.title_id = titles.title_id
order by Total desc
limit 23;
