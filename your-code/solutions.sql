#Challenge 1 - Who Have Published What At Where?

select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
from titleauthor
left join authors on titleauthor.au_id = authors.au_id
left join titles on titleauthor.title_id = titles.title_id
left join publishers on titles.pub_id = publishers.pub_id;

#Challenge 2  Who Have Published How Many At Where?

select * from publishers;

select a.au_id, a.au_lname, a.au_fname, p.pub_name, count(t.title)
from titleauthor as ta
left join authors as a on ta.au_id = a.au_id
left join titles as t ON ta.title_id = t.title_id
left join publishers as p on p.pub_id = t.pub_id
group by a.au_id, p.pub_id;

#Challenge 3 - Best Selling Authors
select a.au_id, a.au_lname, a.au_fname, sum(s.qty) as total
from titleauthor as ta
left join authors as a on ta.au_id = a.au_id
left join titles as t on ta.title_id = t.title_id
left join sales as s on t.title_id = s.title_id
group by a.au_id
order by total desc
limit 3;

#Challenge 4 - Best Selling Authors Ranking
select a.au_id, a.au_lname, a.au_fname, ifnull((s.qty),0) as total
from titleauthor as ta
left join authors as a on ta.au_id = a.au_id
left join titles as t on ta.title_id = t.title_id
left join sales as s on t.title_id = s.title_id
group by a.au_id
order by total desc;