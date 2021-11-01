
/* my first sql query select all columns */
SELECT  * 
FROM sakila.film; /* first you select what you want then you say from wich database and table you want */

/* my first sql query select all columns and only first 20 rows */
SELECT  * 
FROM sakila.film 
LIMIT 20; /* this can be done with the statement LIMIT */

/*select only some columns */

SELECT 
title , 
description , 
rating 
FROM sakila.film; 

/* CHALLENGE: Select from the table adress the column adress, district, and phone the top 5 rows */

SELECT address, district, phone
FROM sakila.address
LIMIT 5;


/*select the distinct values in a particular column */

SELECT DISTINCT rental_duration /* we want to select here the distict values for rental duration */
FROM sakila.film; 


/*... or multiple */

SELECT DISTINCT rental_duration, language_id
FROM sakila.film; 

/*Check the longest films */

SELECT title, rental_rate, length
FROM sakila.film
ORDER BY length DESC; /* Order by sets how we want to order the data from a certain table */

/*Check the longest films, tiebreak by most expensive rental */

SELECT title, rental_rate, length
FROM sakila.film
ORDER BY length DESC, rental_rate DESC;


/* Aliasing */
SELECT title, rental_rate AS cost, length
FROM sakila.film;

/* Computations */
SELECT title, rental_rate/length AS price_per_min /* what is the least expessive rental by unite of time  */
FROM sakila.film
ORDER BY price_per_min ASC;

/*String Computations */

SELECT CONCAT(title,', rating:',rating) AS descriptor
FROM sakila.film;



/* perform a query with a condition --|> are filter */

SELECT * 
FROM sakila.film
WHERE sakila.film.rental_duration = 6; /* the where statement occures before the selection and aggregations so it's a good praticice saying from wich db and table you want to filter the columns  */

/* plus some variations */ 

WHERE sakila.film.rental_duration > 6;
WHERE sakila.film.rental_duration >= 6;
WHERE sakila.film.rental_duration <> 6;
WHERE sakila.film.rental_duration in (3,4,5,6);

WHERE sakila.film.special_features = 'Deleted Scenes';
WHERE sakila.film.special_features LIKE '%Deleted Scenes%';
WHERE sakila.film.special_features NOT LIKE '%Deleted Scenes%';

/* Sample aggregations */

SELECT COUNT(*),MAX(rental_duration),AVG(replacement_cost),AVG(rental_duration)
FROM sakila.film; /* we can agregate if all the columns are agregated the same way */


/* Aggregations with group by */
SELECT rating, COUNT(rating), AVG(rental_rate) 
FROM sakila.film
GROUP BY rating; /* you group by what the column you are not agregating  */

/* Aggregations with group by multiple */


SELECT rating, rental_duration, COUNT(rating), AVG(rental_rate) 
FROM sakila.film
GROUP BY rating, rental_duration;

/* SHOW REVERSE ENGENEERE ERD and talk about keys */

/* bringing tables together -> join them -> one step inner join*/ 

SELECT * 
FROM world.country;

SELECT * 
FROM world.city;

/*notice duplications*/
SELECT * 
FROM world.country
INNER JOIN world.city
ON world.country.Code = world.city.CountryCode;


/*find Product per capita*/ 

/* GNP per capita in each city */

SELECT world.country.Name AS Country_Name,  world.city.Name AS City_Name, world.country.GNP/world.country.Population AS GNP_per_capita
FROM world.country
INNER JOIN world.city
ON world.country.Code = world.city.CountryCode;



/* bringing tables together -> join them -> 2 step inner join*/ 

SELECT * FROM sakila.actor;

SELECT * FROM sakila.film_actor;

SELECT * FROM sakila.film;

/* many 2 many relations are well handled by a "bridge" table */

SELECT sakila.actor.first_name AS Fname, sakila.actor.last_name AS Lname, sakila.film_actor.film_id
FROM sakila.actor
INNER JOIN sakila.film_actor
ON sakila.actor.actor_id = sakila.film_actor.actor_id;

/*an now this new table can be used as a subtable -> ADVANCED TOPIC */

SELECT new_table.Fname, new_table.Lname, sakila.film.title
FROM 
(SELECT sakila.actor.first_name AS Fname, sakila.actor.last_name AS Lname, sakila.film_actor.film_id
FROM sakila.actor
INNER JOIN sakila.film_actor
ON sakila.actor.actor_id = sakila.film_actor.actor_id) AS new_table
INNER JOIN sakila.film
ON new_table.film_id = sakila.film.film_id;









