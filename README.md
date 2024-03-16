# Movie DVD Rental Store SQL Project

## Project Overview

This SQL project involved analyzing a database for a movie DVD rental store, focusing on various aspects of store operations and customer behavior. By executing a series of SQL queries, essential insights were obtained into staff information, inventory management, customer activity, data security, film diversity, replacement costs, payment processing, and customer demographics. These insights enabled the store to optimize staffing, inventory levels, and payment systems while enhancing customer engagement and security measures. Ultimately, the project aimed to drive operational efficiency, reduce risks, and improve profitability for the movie rental business.

## SQL Queries Summary:

1. **Staff Information**:
   - **Question:** We will need a list of all staff members, including their first and last names, email addresses, and the store identification number where they work.
   - **Answer:** 
SELECT first_name,last_name, email, store_id
FROM staff;


2. **Inventory Counts**:
   - **Question:** We will need separate counts of inventory items held at your two stores.
   - **Answer:** 
SELECT store_id as 'Store', COUNT(store_id) 
FROM inventory
GROUP BY store_id;


3. **Active Customers Count**:
   - **Question:** We will need a count of active customers for each of your stores. Separately, please.
   - **Answer:** 

 SELECT store_id as store, COUNT(store_id) active_count
 FROM customer
 WHERE activity = 1
 GROUP BY store_id;
 
SELECT store_id as store, SUM(CASE WHEN activity = 1 then 1 ELSE 0 END) AS active_count
FROM customer
GROUP BY store_id;


4. **Customer Email Addresses Count**:
   - **Question:** In order to assess the liability of a data breach, we will need you to provide a count of all customer email addresses stored in the database.
   - **Answer:**
SELECT COUNT(DISTINCT email) as email_count
FROM customer;


5. **Film Diversity Analysis**:
   - **Question:** We are interested in how diverse your film offering is as a means of understanding how likely you are to keep customers engaged in the future. Please provide a count of unique film titles you have in inventory at each store and then provide a count of the unique categories of films you provide.
   - **Answer:**
SELECT i.store_id, COUNT(DISTINCT i.film_id) unique_film_count, COUNT(DISTINCT category_id)
FROM inventory i JOIN film_category fc 
ON fc.film_id = i.film_id 
GROUP BY i.store_id;


6. **Film Replacement Costs**:
   - **Question:** We would like to understand the replacement cost of your films. Please provide the replacement cost for the film that is least expensive to replace, the most expensive to replace, and the average of all films you carry.
   - **Answer:**
SELECT MIN(replacement_cost) least_expensive, MAX(replacement_cost) most_expensive, AVG(replacement_cost) as average 
FROM film;


7. **Payment Processing Analysis**:
   - **Question:** We are interested in having you put payment monitoring systems and maximum payment processing restrictions in place in order to minimize the future risk of fraud by your staff. Please provide the average payment you processed, as well as the maximum payment you have processed.
   - **Answer:**
SELECT AVG(amount) as average_payment, MAX(amount) as maximum_payment
FROM payment;
  

8. **Customer Rental History**:
   - **Question:** We would like to better understand what your customer base looks like. Please provide a list of all customer identification values, with a count of rentals they have made at all-time, with your highest volume customers at the top of the list.
   - **Answer:**
SELECT customer_id, COUNT(customer_id) AS rental_count
FROM rental
GROUP BY customer_id
ORDER BY rental_count DESC;


## Files Provided:
- SQL Database File: [movie_dvd_rental_store.sql](create_mavenmovies_gp1+(1).sql)
- Answer SQL File: [answer_sql_queries.sql](guided_project_1.sql)

These SQL queries and their results contributed to a comprehensive understanding of the movie DVD rental store's operations, facilitating informed decision-making and strategic planning.

## Contact
For any queries or clarifications, feel free to reach out to [your LinkedIn profile](https://www.linkedin.com/in/pratheekpshenoy/).
