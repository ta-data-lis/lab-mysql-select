/*CHALLENGE 1 */

SELECT
	au_fname, 
    au_lname,
    titleauthor.au_id,
    titles.title,
    publishers.pub_name
FROM lab_mysql_selects.authors 
	INNER JOIN lab_mysql_selects.titleauthor
		INNER JOIN lab_mysql_selects.titles
			INNER JOIN lab_mysql_selects.publishers
			ON lab_mysql_selects.titles.pub_id = lab_mysql_selects.publishers.pub_id
		ON lab_mysql_selects.titleauthor.title_id = lab_mysql_selects.titles.title_id
	ON lab_mysql_selects.authors.au_id = lab_mysql_selects.titleauthor.au_id;

/*CHALLENGE 2*/

CREATE TABLE challenge2 (
    au_fname VARCHAR(30),
    au_lname VARCHAR(30),
    au_id VARCHAR(30),
    title VARCHAR(30),
    pub_name VARCHAR(30)
);

INSERT INTO challenge2
SELECT
	au_fname, 
    au_lname,
    authors.au_id,
    titles.title,
    publishers.pub_name
FROM lab_mysql_selects.authors 
	INNER JOIN lab_mysql_selects.titleauthor
		INNER JOIN lab_mysql_selects.titles
			INNER JOIN lab_mysql_selects.publishers
			ON lab_mysql_selects.titles.pub_id = lab_mysql_selects.publishers.pub_id
		ON lab_mysql_selects.titleauthor.title_id = lab_mysql_selects.titles.title_id
	ON lab_mysql_selects.authors.au_id = lab_mysql_selects.titleauthor.au_id;

SELECT *, COUNT(*)
FROM lab_mysql_selects.challenge2
GROUP BY au_fname WITH ROLLUP;

/*CHALLENGE 3*/

SELECT 
au_fname,
au_lname,
authors.au_id,
titles.ytd_sales
FROM lab_mysql_selects.authors
	INNER JOIN lab_mysql_selects.titleauthor
		INNER JOIN lab_mysql_selects.titles
        ON lab_mysql_selects.titleauthor.title_id = lab_mysql_selects.titles.title_id
	ON lab_mysql_selects.authors.au_id = lab_mysql_selects.titleauthor.au_id
GROUP BY au_fname
ORDER BY titles.ytd_sales DESC 
LIMIT 3;

/*CHALLENGE 4*/

SELECT 
au_fname,
au_lname,
titles.ytd_sales
FROM lab_mysql_selects.authors
	LEFT JOIN lab_mysql_selects.titleauthor
		INNER JOIN lab_mysql_selects.titles
        ON lab_mysql_selects.titleauthor.title_id = lab_mysql_selects.titles.title_id
	ON lab_mysql_selects.authors.au_id = lab_mysql_selects.titleauthor.au_id
GROUP BY au_fname
ORDER BY titles.ytd_sales DESC;
