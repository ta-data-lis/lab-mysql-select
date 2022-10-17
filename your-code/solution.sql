-- 1)
CREATE TEMPORARY TABLE publications.auth_tit_pub
SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, titles.title as `TITLE`, publishers.pub_name as `PUBLISHER`
FROM publications.titles
INNER JOIN publications.titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id
INNER JOIN publications.authors ON authors.au_id = titleauthor.au_id;

SELECT count(title_id)
FROM publications.titleauthor;
-- 25 --> same

SELECT * FROM publications.auth_tit_pub;

-- 2) how many titles each author has published at each publisher
SELECT auth_tit_pub.`AUTHOR ID`, `LAST NAME`, `FIRST NAME`, auth_tit_pub.PUBLISHER, count(title) as sum_titles
FROM auth_tit_pub
GROUP BY `AUTHOR ID`, PUBLISHER
ORDER BY sum_titles DESC, `AUTHOR ID` DESC;

SELECT count(title_id) FROM publications.titleauthor;
-- 25 --> same

-- 3) 
SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, titles.ytd_sales as `TOTAL`
FROM publications.titles
INNER JOIN publications.titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN publications.authors ON authors.au_id = titleauthor.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- 4)
SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, coalesce(titles.ytd_sales, 0) as `TOTAL`
FROM publications.titles
INNER JOIN publications.titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN publications.authors ON authors.au_id = titleauthor.au_id
ORDER BY TOTAL DESC;