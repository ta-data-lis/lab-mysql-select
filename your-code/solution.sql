
SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`,
titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM database_name.authors authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
ORDER BY authors.au_id ASC;


SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, publishers.pub_name AS PUBLISHER, count(titleauthor.title_id)  as `TITLE COUNT`
FROM database_name.authors authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
group BY publishers.pub_name , authors.au_id;


SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, ytd_sales as `TOTAL`
FROM database_name.authors authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
group by authors.au_id 
order by ytd_sales desc
limit 3;


SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, ytd_sales as `TOTAL`
FROM authors authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
group by authors.au_id 
order by ytd_sales desc;

select tid.au_id AS `AUTHOR ID`, a.au_lname AS `LAST NAME`, a.au_fname AS `FIRST NAME`, t.ytd_sales as `TOTAL`
from titleauthor tid
join authors a on tid.au_id = a.au_id
join titles t on t.title_id = tid.title_id;

select a.au_id AS `AUTHOR ID`, a.au_lname AS `LAST NAME`, a.au_fname AS `FIRST NAME`
from authors a
left join titleauthor tid on tid.au_id = a.au_id
group by a.au_id;



select t.ytd_sales 
from titles t;




