/* Challenge 1 */
select authors.au_id, authors.au_lname, authors.au_fname, titles.title,publications.publishers.pub_name
from publications.authors
inner join publications.titleauthor
on publications.titleauthor.au_id = publications.authors.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.publishers
on publications.publishers.pub_id = publications.titles.pub_id;

/* Challenge 2 */
select authors.au_id, authors.au_lname, authors.au_fname,publications.publishers.pub_name, count(titles.title) as Title_Count
from publications.authors
inner join publications.titleauthor
on publications.titleauthor.au_id = publications.authors.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.publishers
on publications.publishers.pub_id = publications.titles.pub_id
group by authors.au_id,publications.publishers.pub_name; 

/* Challenge 3 */

select authors.au_id, authors.au_lname, authors.au_fname, count(titles.title) as Title_Count
from publications.authors
inner join publications.titleauthor
on publications.titleauthor.au_id = publications.authors.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.publishers
on publications.publishers.pub_id = publications.titles.pub_id
group by authors.au_id
order by Title_Count desc
limit 3; 

/* Challenge 4 */

select authors.au_id, authors.au_lname, authors.au_fname, count(titles.title) as Title_Count
from publications.authors
left join publications.titleauthor
on publications.titleauthor.au_id = publications.authors.au_id
left join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
left join publications.publishers
on publications.publishers.pub_id = publications.titles.pub_id
group by authors.au_id
order by Title_Count desc;