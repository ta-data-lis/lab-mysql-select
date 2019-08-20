#INNER join
SELECT publishers.pub_name AS Publisher, titles.title AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publishers.pub_id = titles.pub_id;
#this returns publications published by publishers. publications it is on table 'titles' and publishers is on table 'publishers'.

SELECT publishers.pub_name AS Publisher, COUNT(titles.title) AS Title
FROM publications.publishers
INNER JOIN publications.titles
ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_name;
#this gives the total of titles per publisher


#LEFT JOIN
SELECT publishers.pub_name AS Publisher, titles.title AS Title
FROM publications.publishers
LEFT JOIN publications.titles
ON publishers.pub_id = titles.pub_id;

SELECT publishers.pub_name AS Publisher, COUNT(titles.title) AS Title
FROM publications.publishers
LEFT JOIN publications.titles
ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_name;
#gives all the publishers, even if they didn't had any titles published


#OUTER JOIN
SELECT * publishers.pub_name AS Publisher, titles.title AS Title
FROM publications.publishers
OUTER JOIN publications.titles #doesn't work
ON publishers.pub_id = titles.pub_id;


SELECT publishers.pub_name AS Publisher, titles.title AS Title
FROM publications.publishers
LEFT JOIN publications.titles
ON publishers.pub_id = titles.pub_id
UNION
SELECT publishers.pub_name AS Publisher, titles.title AS Title
FROM publications.publishers
RIGHT JOIN publications.titles
ON publishers.pub_id = titles.pub_id;


#1 - Suppose we had built a query to summarise store sales, including the number of orders, the number of items, and the total quantity of units sold.
SELECT stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(sales.title_id) AS BookTitle, SUM(sales.qty) AS Quantity #focus on order, as a discret event
FROM publications.sales
INNER JOIN publications.stores
ON stores.stor_id = sales.stor_id
GROUP BY store;


#2 - If we wanted to then show the average number of items per order and average quantity per item for each store, we could do that by embedding this query as a subquery into another query that performs those calculations.
SELECT Store, BookTitle/Orders AS AVGItemsBook, Quantity/BookTitle AS AvgQuantity
FROM(
	SELECT stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(sales.title_id) AS BookTitle, SUM(sales.qty) AS Quantity
	FROM publications.sales
	INNER JOIN publications.stores
	ON stores.stor_id = sales.stor_id
	GROUP BY store
)summary; #kind of created a new table 'summary'. I can then create a temporary table: the summary table (publications.store_sales_summary). see below


#temporary tables don't add new information to the database (it's derivative info). I don't want to save it in the new database, only new stuff go there. As I close my workbench, the temporary table is gone. Is just useful for temporary use
CREATE TEMPORARY TABLE publications.store_sales_summary
SELECT stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(sales.title_id) AS BookTitle, SUM(sales.qty) AS Quantity
FROM publications.sales
INNER JOIN publications.stores
ON stores.stor_id = sales.stor_id
GROUP BY store;

SELECT * FROM publications.store_sales_summary;


#3 - Suppose we wanted to see sales by title for the two stores that averaged more than one item per order.
SELECT Store, ord_num AS OrderNumber, ord_date AS OrderDate, title AS Title, sales.qty AS Qty, price AS Price, type as Type FROM publications.store_sales_summary summary
INNER JOIN publications.sales sales ON summary.StoreID = sales.stor_id
INNER JOIN publications.titles ON sales.title_id = titles.title_id
WHERE Items / Orders > 1
# adjust this!!


