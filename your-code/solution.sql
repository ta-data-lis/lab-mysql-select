
USE challenge1;

# Who Have Published What At Where?

DROP TABLE published; 
CREATE TABLE published
SELECT authors.au_id, authors.au_lname, authors.au_fname , titles.title , publishers.pub_name 
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id 
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
WHERE titles.title IS NOT NULL;

select * from published;

# Who Have Published How Many At Where?

SELECT au_id, au_lname, au_fname , pub_name, count(pub_name) as count_title from published 
group by 1,2,3,4, au_id
order by count_title DESC ;

select * from published;

#Best Selling Authors

DROP TABLE bestselling;

CREATE TABLE bestselling
SELECT authors.au_id, authors.au_lname, authors.au_fname , titles.ytd_sales 
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
WHERE titles.ytd_sales  IS NOT NULL;

SELECT * from bestselling
group by  au_id,2,3,4
order by ytd_sales  DESC
LIMIT 3;

#Challenge4

DROP TABLE bestselling_all;

CREATE TABLE bestselling_all
SELECT authors.au_id, authors.au_lname, authors.au_fname , IFNULL(titles.ytd_sales , 0) as ytd_sales 
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
;

SELECT * from bestselling_all
group by au_id,2,3,4
ORDER BY ytd_sales DESC;

