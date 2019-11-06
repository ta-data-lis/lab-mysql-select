#Challenge 1 - Who Have Published What At Where?
SELECT * FROM titles;
SELECT au_id, au_lname, au_fname, title, pub_name FROM publishers, authors, titles;

#Challenge 2 - Who Have Published How Many At Where?

select au_id, pub_id, count(titles.title_id)
from publications.titleauthor aut
left join publications.titles titles
on aut.title_id = titles.title_id
group by au_id;

#Challenge 3 -  Best Selling Authors

SELECT au_id, au_lname, au_fname, price, ytd_sales
FROM titles, authors
ORDER BY (price*ytd_sales) DESC
LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking
SELECT au_id, title, pub_id, ytd_sales
FROM titles
Left join titleauthor
on titles.title_id = titleauthor.title_id
order by ytd_sales desc
limit 23;
 







