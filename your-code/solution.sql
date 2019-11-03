##Challenge 1 - Who Have Published What At Where?

select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
	from pubblications.titleauthor
	inner join pubblications.authors on titleauthor.au_id = authors.au_id 
	inner join pubblications.titles on titleauthor.title_id = titles.title_id
	inner join pubblications.publishers on titles.pub_id = publishers.pub_id
	order by au_lname asc;

#Challenge 2 - Who Have Published How Many At Where?
select authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(titles.title) as "title_count"
	from pubblications.titleauthor
	inner join pubblications.authors on titleauthor.au_id = authors.au_id 
	inner join pubblications.titles on titleauthor.title_id = titles.title_id
	inner join pubblications.publishers on titles.pub_id = publishers.pub_id
	group by authors.au_id, publishers.pub_id
	order by title_count desc;

#Check
SELECT COUNT(titles.title)
	FROM pubblications.titleauthor
	INNER JOIN pubblications.authors on titleauthor.au_id = authors.au_id 
	INNER JOIN pubblications.titles on titleauthor.title_id = titles.title_id;

#Challenge 3 - Best Selling Authors
SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME",
		sum(sales.qty) as "TOTAL"
	FROM pubblications.titleauthor
	INNER JOIN pubblications.authors on titleauthor.au_id = authors.au_id 
	INNER JOIN pubblications.titles on titleauthor.title_id = titles.title_id
	LEFT JOIN pubblications.sales on sales.title_id = sales.title_id
    GROUP BY authors.au_id
    ORDER BY TOTAL DESC;
    #LIMIT 3;
    
#Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME",
		IFNULL(SUM(sales.qty),0) as "TOTAL"
	FROM pubblications.titleauthor
	LEFT JOIN pubblications.authors on titleauthor.au_id = authors.au_id 
	LEFT JOIN pubblications.titles on titleauthor.title_id = titles.title_id
	LEFT JOIN pubblications.sales on sales.title_id = sales.title_id
    GROUP BY authors.au_id
    ORDER BY TOTAL DESC;
