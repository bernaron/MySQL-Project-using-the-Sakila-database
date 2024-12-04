# MySQL-Project-using-the-Sakila-database
This project focuses on exploring and analyzing data from the Sakila database, a sample database provided by MySQL that represents a video rental store. This project aims to answer specific business questions related to the staff and payment tables by using INNER JOIN queries.
# MySQL Project: Exploring the Sakila Database

## Project Overview
The Sakila database is a sample database provided by MySQL, representing a DVD rental system. This project explores various aspects of the database, including its schema, relationships, and query capabilities, to answer practical business questions.

---

## Objectives
1. Understand the structure and schema of the Sakila database.
2. Write SQL queries to extract meaningful insights from the database.
3. Perform aggregation, joins, and filtering to address specific business requirements.

---

## Database Schema
The Sakila database contains several interconnected tables. Below are the key tables used in this project:

- **actor**: Information about actors, including their first and last names.
- **film**: Details about films, such as title, description, and release year.
- **inventory**: Tracks copies of films available in the rental system.
- **payment**: Records payments made by customers.
- **customer**: Contains customer information.
- **film_actor**: Links films to their respective actors.

---

## Queries and Analysis

### 1. How many copies of the film *Hunchback Impossible* exist in the inventory system?
```sql
SELECT 
    COUNT(i.inventory_id) AS total_copies
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
WHERE 
    f.title = 'Hunchback Impossible';

### Output of the SQL Query

The following table displays the first name, last name, and payment amount for each staff member:

| First Name | Last Name | Amount  |
|------------|-----------|---------|
| Mike       | Hillyer   | 5.99    |
| Jon        | Stephens  | 9.99    |
| Mike       | Hillyer   | 4.99    |
| Jon        | Stephens  | 6.99    |
| Mike       | Hillyer   | 7.99    |
| ...        | ...       | ...     |


![SQL Query Output](https://github.com/yourusername/yourrepo/blob/main/path/to/your/image.png)



### 2. display the first name, last name, and amount for each staff member using tables 'staff' and 'payment'

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

![Description of the image](https://github.com/user-attachments/assets/8025ee71-58b7-4929-a1da-b11da2a598ed)




###3. Total amount paid by each customer, sorted alphabetically by last name.
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

!![image](https://github.com/user-attachments/assets/2ba8d233-5a73-4b40-9e31-0da9d631f286)


###4.  Actor who has appeared in the most films.
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

!![image](https://github.com/user-attachments/assets/16aafc70-9e52-4edd-9321-76097c2fa0da)


###5. Most common actor surname.

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

!![image](https://github.com/user-attachments/assets/3dcbf7a5-7479-4a4c-a270-8e68255d71fe)


### Insights and Findings##
The total number of copies of' Hunchback impossible' in the inventory is 6.
Payments are well-distributed across customers, with John Stephens making the highest total payment of $12216.49.
The actor who has appeared in the most films is Gina, with 42 films.
The most common actor surname is Kilma, appearing 5 times.

### Conclusion
This project highlights the versatility of SQL in querying relational databases like Sakila. Through joins, aggregations, and filtering, we can extract valuable business insights effectively.


