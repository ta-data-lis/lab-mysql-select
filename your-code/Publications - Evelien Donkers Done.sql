# Challenge 1 - Who Have Published What At Where?
# I think this would be the most logic one too work with as I have all the columns and rows filled
# Has same amount of rows as title author (25)
SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, titles.title, publishers.pub_name FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id;

# Challenge 2 - Who Have Published How Many At Where? Title Count is 25 (same as above)
SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, COUNT(titles.title), publishers.pub_name FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY pub_name;

#Who are the top ONLY 3 authors who have sold the highest number of titles? Write a query to find out.
SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, titles.title, sales.qty as Total FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN sales ON sales.title_id = titles.title_id 
ORDER BY qty DESC LIMIT 3;

#4 Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, titles.title, 
COALESCE (sales.qty,0) as Total FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id 
GROUP BY au_id
ORDER BY qty DESC;    

