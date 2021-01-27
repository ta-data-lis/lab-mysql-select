
## Challenge 1 - Who Have Published What At Where?


# This code returns a table with the following columns: `AUTHOR ID` - the ID of the author
-- * `LAST NAME` - author last name
-- * `FIRST NAME` - author first name
-- * `TITLE` - name of the published title
-- * `PUBLISHER` - name of the publisher where the title was published

SELECT *
FROM (select authors.au_id,authors.au_lname,authors.au_fname,titleauthor.title_id
from publications.titleauthor
inner join authors
on titleauthor.au_id = authors.au_id) AS A
inner JOIN (select titles.title, publishers.pub_name,titles.title_id
from publications.titles
inner join publications.publishers
On publications.titles.pub_id = publications.publishers.pub_id) AS B
ON publications.A.title_id = publications.B.title_id;




## Challenge 2 - Who Have Published How Many At Where?
-- This code returns the following columns: Authors id, author first and last name and also the count of books per author

SELECT A.au_id,A.au_lname,A.au_fname,count(A.title_id) as contagem
FROM (select authors.au_id,authors.au_lname,authors.au_fname,titleauthor.title_id
from publications.titleauthor
inner join authors
on titleauthor.au_id = authors.au_id
) AS A
inner JOIN (select titles.title, publishers.pub_name,titles.title_id
from publications.titles
inner join publications.publishers
On publications.titles.pub_id = publications.publishers.pub_id) AS B
ON publications.A.title_id = publications.B.title_id
GROUP BY A.au_id,A.au_lname,A.au_fname;


/*Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

* Your output should have the following columns:
* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
`TOTAL` - total number of titles sold from this author
* Your output should be ordered based on `TOTAL` from high to low.
* Only output the top 3 best selling authors.*/



-- This code reeturns a temporary table with the quantaty sold and the title id that will be used in the next code
CREATE TEMPORARY TABLE Total_sold
SELECT sales.title_id,qty,titles.title
FROM sales
INNER JOIN titles
ON sales.title_id = titles.title_id;


-- This code returns a table with 3 columns with author id, author first and last name and also the quantaty sold order by desc.
select authors.au_id,authors.au_lname,authors.au_fname,titleauthor.title_id,qty
from publications.titleauthor
inner join authors
on titleauthor.au_id = authors.au_id
inner join Total_sold
on titleauthor.title_id = Total_sold.title_id
Order by qty desc
limit 3;


## Challenge 4 - Best Selling Authors Ranking

/*Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). 
Also order your results based on `TOTAL` from high to low.*/

-- I decided to do another temporary table to avoid more nested joins and be more redable. In the next code just joined bpth temporary tables.
CREATE TEMPORARY TABLE authors_info
select authors.au_id,authors.au_lname,authors.au_fname,titleauthor.title_id
from publications.titleauthor
right join authors
on titleauthor.au_id = authors.au_id;




-- This query returns a table with 5 columns: author id, author first and last name, title id and qty sold per author and book

Select authors_info.au_id,authors_info.au_lname,authors_info.au_fname,authors_info.title_id,Total_sold.qty
From authors_info
left join Total_sold
On authors_info.title_id = Total_sold.title_id;







