use sakila;

/***Exercises***/
     
    
/* 1- Use `INNER JOIN` to display the first and last names, as well as the address, of each staff member. 

Use the tables `staff` and `address` */
SELECT staff.first_name, staff.last_name, address.address
FROM staff
INNER JOIN address ON staff.address_id = address.address_id;



  
  
  
/* 2- Use `INNER JOIN` to display first name, last name and the amount for each staff member. 
Use tables `staff` and `payment*/




/* 3- Use `INNER JOIN` to display first name, last name,  payment date and 
the amount for each staff member in  August of 2005. Use tables `staff` and `payment*/
SELECT staff.first_name, staff.last_name, payment.payment_date, payment.amount
FROM staff
INNER JOIN payment ON staff.staff_id = payment.staff_id
WHERE payment.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
ORDER BY payment.payment_date;




  
/* 4- Use `INNER JOIN` to display the total amount rung up by each staff member in August of 2005. 
Use tables `staff` and `payment`. */

SELECT staff.first_name, staff.last_name, SUM(payment.amount) AS total_amount
FROM staff
INNER JOIN payment ON staff.staff_id = payment.staff_id
WHERE payment.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY staff.staff_id
ORDER BY total_amount DESC;





/* 5) List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. 
Use inner join, group by. */

SELECT film.title, COUNT(film_actor.actor_id) AS number_of_actors
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY number_of_actors DESC;





/* 6) How many copies of the film `Hunchback Impossible` exist in the inventory system? 
Use tables `film` and `inventory`*/

SELECT 
    COUNT(i.inventory_id) AS total_copies
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
WHERE 
    f.title = 'Hunchback Impossible';






/* 7) Using the tables `payment` and `customer` and the `INNER JOIN` command, list payments by each customer. 
List the customers alphabetically by last name */

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    p.payment_id,
    p.amount,
    p.payment_date
FROM 
    customer c
INNER JOIN 
    payment p ON c.customer_id = p.customer_id
ORDER BY 
    c.last_name ASC, 
    c.first_name ASC;





/* 8) Using the tables `payment` and `customer` and the `INNER JOIN` command, list the total paid by each customer. 
List the customers alphabetically by last name. */
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_paid
FROM 
    customer c
INNER JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    c.last_name ASC, 
    c.first_name ASC;





/* 9) Which actor has appeared in the most films? */
SELECT 
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS film_count
FROM 
    actor a
INNER JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name
ORDER BY 
    film_count DESC
LIMIT 1;





/* 10) Find the most common actor surname from the Sakila database */
SELECT 
    last_name,
    COUNT(*) AS surname_count
FROM 
    actor
GROUP BY 
    last_name
ORDER BY 
    surname_count DESC
LIMIT 1;





/* 11) List the last names of actors, as well as how many actors have that last name.*/




/* 12) Which last names are not repeated? (Please search for having clause for this exercises) */




/* 13) Which last names appear more than once? (Please search for having clause for this exercises) */
