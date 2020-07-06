/* Challenge 1 */
SELECT a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME" , a.au_fname as "FIRST NAME", t.title as "TITLE", p.pub_name as "PUBLISHER"
FROM authors as a
INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
INNER JOIN titles as t on t.title_id = ta.title_id
INNER JOIN publishers as p on p.pub_id = t.pub_id
;

/* Challenge 2 */
SELECT a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME" , a.au_fname as "FIRST NAME", p.pub_name as "PUBLISHER", t.title as "title", count(t.title) as "Title Count"
FROM authors as a
INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
INNER JOIN titles as t on t.title_id = ta.title_id
INNER JOIN publishers as p on p.pub_id = t.pub_id
GROUP BY a.au_id, p.pub_name
;

/* Challenge 3 */
SELECT a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME" , a.au_fname as "FIRST NAME", t.title as "title", s.qty as "quantity"
FROM authors as a
INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
INNER JOIN titles as t on t.title_id = ta.title_id
INNER JOIN publishers as p on p.pub_id = t.pub_id
INNER JOIN sales as s on s.title_id = t.title_id
ORDER BY s.qty DESC
LIMIT 3
;

/* Challenge 4 */
SELECT a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME" , a.au_fname as "FIRST NAME", t.title as "title", s.qty as "quantity"
FROM authors as a
INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
INNER JOIN titles as t on t.title_id = ta.title_id
INNER JOIN publishers as p on p.pub_id = t.pub_id
LEFT JOIN sales as s on s.title_id = t.title_id
ORDER BY s.qty DESC
;