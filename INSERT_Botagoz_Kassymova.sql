/*
Choose one of your favorite films and add it to the "film" table. 
Fill in rental rates with 4.99 and rental durations with 2 weeks.
Add the actors who play leading roles in your favorite film to the "actor" and "film_actor" tables (three or more actors in total).
Add your favorite movies to any store's inventory.
*/

/* 1
INSERT INTO film (title, rental_rate, rental_duration, language_id) VALUES ('THE TRUMAN SHOW', 4.99, 14, 1);

SELECT title, rental_duration
FROM film
WHERE title ILIKE '%Show%';
*/

/* 2
INSERT INTO actor(first_name, last_name) 
VALUES ('Jim', 'Carrey'),
       ('Ed', 'Harris'),
	   ('Laura', 'Linney')
RETURNING actor_id, first_name;

SELECT film_id FROM film WHERE title = 'THE TRUMAN SHOW';


INSERT INTO film_actor(actor_id, film_id)
VALUES (201, 1005),
       (202, 1005),
	   (203, 1005);
	   
SELECT a.last_name, a.actor_id 
FROM actor a 
JOIN film_actor fa ON a.actor_id = fa.actor_id  
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'THE TRUMAN SHOW';
*/ 

/*3
INSERT INTO inventory(film_id, store_id)
VALUES (
       (SELECT film_id FROM film WHERE title = 'THE TRUMAN SHOW' LIMIT 1) ,
	   2
);


SELECT film_id FROM inventory WHERE film_id = 1005;
*/