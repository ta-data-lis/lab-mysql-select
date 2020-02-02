#CHALLENGE 1 titles each author has published at which publishers.
select a.au_id, a.au_fname, a.au_lname from authors a;
#authors: au_id, au_fname and au_lname
select p.pub_id, p.pub_name from publishers p;
#pub_info: pub_id and pub_name
select ta.au_id, ta.title_id from titleauthor ta;
#tileauthor: au_id and title_id
select ti.pub_id, ti.title_id, ti.title  from titles ti;
#tiles:  pub_id, title_id, and title 

#query challenge 1
SELECT a.au_id, a.au_fname, a.au_lname, ti.title, p.pub_name
FROM authors a, publishers p, titleauthor ta, titles ti
where a.au_id = ta.au_id
and ta.title_id = ti.title_id
and ti.pub_id = p.pub_id;

#25 rows
select * from titleauthor;

#CHALLENGE 2 Who Have Published How Many At Where?
#add title count
SELECT a.au_id, a.au_fname, a.au_lname, p.pub_name, count(ti.title) as "title_count"
FROM authors a, publishers p, titleauthor ta, titles ti
where a.au_id = ta.au_id
and ta.title_id = ti.title_id
and ti.pub_id = p.pub_id 
group by a.au_id, a.au_fname, a.au_lname, p.pub_name;

#CHALLENGE 3 Who are the top 3 authors who have sold the highest number of titles?
#authors_id, first and last name, total of of titles sold from the top 3 authors.

select * from sales;
#qty, title_id

SELECT a.au_id, a.au_fname, a.au_lname, sum(s.qty) as "sum_qty"
FROM authors a, titleauthor ta, titles ti, sales s
where a.au_id = ta.au_id #author id with title id
and ta.title_id = ti.title_id #title id with title
and ti.title_id = s.title_id  #title_id and title with qty
group by a.au_id, a.au_fname, a.au_lname
order by sum_qty desc limit 3;

#CHALLENGE 4  the output should display all 23 authors instead of the top 3. 
#Note that the authors who have sold 0 titles should also appear in your output 
#(ideally display 0 instead of NULL as the TOTAL). 
#Also order your results based on TOTAL from high to low.

CREATE TEMPORARY TABLE publications.a_sellers2_summary
SELECT a.au_id, a.au_fname, a.au_lname, sum(s.qty) as "sum_qty"
FROM authors a, titleauthor ta, titles ti, sales s
where a.au_id = ta.au_id #author id with title id
and ta.title_id = ti.title_id #title id with title
and ti.title_id = s.title_id  #title_id and title with qty
group by a.au_id, a.au_fname, a.au_lname;

select * from publications.a_sellers2_summary;

SELECT a.au_id, a.au_fname, a.au_lname, IFNULL(se.sum_qty,0) as "qty"
FROM authors a
LEFT JOIN publications.a_sellers2_summary se
ON a.au_id = se.au_id
order by sum_qty desc ;
 