/*Challenge 1 - Who Have Published What At Where*/
select publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, publications.titles.title, publications.publishers.pub_name
from publications.authors
inner join publications.titleauthor
on publications.authors.au_id = publications.titleauthor.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.publishers
on publications.publishers.pub_id = publications.titles.pub_id;

/*Challenge 2 - Who Have Published How Many At Where*/
select publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, publications.titles.title, publications.publishers.pub_name, count(publications.authors.au_id)
from publications.authors
inner join publications.titleauthor
on publications.authors.au_id = publications.titleauthor.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.publishers
on publications.publishers.pub_id = publications.titles.pub_id
group by publications.authors.au_id;

/*Challenge 3 - the top 3 best selling authors */
select publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, publications.titles.title, publications.sales.qty
from publications.authors
inner join publications.titleauthor
on publications.authors.au_id = publications.titleauthor.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.sales
on publications.sales.title_id = publications.titles.title_id
group by publications.authors.au_id
order by publications.sales.qty desc
limit 3;

/*challenge 4  - the top 23 best selling authors */
select publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname, publications.titles.title, publications.sales.qty
from publications.authors
inner join publications.titleauthor
on publications.authors.au_id = publications.titleauthor.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.sales
on publications.sales.title_id = publications.titles.title_id
group by publications.authors.au_id
order by publications.sales.qty desc
limit 23;