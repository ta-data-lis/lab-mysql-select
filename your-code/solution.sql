/* CHALLENGE 1 */
DROP TABLE IF EXISTS challenge1;
CREATE TABLE challenge1
SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `TITLE`, publishers.pub_name as `PUBLISHER`
FROM (
	SELECT `AUTHOR ID`, `FIRST NAME`, `LAST NAME`, titles.title AS `TITLE`, titles.pub_id as `PUB ID`
	FROM (
		SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `FIRST NAME`, authors.au_fname AS `LAST NAME`, titleauthor.title_id as `Title ID`
		FROM authors 
		LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
		WHERE titleauthor.title_id IS NOT NULL
	) part_a
	LEFT JOIN titles on part_a.`Title ID` = titles.title_id 
) part_b
LEFT JOIN publishers on part_b.`PUB ID` = publishers.pub_id;

SELECT * FROM challenge1;

/* CHALLENGE 2 */

/* QUESTION: Is why did I need to use distinct there? If I did not it would duplicate many values.
I used distinct to take those out, but I am not sure why I had them in the first place */

DROP TABLE IF EXISTS titlecount;
CREATE TABLE titlecount
SELECT `AUTHOR ID`, `PUBLISHER`, COUNT(`AUTHOR ID`) AS `TITLE COUNT`
FROM challenge1
GROUP BY 1, 2;

DROP TABLE IF EXISTS challenge2;
CREATE TABLE challenge2
SELECT Distinct challenge1.`AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `TITLE`, challenge1.`PUBLISHER`, `TITLE COUNT`
FROM challenge1
LEFT JOIN titlecount on challenge1.`AUTHOR ID` = titlecount.`AUTHOR ID`;

SELECT * FROM challenge2;

/* CHALLENGE 3 */
DROP TABLE IF EXISTS challenge3;
CREATE TABLE challenge3
SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, SUM(`SALES`) AS `TOTAL`
FROM (
	SELECT `AUTHOR ID`, `FIRST NAME`, `LAST NAME`, titles.title AS `TITLE`, titles.pub_id as `PUB ID`, titles.ytd_sales AS `SALES`
	FROM (
		SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `FIRST NAME`, authors.au_fname AS `LAST NAME`, titleauthor.title_id as `Title ID`
		FROM authors 
		LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
		WHERE titleauthor.title_id IS NOT NULL
	) part_a
	LEFT JOIN titles on part_a.`Title ID` = titles.title_id 
) part_b
LEFT JOIN publishers on part_b.`PUB ID` = publishers.pub_id
GROUP BY 1
ORDER BY SUM(`SALES`) DESC
LIMIT 3;

SELECT * FROM challenge3;

/* CHALLENGE 4 */
DROP TABLE IF EXISTS challenge4;
CREATE TABLE challenge4
SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, SUM(`SALES`) AS `TOTAL`
FROM (
	SELECT `AUTHOR ID`, `FIRST NAME`, `LAST NAME`, titles.title AS `TITLE`, titles.pub_id as `PUB ID`, titles.ytd_sales AS `SALES`
	FROM (
		SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `FIRST NAME`, authors.au_fname AS `LAST NAME`, titleauthor.title_id as `Title ID`
		FROM authors 
		LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
	) part_a
	LEFT JOIN titles on part_a.`Title ID` = titles.title_id 
) part_b
LEFT JOIN publishers on part_b.`PUB ID` = publishers.pub_id
GROUP BY 1
ORDER BY SUM(`SALES`) DESC;

SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`,  COALESCE(`TOTAL`, 0) AS `TOTAL` FROM challenge4;

/* PS: The order of the questions makes me think there were other more interesting ways of doing this. */