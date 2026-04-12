/*
1 Remove a previously inserted film from the inventory and all corresponding rental records
2 Remove any records related to you (as a customer) from all tables except "Customer" and "Inventory"
*/

/* 1
DELETE FROM rental
WHERE inventory_id IN (SELECT inventory_id 
                       FROM inventory
					   WHERE film_id = (SELECT film_id FROM film WHERE title = 'THE TRUMAN SHOW') LIMIT 1);

DELETE FROM inventory
WHERE film_id IN (SELECT film_id FROM film WHERE title = 'THE TRUMAN SHOW' LIMIT 1);
*/

/*2
DELETE FROM payment
WHERE customer_id IN (SELECT customer_id FROM customer WHERE email = 'botakas13@gmail.com');


DELETE FROM rental 
WHERE customer_id IN (SELECT customer_id FROM customer WHERE email = 'botakas13@gmail.com');
*/
