# Labs: Challenge 1
# Solution
select authors.au_id as `Author ID`, authors.au_lname as `Last Name`, 
authors.au_fname as `First Name`, titles.title as `Title`, publishers.pub_name as `Publisher` 
from titles
inner join publishers on publishers.pub_id=titles.pub_id
join titleauthor on titles.title_id=titleauthor.title_id
join authors on titleauthor.au_id=authors.au_id;


# Labs challenge 2
select authors.au_id as `Author ID`, authors.au_lname as `Last Name`, 
authors.au_fname as `First Name`, count(titles.title) as `Published`, publishers.pub_name as `Publisher` 
from titles
inner join publishers on publishers.pub_id=titles.pub_id
join titleauthor on titles.title_id=titleauthor.title_id
join authors on titleauthor.au_id=authors.au_id
group by authors.au_id, publishers.pub_name;

# Labs challenge 3 # The challenge is set in a contradictory way because the highest
# amount of titles and the best selling author is not the same. To get a representative result 
# I ordered by highest amount of titles in combination with sold books.
select authors.au_id as `Author ID`, authors.au_lname as `Last Name`, 
authors.au_fname as `First Name`, count(titles.title) as `Total`, sum(sales.qty) Sold_books
FROM titles
inner Join titleauthor ON titleauthor.title_id = titles.title_id
inner JOIN authors ON authors.au_id =titleauthor.au_id
inner JOIN sales ON titles.title_id = sales.title_id    
GROUP BY authors.au_id
ORDER BY Total DESC, Sold_books DESC
LIMIT 3;

# challenge 4
select authors.au_id as `Author ID`, authors.au_lname as `Last Name`, 
authors.au_fname as `First Name`, ifnull(sum(sales.qty), 0) as Sold_books
FROM titles
Join titleauthor ON titleauthor.title_id = titles.title_id
JOIN sales ON titles.title_id = sales.title_id   
right JOIN authors ON authors.au_id =titleauthor.au_id
GROUP BY authors.au_id
ORDER BY Sold_books DESC;
