/*
1 Alter the rental duration and rental rates of the film you inserted before to three weeks and 9.99, respectively.
2 Alter any existing customer in the database with at least 10 rental and 10 payment records. 
Change their personal data to yours (first name, last name, address, etc.). 
You can use any existing address from the "address" table. 
Please do not perform any updates on the "address" table, as this can impact multiple records with the same address.
3 Change the customer's create_date value to current_date.
*/

/* 1
UPDATE film 
SET rental_duration = 21, rental_rate = 9.99 
WHERE title = 'THE TRUMAN SHOW';

SELECT title, rental_duration, rental_rate 
FROM film 
WHERE title = 'THE TRUMAN SHOW';
*/

/*2  
UPDATE customer 
SET first_name = 'Bota',
    last_name = 'Kass',
	email = 'botakas13@gmail.com',
	address_id = 34
WHERE customer_id IN (SELECT c.customer_id
                      FROM customer c
                      JOIN rental r ON c.customer_id = r.customer_id
                      JOIN payment p ON c.customer_id = p.customer_id
                      GROUP BY c.customer_id
                      HAVING COUNT(DISTINCT r.rental_id) >= 10 
                      AND COUNT(DISTINCT p.payment_id) >= 10
                      LIMIT 1);

SELECT * FROM customer WHERE first_name = 'Bota';
*/

/* 3 
UPDATE customer 
SET create_date = CURRENT_DATE;

SELECT create_date FROM customer;
*/