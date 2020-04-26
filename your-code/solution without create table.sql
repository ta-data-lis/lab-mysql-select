select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, Count(title) from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titles.title_id = titleauthor.title_id
join publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id with rollup
order by Count(title) desc
limit 3;