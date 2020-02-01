# Challenge 1 
SELECT aut.au_id, aut.au_lname, aut.au_fname, tit.title, pub.pub_name 
FROM titles tit
JOIN titleauthor titau
ON tit.title_id = titau.title_id

JOIN authors aut
ON titau.au_id = aut.`au_id`

JOIN publishers pub
ON tit.pub_id = pub.pub_id

ORDER BY au_id;

# Challenge 2
SELECT aut.au_id, aut.au_lname, aut.au_fname, pub.pub_name, COUNT(tit.title) as TITLE_COUNT
FROM titles tit
JOIN titleauthor titau
ON tit.title_id = titau.title_id

JOIN authors aut
ON titau.au_id = aut.au_id

JOIN publishers pub
ON tit.pub_id = pub.pub_id

GROUP BY aut.au_id, pub.pub_name
ORDER BY au_id DESC;

# Challenge 3
SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(titles.ytd_sales) AS TOTAL
FROM titles 
JOIN titleauthor 
ON titleauthor.title_id = titles.title_id

JOIN authors
ON titleauthor.au_id = authors.au_id

GROUP BY authors.au_id,authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

# Challenge 4
SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(SUM(titles.ytd_sales),0) AS TOTAL
FROM titles 
RIGHT JOIN titleauthor 
ON titleauthor.title_id = titles.title_id

RIGHT JOIN authors
ON titleauthor.au_id = authors.au_id

GROUP BY authors.au_id,authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC



