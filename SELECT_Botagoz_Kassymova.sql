/* 
Task 1: Which staff members made the highest revenue for each store and deserve a bonus for the year 2017? 
*/

SELECT 	full_name, revenue, store_id	  
FROM (SELECT s.first_name || ' ' || s.last_name as full_name,
             SUM(p.amount) as revenue,
			 s.store_id
	  FROM staff s
	  JOIN payment p ON s.staff_id = p.staff_id
      WHERE EXTRACT(year from p.payment_date) = 2017
      GROUP BY s.store_id, s.staff_id
	  ) as ranked_staff
ORDER BY revenue DESC;


SELECT 	full_name, revenue, rank 	  
FROM (SELECT s.first_name || ' ' || s.last_name as full_name,
             SUM(p.amount) as revenue,
			 s.store_id ,
			 RANK() OVER(PARTITION BY s.store_id ORDER BY SUM(p.amount) DESC) as rank
	  FROM staff s
	  JOIN payment p ON s.staff_id = p.staff_id
      WHERE EXTRACT(year from p.payment_date) = 2017
      GROUP BY s.store_id, s.staff_id
	  ) as ranked_staff
WHERE rank = 1;

/*
Task 2: Which five movies were rented more than the others, 
and what is the expected age of the audience for these movies?
*/

SELECT f.title as film_name, COUNT(r.rental_id) as rental_count, f.rating as age
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY film_name, age
ORDER BY rental_count DESC
LIMIT 5;

/*
Task 3: Which actors/actresses didn't act for a longer period of time than the others?
*/

SELECT full_name, MAX(gap) as longest_gap
FROM  (SELECT a.first_name || ' ' || a.last_name as full_name, 
       f.release_year,
       f.release_year - LAG(f.release_year) OVER (
       PARTITION BY a.actor_id
	   ORDER BY f.release_year
	   ) as gap
FROM actor a 
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id ) as actor_gaps
GROUP BY full_name
ORDER BY longest_gap DESC 


