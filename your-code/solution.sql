/*Challenge 1*/
SELECT  publication.authors.au_id as Author_ID, publication.authors.au_lname as FName, publication.authors.au_fname as LName, newtable2.Title, newtable2.Pub_Name
FROM	publication.authors
INNER JOIN 
(SELECT publication.titleauthor.au_id AS Author_ID, newtable.Title_ID, newtable.Title, newtable.Pub_Name
FROM publication.titleauthor
LEFT JOIN 
(SELECT publication.titles.title_id as Title_ID, publication.titles.title as Title, publication.publishers.pub_name as Pub_Name
FROM publication.titles
LEFT JOIN publication.publishers
ON publication.titles.pub_id = publication.publishers.pub_id) AS newtable
ON publication.titleauthor.title_id = newtable.Title_ID) as newtable2
ON publication.authors.au_id=newtable2.Author_ID


/*Challenge 2*/
SELECT  publication.authors.au_id as Author_ID, publication.authors.au_lname as FName, publication.authors.au_fname as LName, newtable2.Pub_Name, count(newtable2.Title) AS Title_Count
FROM	publication.authors
INNER JOIN 
(SELECT publication.titleauthor.au_id AS Author_ID, newtable.Title_ID, newtable.Pub_Name,newtable.Title
FROM publication.titleauthor
LEFT JOIN 
(SELECT publication.titles.title_id as Title_ID, publication.titles.title as Title, publication.publishers.pub_name as Pub_Name
FROM publication.titles
LEFT JOIN publication.publishers
ON publication.titles.pub_id = publication.publishers.pub_id) AS newtable
ON publication.titleauthor.title_id = newtable.Title_ID) AS newtable2
ON publication.authors.au_id=newtable2.Author_ID
GROUP BY Author_Id,newtable2.Pub_Name

/*Challenge 3*/
SELECT  publication.authors.au_id as Author_ID, publication.authors.au_lname as FName, publication.authors.au_fname as LName, sum(newtable2.Total) as Total
FROM	publication.authors
INNER JOIN 
(SELECT publication.titleauthor.au_id AS Author_ID, newtable.Title_ID, newtable.Title, newtable.Total
FROM publication.titleauthor
LEFT JOIN 
(SELECT publication.titles.title_id as Title_ID, publication.titles.title as Title, publication.titles.ytd_sales as Total
FROM publication.titles) AS newtable
ON publication.titleauthor.title_id = newtable.Title_ID) as newtable2
ON publication.authors.au_id=newtable2.Author_ID
GROUP BY Author_ID
ORDER BY Total DESC
LIMIT 3;

/*Challenge 4*/
SELECT newtable3.Author_ID, newtable3.FName, newtable3.LName, sum(newtable3.Total) AS Total
FROM
(SELECT  publication.authors.au_id as Author_ID, publication.authors.au_lname as FName, publication.authors.au_fname as LName, coalesce(newtable2.Total,0) AS Total
FROM publication.authors
LEFT JOIN
(SELECT publication.titleauthor.au_id AS Author_ID, newtable.Title_ID AS Title_ID, newtable.Total AS Total
FROM publication.titleauthor
LEFT JOIN 
(SELECT publication.titles.title_id as Title_ID, publication.titles.title as Title, publication.titles.ytd_sales as Total
FROM publication.titles) AS newtable
ON publication.titleauthor.title_id = newtable.Title_ID) as newtable2
ON publication.authors.au_id=newtable2.Author_ID) AS newtable3
GROUP BY Author_ID
ORDER BY Total DESC;


	





