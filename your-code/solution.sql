/* Challenge 1 */
select authors.au_id, authors.au_lname, authors.au_fname, titles.title,lab2.publishers.pub_name
from lab2.authors
inner join lab2.titleauthor
on lab2.titleauthor.au_id = lab2.authors.au_id
inner join lab2.titles
on lab2.titles.title_id = lab2.titleauthor.title_id
inner join lab2.publishers
on lab2.publishers.pub_id = lab2.titles.pub_id;

/* Challenge 2 */
select authors.au_id, authors.au_lname, authors.au_fname,lab2s.publishers.pub_name, count(titles.title) as Title_Count
from lab2.authors
inner join lab2.titleauthor
on lab2.titleauthor.au_id = lab2.authors.au_id
inner join lab2.titles
on lab2.titles.title_id = lab2.titleauthor.title_id
inner join lab2.publishers
on lab2.publishers.pub_id = lab2.titles.pub_id
group by authors.au_id,lab2.publishers.pub_name; 

/* Challenge 3 */

select authors.au_id, authors.au_lname, authors.au_fname, count(titles.title) as Title_Count
from lab2.authors
inner join lab2.titleauthor
on lab2.titleauthor.au_id = lab2.authors.au_id
inner join lab2.titles
on lab2.titles.title_id = lab2.titleauthor.title_id
inner join lab2.publishers
on lab2.publishers.pub_id = lab2.titles.pub_id
group by authors.au_id
order by Title_Count desc
limit 3; 

/* Challenge 4 */

select authors.au_id, authors.au_lname, authors.au_fname, count(titles.title) as Title_Count
from lab2.authors
left join lab2.titleauthor
on lab2.titleauthor.au_id = lab2.authors.au_id
left join lab2.titles
on lab2.titles.title_id = lab2.titleauthor.title_id
left join lab2.publishers
on lab2.publishers.pub_id = lab2.titles.pub_id
group by authors.au_id
order by Title_Count desc;
