
/*Challenge 1 - Who Have Published What At Where?*/
Select authors.au_id, authors.au_lname, authors.au_fname, titles.title_id, titles.title,publishers.pub_id, publishers.pub_name
From authors INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
on titleauthor.title_id =titles.title_id
INNER JOIN publishers
on titles.pub_id = publishers.pub_id
group by title_id
order by titles.title ASC;

/*Challenge 2 - Who Have Published How Many At Where?*/
Select authors.au_id, authors.au_lname, authors.au_fname, titles.title_id, titles.title,publishers.pub_id, publishers.pub_name, count(titles.title_id) AS No_of_titles
From authors INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
on titleauthor.title_id =titles.title_id
INNER JOIN publishers
on titles.pub_id = publishers.pub_id
group by title_id
order by  No_of_titles DESC;

/*Challenge 3 - Best Selling Authors*/
Select authors.au_id, authors.au_lname, authors.au_fname, titles.title_id, titles.title, titles.ytd_sales AS Total, count(titles.title_id) as No_of_titles
From authors INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
on titleauthor.title_id =titles.title_id
INNER JOIN publishers
on titles.pub_id = publishers.pub_id
group by title_id
order by  Total DESC
limit 3;
/*Challenge 4 - Best Selling Authors Ranking*/
Select authors.au_id, authors.au_lname, authors.au_fname, titles.title_id, titles.title, titles.ytd_sales AS Total, count(titles.title_id) as No_of_titles	
From authors INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
on titleauthor.title_id =titles.title_id
INNER JOIN publishers
on titles.pub_id = publishers.pub_id
group by title_id
order by  Total DESC;