
/*Find the list of actors which starred in movies with lengths higher or equal to the average length of all the movies*/

/*average length of all the movies*/
SELECT AVG(length) AS average FROM film; 

/*movies with lengths higher or equal to the average length of all the movies*/
SELECT * 
FROM sakila.film 
WHERE length >= (SELECT AVG(length) AS average FROM film);

/*movies with lengths higher or equal to the average length of all the movies*/
SELECT film_id 
FROM sakila.film 
WHERE length >= (SELECT AVG(length) AS average FROM film);


/*list of actors which starred in movies with lengths higher or equal to the average length of all the movies*/
SELECT DISTINCT actor_id 
FROM sakila.film_actor
INNER JOIN (SELECT film_id FROM sakila.film WHERE length >= (SELECT AVG(length) AS average FROM film)) AS selected_films_id
ON sakila.film_actor.film_id = selected_films_id.film_id;


/*list of actors which starred in movies with lengths higher or equal to the average length of all the movies*/
SELECT first_name, last_name
FROM sakila.actor
INNER JOIN (
SELECT DISTINCT actor_id 
FROM sakila.film_actor
INNER JOIN (SELECT film_id FROM sakila.film WHERE length >= (SELECT AVG(length) AS average FROM film)) AS selected_films_id
ON sakila.film_actor.film_id = selected_films_id.film_id) AS selected_actors
ON sakila.actor.actor_id = selected_actors.actor_id;


/* Temporary tables to store intermediate result */

CREATE TEMPORARY TABLE sakila.selected_films
SELECT film_id 
FROM sakila.film 
WHERE length >= (SELECT AVG(length) AS average FROM film);

SELECT * FROM selected_films;

CREATE TEMPORARY TABLE sakila.selected_actors
SELECT DISTINCT actor_id 
FROM sakila.film_actor
INNER JOIN sakila.selected_films
ON sakila.film_actor.film_id = selected_films.film_id;

SELECT first_name, last_name
FROM sakila.actor
INNER JOIN sakila.selected_actors
ON sakila.actor.actor_id = selected_actors.actor_id;





