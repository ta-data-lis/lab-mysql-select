select *
from pubs.authors;

-- CHALENGE 1 - Who Have Published What At Where? :
CREATE TABLE joao_challenge_1
SELECT authors.au_id as AUTHOR_ID , au_lname as LAST_NAME, au_fname as FIRST_NAME, title AS TITLE, pub_name as PUBLISHER
FROM pubs.authors
INNER JOIN pubs.titleauthor ON pubs.authors.au_id = pubs.titleauthor.au_id
INNER JOIN pubs.titles ON pubs.titleauthor.title_id = pubs.titles.title_id
INNER JOIN pubs.publishers ON pubs.titles.pub_id = pubs.publishers.pub_id;

Select *
from joao_challenge_1;

-- CHALENGE 2 - Who Have Published How Many At Where? :
CREATE TABLE joao_challenge_2
Select AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, count(*) as `TITLE COUNT`
From joao_challenge_1
Group by AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER;

Select *
from joao_challenge_2;

-- checking if the sum of TITLE COUNT  is the same as the total number of records in Table `titleauthor`:
select sum(`TITLE COUNT`)
from joao_challenge_2;

select count(title_id)
from titleauthor;
-- both results are 25


-- CHALENGE 3 - Best Selling Authors:

-- I tried to do an inner join to "joao_challenge_1" to make the c easier, but i always had the error: "Error Code: 1054. Unknown column 'pubs.titles.title_id' in 'on clause'"

SELECT authors.au_id as AUTHOR_ID , au_lname as LAST_NAME, au_fname as FIRST_NAME, sum(qty) as TOTAL
FROM pubs.authors
INNER JOIN pubs.titleauthor ON pubs.authors.au_id = pubs.titleauthor.au_id
INNER JOIN pubs.titles ON pubs.titleauthor.title_id = pubs.titles.title_id
INNER JOIN pubs.publishers ON pubs.titles.pub_id = pubs.publishers.pub_id
INNER JOIN pubs.sales ON pubs.sales.title_id = pubs.titles.title_id
group by AUTHOR_ID, LAST_NAME, FIRST_NAME
order by TOTAL desc
Limit 3;

-- CHALENGE 4 - Best Selling Authors Ranking

CREATE TABLE joao_challenge_4
SELECT authors.au_id as AUTHOR_ID , au_lname as LAST_NAME, au_fname as FIRST_NAME, sum(qty) as TOTAL
FROM pubs.authors
left JOIN pubs.titleauthor ON pubs.authors.au_id = pubs.titleauthor.au_id
left JOIN pubs.titles ON pubs.titleauthor.title_id = pubs.titles.title_id
left JOIN pubs.publishers ON pubs.titles.pub_id = pubs.publishers.pub_id
LEFT JOIN pubs.sales ON pubs.sales.title_id = pubs.titles.title_id
group by AUTHOR_ID, LAST_NAME, FIRST_NAME
order by TOTAL desc;

select *
from joao_challenge_4;

SET SQL_SAFE_UPDATES = 0;

UPDATE joao_challenge_4
set TOTAL=0
where TOTAL IS NULL;

select *
from joao_challenge_4;

