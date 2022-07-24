CREATE TABLE new_pub.act_tit_pub
SELECT new_pub.authors.au_id AS AUTHOR_ID, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, titles.title AS TITLE,  publishers.pub_name AS PUBLISHER, titles.title_id
FROM new_pub.authors
INNER JOIN new_pub.titleauthor
ON new_pub.authors.au_id = new_pub.titleauthor.au_id
INNER JOIN new_pub.titles
ON new_pub.titleauthor.title_id = new_pub.titles.title_id
INNER JOIN new_pub.publishers
ON new_pub.titles.pub_id = new_pub.publishers.pub_id
;
select *, count(PUBLISHER)
From act_tit_pub
GROUP BY AUTHOR_ID
ORDER BY count(PUBLISHER) DESC;

select *, count(TITLE)
From act_tit_pub
GROUP BY AUTHOR_ID
ORDER BY count(TITLE) DESC;

SELECT AUTHOR_ID,`LAST NAME`,`FIRST NAME`,count(sales.qty) AS `TOTAL SALES`
FROM act_tit_pub
INNER JOIN new_pub.sales
ON sales.title_id=act_tit_pub.title_id
GROUP BY AUTHOR_ID
ORDER BY count(sales.qty) DESC
LIMIT 3;


