Challenge 1


#authors: au_id au_lname au_fname (au_id)
#publishers: pub_name (pub_id)
#titles: title  (title_id, pub_id)

select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name from authors as a
inner join titleauthor as ta 
on ta.au_id = a.au_id
inner join titles as t
on ta.au_id = a.au_id
inner join publishers as p
on t.pub_id = p.pub_id;


Challenge 2

#authors: au_idau_lname, au_fname
#publishers: pub_name (pub_id)
#titles: count


select a.au_id, a.au_lname, a.au_fname, p.pub_name, count(t.title) as 'TITLE COUNT'
from authors as a
inner join titleauthor as ta 
on ta.au_id = a.au_id
inner join titles as t
on ta.au_id = a.au_id
inner join publishers as p
on t.pub_id = p.pub_id
group by a.au_id, p.pub_name;


Challenge 3

#authors: a.au_lname, a.au_fname
#publishers: pub_name (pub_id)
#titles: title_id
#sales: title_id, qty >> sum
#total

select a.au_id, a.au_lname, a.au_fname, SUM(s.qty) as 'Total'
from authors as a
inner join titleauthor as ta 
on ta.au_id = a.au_id
inner join titles as t
on ta.au_id = a.au_id
inner join sales as s
on ta.title_id = s.title_id
group by a.au_id
order by SUM(s.qty) DESC
LIMIT 3;

Challenge 4

select a.au_id, a.au_lname, a.au_fname, COALESCE(SUM(s.qty),0) as 'Total'
from authors as a
left outer join titleauthor as ta 
on ta.au_id = a.au_id
left outer  join titles as t
on ta.au_id = a.au_id
left outer  join sales as s
on ta.title_id = s.title_id
group by a.au_id
order by SUM(s.qty) DESC;