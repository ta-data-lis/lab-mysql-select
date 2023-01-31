select * from publications.authors;
select * from publications.titles;
select * from publications.titleauthor;
select * from publications.publishers;

## CHALLENGE 1 - Who Have Published What At Where? ##
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

## CHALLENGE 2 - Who Have Published How Many At Where? ##
select author_id as Author_ID, Last_name, First_name, publications.publishers.pub_name as Publisher, count(title) as "Title Count"
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

## CHALLENGE 3 - Best Selling Authors ##
select author_id as Author_ID, Last_name, First_name, count(title) as TOTAL
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

## CHALLENGE 4 - Best Selling Authors Ranking ## 
select author_id as Author_ID, Last_name, First_name, count(title) as TOTAL
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