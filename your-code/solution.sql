/*## Challenge 1 - Who Have Published What At Where?*/

select titleauthor.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
from titleauthor
inner join authors on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on publishers.pub_id = titles.pub_id;

/*## Challenge 2 - Who Have Published How Many At Where?*/
select titleauthor.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, publishers.pub_name AS PUBLISHER, count(title) AS TITLE_COUNT
from titleauthor
inner join authors on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on publishers.pub_id = titles.pub_id
group by publishers.pub_name, titleauthor.au_id 
order by count(title) desc;

/*## Challenge 3 - Best Selling Authors*/
select titleauthor.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, sum(qty) as TOTAL
from titleauthor
inner join authors on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join sales on titles.title_id = publications.sales.title_id
group by titleauthor.au_id
order by TOTAL DESC
limit 3;

/*## Challenge 4 - Best Selling Authors Ranking*/
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', IFNULL(SUM(sales.qty),0) AS 'TOTAL'
FROM publications.authors
LEFT JOIN publications.titleauthor
	ON publications.authors.au_id = publications.titleauthor.au_id
LEFT JOIN publications.sales
	ON publications.titleauthor.title_id = publications.sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;


/*teste*/
