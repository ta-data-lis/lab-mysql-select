select * from publications.authors;

select * from publications.titles;

select * from publications.titleauthor;

select * from publications.publishers;

/* CHALLENGE 1 Who Have Published What At Where?
In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published
*/

select author_id as Author_ID, Last_name, First_name, title as Title, publications.publishers.pub_name as Publisher
from (
	select author_title as author_id, au_lname as Last_name, au_fname as First_name, title_author as Title_id, pub_id as publisher_author, title
	from (
		select publications.titleauthor.au_id as author_title, publications.titleauthor.title_id as title_author, pub_id, publications.titles.title
		from publications.titleauthor
		Inner join publications.titles
		ON publications.titles.title_id = publications.titleauthor.title_id
	) as selection
	Inner join publications.authors
ON publications.authors.au_id = selection.author_title
) as selection2
Inner join publications.publishers
on selection2.publisher_author = publications.publishers.pub_id;


/* CHALLENGE 2 Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
PUBLISHER - name of the publisher where the title was published
TITLE COUNT - group by publisher, title count
*/

select author_id as Author_ID, Last_name, First_name, publications.publishers.pub_name as Publisher, count(title)
from (
	select author_title as author_id, au_lname as Last_name, au_fname as First_name, title_author as Title_id, pub_id as publisher_author, title
	from (
		select publications.titleauthor.au_id as author_title, publications.titleauthor.title_id as title_author, pub_id, publications.titles.title
		from publications.titleauthor
		Inner join publications.titles
		ON publications.titles.title_id = publications.titleauthor.title_id
	) as selection
	Inner join publications.authors
ON publications.authors.au_id = selection.author_title
) as selection2
Inner join publications.publishers
on selection2.publisher_author = publications.publishers.pub_id
group by Author_ID, Publisher
order by Author_ID desc;


/* Challenge 3 - Best Selling Authors
Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.
*/
select author_id as Author_ID, Last_name, First_name, count(title) as titles_sold
from (
	select author_title as author_id, au_lname as Last_name, au_fname as First_name, title_author as Title_id, pub_id as publisher_author, title
	from (
		select publications.titleauthor.au_id as author_title, publications.titleauthor.title_id as title_author, pub_id, publications.titles.title
		from publications.titleauthor
		Inner join publications.titles
		ON publications.titles.title_id = publications.titleauthor.title_id
	) as selection
	Inner join publications.authors
ON publications.authors.au_id = selection.author_title
) as selection2
Inner join publications.publishers
on selection2.publisher_author = publications.publishers.pub_id
group by Author_ID
order by Author_ID desc
Limit 3;

/* Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors 
instead of the top 3. Note that the authors who have sold 0 titles should also appear 
in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results 
based on TOTAL from high to low.
*/

select author_id as Author_ID, Last_name, First_name, count(title) as titles_sold
from (
	select author_title as author_id, au_lname as Last_name, au_fname as First_name, title_author as Title_id, pub_id as publisher_author, title
	from (
		select publications.titleauthor.au_id as author_title, publications.titleauthor.title_id as title_author, pub_id, publications.titles.title
		from publications.titleauthor
		Inner join publications.titles
		ON publications.titles.title_id = publications.titleauthor.title_id
	) as selection
	Inner join publications.authors
ON publications.authors.au_id = selection.author_title
) as selection2
Inner join publications.publishers
on selection2.publisher_author = publications.publishers.pub_id
group by Author_ID
order by Author_ID desc;

