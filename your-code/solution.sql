USE publications;

-- Challenge 1 - Who Have Published What At Where?
select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
from authors as a
inner join titleauthor as ta on a.au_id = ta.au_id
inner join titles as t on ta.title_id = t.title_id
inner join publishers as p on p.pub_id = t.pub_id;

-- to confirm:
select count(au_id)
from titleauthor;

-- Challenge 2 - Who Have Published How Many At Where?
select a.au_id, a.au_lname, a.au_fname, p.pub_name, count(t.title) as "Title Count"
from authors as a
inner join titleauthor as ta on a.au_id = ta.au_id
inner join titles as t on ta.title_id = t.title_id
inner join publishers as p on p.pub_id = t.pub_id
GROUP BY a.au_id, p.pub_name;


-- Challenge 3 - Best Selling Authors
select a.au_id, a.au_lname, a.au_fname, count(ta.title_id) as "Total"
from authors as a
inner join titleauthor as ta on a.au_id = ta.au_id
GROUP BY a.au_id
ORDER BY Total DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
select a.au_id, a.au_lname, a.au_fname, count(ta.title_id) as "Total"
from authors as a
left join titleauthor as ta on a.au_id = ta.au_id
GROUP BY a.au_id
ORDER BY Total DESC;