## Challenge 1 - Who Have Published What At Where?

# 1.Selecting the columns we want to depict and choosing column names according to the info in the lab instructions. Saving in a temporary table "COMBINED".
CREATE TEMPORARY TABLE COMBINED
SELECT authors.au_id as AUTHORS_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name AS PUBLISHER 
FROM authors
# 2. Joining authors and titleauthor tables on the author id 
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
# 3. Joining titleauthor and titles tables on the title id 
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
# 3. Joining titles and publishers tables on the pub id 
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

## Challenge 2 - Who Have Published How Many At Where?

SELECT AUTHORS_ID,LAST_NAME, FIRST_NAME, COUNT(TITLE) AS TITLE_COUNT
FROM COMBINED
group by AUTHORS_ID,LAST_NAME, FIRST_NAME;

## Challenge 3 - Best Selling Authors

# 1.Selecting the columns we want to depict and choosing column names according to the info in the lab instructions. 
SELECT authors.au_id as AUTHORS_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, sum(sales.qty) as TOTAL
FROM authors
# 2. Joining authors and titleauthor tables on the author id 
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
# 3. Joining titleauthor and titles tables on the title id 
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
# 4. Joining sales and titles tables on the title id 
INNER JOIN sales
ON sales.title_id=titles.title_id
group by authors.au_id,authors.au_lname,authors.au_fname
order by sum(sales.qty) desc
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

# 1.Selecting the columns we want to depict and choosing column names according to the info in the lab instructions. Setting NULL values to "0".
SELECT authors.au_id as AUTHORS_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, IFNULL(sum(sales.qty), 0) as TOTAL
FROM authors
# 2. Joining authors and titleauthor tables on the author id 
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
# 3. Joining titleauthor and sales tables on the title id 
LEFT JOIN sales
ON titleauthor.title_id=sales.title_id
group by authors.au_id,authors.au_lname,authors.au_fname
order by sum(sales.qty) desc;




