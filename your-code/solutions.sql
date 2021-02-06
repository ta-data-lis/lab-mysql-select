--  Challenge 1 - Who Have Published What At Where?
SELECT 
    au.au_id AS AUTHOR_ID,
    au.au_lname AS LAST_NAME,
    au.au_fname AS FIRST_NAME,
    tt.title AS TITLE,
    pub.pub_name AS PUBLISHER
FROM
    publications.authors au
        JOIN
    publications.titleauthor ta ON au.au_id = ta.au_id
        JOIN
    publications.titles tt ON ta.title_id = tt.title_id
        JOIN
    publications.publishers pub ON tt.pub_id = pub.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT au.au_id AS AUTHOR_ID, au.au_lname AS LAST_NAME, au.au_fname AS FIRST_NAME,
pub.pub_name AS PUBLISHER, COUNT(tt.title_id) AS TITLE_COUNT
FROM publications.authors au
JOIN
publications.titleauthor ta ON au.au_id = ta.au_id
JOIN
publications.titles tt ON ta.title_id = tt.title_id
JOIN
publications.publishers pub ON tt.pub_id = pub.pub_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER
ORDER BY TITLE_COUNT DESC;

-- Challenge 3 - Best Selling Authors
SELECT au.au_id AS AUTHOR_ID, au.au_lname AS LAST_NAME, au.au_fname AS FIRST_NAME, SUM(tt.ytd_sales) AS TOTAL
FROM publications.authors au
JOIN
publications.titleauthor ta ON au.au_id = ta.au_id
JOIN
publications.titles tt ON ta.title_id = tt.title_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT au.au_id AS AUTHOR_ID, au.au_lname AS LAST_NAME, au.au_fname AS FIRST_NAME, COALESCE(SUM(tt.ytd_sales),0) AS TOTAL
FROM publications.authors au
LEFT JOIN
publications.titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN
publications.titles tt ON ta.title_id = tt.title_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC;




