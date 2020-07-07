SELECT * FROM Lab7.authors;
SELECT * FROM Lab7.publishers;
SELECT * FROM Lab7.titleauthor;
SELECT * FROM Lab7.titles;


/* Challenge 1 - Who Have Published What At Where?

In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author 
has published at which publishers. Your output should have at least the following columns:

    AUTHOR ID - the ID of the author
    LAST NAME - author last name
    FIRST NAME - author first name
    TITLE - name of the published title
    PUBLISHER - name of the publisher where the title was published

Note: the screenshot above is not the complete output.

If your query is correct, the total rows in your output should be the same as the total number of records in Table 
titleauthor. */


SELECT au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", t.title AS "TITLE", p.pub_name AS "PUBLISHER"
FROM Lab7.authors AS au
INNER JOIN Lab7.titleauthor AS ta
ON au.au_id = ta.au_id
INNER JOIN Lab7.titles AS t
ON ta.title_id = t.title_id
INNER JOIN Lab7.publishers AS p
ON t.pub_id = p.pub_id;

/* If your query is correct, the total rows in your output should be the same as the total number of records 
in Table titleauthor.*/

SELECT COUNT(*) FROM Lab7.titleauthor;


