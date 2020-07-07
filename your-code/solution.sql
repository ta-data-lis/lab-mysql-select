/*Challenge 1 - Who Have Published What At Where?*/
SELECT ta.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", t.title as TITLE, pub_name as PUBLISHER
FROM publications.titles as t
Inner join publications.titleauthor as ta
on ta.title_id = t.title_id
inner join publications.authors as a
on a.au_id = ta.au_id
INNER JOIN publications.publishers as p
ON t.pub_id = p.pub_id;

/*Challenge 2 - Who Have Published How Many At Where?*/
SELECT  ta.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", pub_name as PUBLISHER, count(*) as "TITLE COUNT"
FROM publications.titles as t
Inner join publications.titleauthor as ta
on ta.title_id = t.title_id
inner join publications.authors as a
on a.au_id = ta.au_id
INNER JOIN publications.publishers as p
ON t.pub_id = p.pub_id
group by ta.au_id, p.pub_id;

/*Challenge 3 - Best Selling Authors*/
SELECT  ta.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", SUM(s.qty) as "QUANTITY"
FROM publications.sales as s
INNER JOIN publications.titles as t
on s.title_id=t.title_id
INNER JOIN publications.titleauthor as ta
ON t.title_id=ta.title_id
INNER JOIN publications.authors as a
on a.au_id=ta.au_id
group by a.au_id
order by sum(s.qty) desc
limit 3;

/*Challenge 4 - Best Selling Authors Ranking*/
SELECT  a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", coalesce(SUM(s.qty),0) as "QUANTITY"
FROM publications.sales as s
RIGHT JOIN publications.titles as t
on s.title_id=t.title_id
right JOIN publications.titleauthor as ta
ON t.title_id=ta.title_id
RIGHT JOIN publications.authors as a
on a.au_id=ta.au_id
group by a.au_id
order by sum(s.qty) desc