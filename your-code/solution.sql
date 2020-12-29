/* Challenge 1 */

SELECT titleauthor.au_id as 'Author ID', au_lname as 'Last Name',au_fname as 'First Name', title as 'Title',pub_name as 'Publisher'
FROM authors 
RIGHT JOIN titleauthor on authors.au_id = titleauthor.au_id
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN publishers on titles.pub_id = publishers.pub_id;

/* Challenge 2 */

SELECT titleauthor.au_id as 'Author ID', au_lname as 'Last Name',au_fname as 'First Name',pub_name as 'Publisher', count(pub_name) as 'Title Count'
FROM authors 
RIGHT JOIN titleauthor on authors.au_id = titleauthor.au_id
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN publishers on titles.pub_id = publishers.pub_id
GROUP BY Publisher, titleauthor.au_id
order by count(pub_name) desc;

/*CHallenge 3 */

SELECT titleauthor.au_id as 'Author ID', au_lname as 'Last Name',au_fname as 'First Name',sum(qty) as 'Total'
FROM authors 
RIGHT JOIN titleauthor on authors.au_id = titleauthor.au_id
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN sales on titles.title_id = sales.title_id
GROUP BY titleauthor.au_id
ORDER BY sum(qty) desc 
LIMIT 3;

/* Challenge 4*/

SELECT authors.au_id as 'Author ID', au_lname as 'Last Name',au_fname as 'First Name',IFNULL(sum(qty), 0) as 'Total' 
FROM authors 
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN sales on titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(qty) desc;


