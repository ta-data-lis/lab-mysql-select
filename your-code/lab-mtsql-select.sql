#CHALLENGE 1

SELECT lab2.titles.title_id, lab2.titleauthor.au_id, lab2.publishers.pub_id, lab2.authors.au_lname, lab2.authors.au_fname
FROM lab2.titles
JOIN lab2.titleauthor ON lab2.titles.title_id = lab2.titleauthor.title_id
JOIN lab2.authors ON lab2.authors.au_id = lab2.titleauthor.au_id 
JOIN lab2.publishers ON lab2.publishers.pub_id = lab2.titles.pub_id ;

#CHALLENGE 2

SELECT lab2.titles.title, lab2.titleauthor.au_id, lab2.publishers.pub_name, lab2.authors.au_lname, lab2.authors.au_fname, COUNT(lab2.titles.title)
FROM lab2.titles
JOIN lab2.titleauthor ON lab2.titles.title_id = lab2.titleauthor.title_id
JOIN lab2.authors ON lab2.authors.au_id = lab2.titleauthor.au_id 
JOIN lab2.publishers ON lab2.publishers.pub_id = lab2.titles.pub_id
GROUP BY lab2.titles.title, lab2.titleauthor.au_id, lab2.publishers.pub_id, lab2.authors.au_lname, lab2.authors.au_fname;

#Challange 3

SELECT lab2.titles.title, lab2.titleauthor.au_id, lab2.publishers.pub_name, lab2.authors.au_lname, lab2.authors.au_fname, COUNT(lab2.titles.title)
FROM lab2.titles
JOIN lab2.titleauthor ON lab2.titles.title_id = lab2.titleauthor.title_id
JOIN lab2.authors ON lab2.authors.au_id = lab2.titleauthor.au_id 
JOIN lab2.publishers ON lab2.publishers.pub_id = lab2.titles.pub_id
GROUP BY lab2.titles.title, lab2.titleauthor.au_id, lab2.publishers.pub_id, lab2.authors.au_lname, lab2.authors.au_fname
ORDER BY lab2.titles.title DESC
LIMIT 3;

#Challenge 4

SELECT lab2.titleauthor.au_id, lab2.publishers.pub_name, lab2.authors.au_lname, lab2.authors.au_fname, COUNT(lab2.titles.title)
FROM lab2.titles
LEFT JOIN lab2.titleauthor ON lab2.titles.title_id = lab2.titleauthor.title_id
LEFT JOIN lab2.authors ON lab2.authors.au_id = lab2.titleauthor.au_id 
LEFT JOIN lab2.publishers ON lab2.publishers.pub_id = lab2.titles.pub_id
GROUP BY lab2.titles.title, lab2.titleauthor.au_id, lab2.publishers.pub_id, lab2.authors.au_lname, lab2.authors.au_fname
ORDER BY lab2.titles.title DESC;

