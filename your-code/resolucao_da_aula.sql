SELECT publishers.pub_name, count(titles.title)
FROM lab_mysql_select.publishers
RIGHT JOIN lab_mysql_select.titles
ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_name;

SELECT publishers.pub_name, count(titles.title)
FROM lab_mysql_select.publishers
RIGHT JOIN lab_mysql_select.titles
ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_name
union
SELECT publishers.pub_name, count(titles.title)
FROM lab_mysql_select.publishers
LEFT JOIN lab_mysql_select.titles
ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_name;

select Store,Items/Orders AS AvgItems, Qty/Items AS AvgQty
from(
SELECT stores.stor_name AS Store, COUNT(DISTINCT(sales.ord_num)) AS Orders, COUNT(sales.title_id) AS Items, SUM(sales.qty) AS Qty
FROM lab_mysql_select.sales
INNER JOIN lab_mysql_select.stores
ON stores.stor_id = sales.stor_id
GROUP BY Store
)summary;

CREATE TEMPORARY TABLE lab_mysql_select.store_sales_summary
SELECT stores.stor_id AS StoreID, stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
FROM lab_mysql_select.sales sales
INNER JOIN lab_mysql_select.stores stores
ON stores.stor_id = sales.stor_id
GROUP BY StoreID, Store;

Select * from lab_mysql_select.store_sales_summary;

SELECT Store, ord_num AS OrderNumber, ord_date AS OrderDate, title AS Title, sales.qty AS Qty, price AS Price, type as Type
FROM lab_mysql_select.store_sales_summary summary
INNER JOIN lab_mysql_select.sales sales ON summary.StoreID = sales.stor_id
INNER JOIN lab_mysql_select.titles ON sales.title_id = titles.title_id
WHERE Items / Orders > 1;

