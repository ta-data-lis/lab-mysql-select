Create table summary_table (
id int not null auto_increment,
id_authors_id varchar(11),
id_ndkey_titleS_id varchar(6),
id_ndkey_publ_id char(4),
primary key (id),
foreign key (id_authors_id) references authors(au_id),
foreign key (id_ndkey_titleS_id) references titles(title_id),
foreign key (id_ndkey_publ_id) references publishers(pub_id)
) default charset = utf8;

select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, Count(title) from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titles.title_id = titleauthor.title_id
join publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id with rollup
order by Count(title) desc
limit 3;
 






 