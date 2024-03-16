# Guided Project - 1
# Use mavenmovies database to solve the following:

USE mavenmovies_gp1;


# 1. We will need a list of all staff members, including their first and last names, 
# email addresses, and the store identification number where they work. 

select * from staff;
select * from store;

SELECT first_name,last_name, email, store_id
FROM staff;


# 2. We will need separate counts of inventory items held at your two stores. 

SELECT * FROM inventory;
SELECT * FROM store;

SELECT store_id as 'Store', COUNT(store_id) 
FROM inventory
GROUP BY store_id;


# COUNT of distinct film_id under a particular store
SELECT * FROM inventory;

SELECT store_id, film_id, COUNT(*)
FROM inventory
GROUP BY store_id,film_id;

# 3. We will need a count of active customers for each of your stores. Separately, please. 

select * from customer;

 SELECT store_id as store, COUNT(store_id) active_count
 FROM customer
 WHERE activity = 1
 GROUP BY store_id;
 
SELECT store_id as store, SUM(CASE WHEN activity = 1 then 1 ELSE 0 END) AS active_count
FROM customer
GROUP BY store_id;



# 4. In order to assess the liability of a data breach, 
# we will need you to provide a count of all customer email addresses stored in the database. 

SELECT COUNT(DISTINCT email) as email_count
FROM customer;


# 5. We are interested in how diverse your film offering is as a means of understanding how 
# likely you are to keep customers engaged in the future. Please provide a count of unique film 
# titles you have in inventory at each store and then provide a count of the unique categories of films you provide. 

SELECT i.store_id, COUNT(DISTINCT i.film_id) unique_film_count, COUNT(DISTINCT category_id)
FROM inventory i JOIN film_category fc 
ON fc.film_id = i.film_id 
GROUP BY i.store_id;


# 6. We would like to understand the replacement cost of your films. 
# Please provide the replacement cost for the film that is least expensive to replace, the most expensive to replace, and the average of all films you carry. 	

SELECT MIN(replacement_cost) least_expensive, MAX(replacement_cost) most_expensive, AVG(replacement_cost) as average 
FROM film;


# 7. We are interested in having you put payment monitoring systems and maximum payment processing 
# restrictions in place in order to minimize the future risk of fraud by your staff. 
# Please provide the average payment you processed, as well as the maximum payment you have processed.

SELECT AVG(amount) as average_payment, MAX(amount) as maximum_payment
FROM payment;


# 8. We would like to better understand what your customer base looks like. 
# Please provide a list of all customer identification values, with a count of rentals they have made at all-time, 
# with your highest volume customers at the top of the list.

SELECT customer_id, COUNT(customer_id) AS rental_count
FROM rental
GROUP BY customer_id
ORDER BY rental_count DESC;

----------------------------------------------------------------------------------------------------------------

SELECT * FROM actor_award;

SELECT *,
 ROW_NUMBER() OVER(partition by awards order by actor_award_id)
FROM actor_award; 

with cte as(
	SELECT *,
	ROW_NUMBER() OVER(partition by awards order by first_name) as rnk
    from actor_award
)
select 
	max(case when awards = 'Tony' then concat(first_name,' ',last_name) end) tony,
    max(case when awards = 'Emmy' then concat(first_name,' ',last_name) end) emmy,
    max(case when awards = 'Oscar' then concat(first_name,' ',last_name) end) oscar,
    max(case when awards = 'Emmy, Oscar, Tony ' then concat(first_name,' ',last_name) end) as 'Emmy, Oscar, Tony ',
    max(case when awards = 'Emmy, Oscar' then concat(first_name,' ',last_name) end) as 'Emmy, Oscar'

from cte
group by rnk; 


select ceil(3.5), ceiling(3.5), floor(3.5);
select 
count( case when awards = 'Oscar' then 1 end )
from actor_award;
select count(*) from actor_award where awards = 'Oscar';


select dayname('2023-10-31');

select monthname('2023-12-24');
select year(today());

select * from employee_db;

select emp_id, exp from e1 order by 2;
drop temporary table temp1;
create temporary table temp1 as;
select * from e1;

select * from temp1;

SELECT * FROM e1 where first_name regexp 'p';
SELECT * FROM e1 where first_name like '_____';

SELECT * FROM e1 where first_name not regexp '[Jrnks]';


select *, max(emp_rating) over(partition by dept order by exp desc rows between 1 preceding and 1 following) as p1, lead(salary) over(partition by dept) from e1;

select *, sum(emp_rating) over(partition by dept order by exp desc rows between 2 preceding and current row) as p2, lead(salary) over() from e1;

select *, 
SUM(emp_rating) over(partition by dept order by COUNTRY) as p2, SUM(emp_rating) over(partition by dept) as p3 
from e1;

select *, rank() over(order by EMP_RATING) as rank_, 
row_number() over() row_, 
percent_rank() over(order by EMP_RATING) as p2
from e1;

select *, lead(salary) over(partition by dept,EMP_RATING) as p3 from e1;


select *, sum(salary) over(order by continent, COUNTRY) from e1 ;
select *, max(EMP_RATING) over(partition by dept order by exp ) from e1;



select *,nth_value(emp_rating,2) over(partition by country) from e1;



select *, sum(salary) over(partition by DEPT ) as oo from e1;

select continent, country, sum(salary), avg(salary)
from e1
group by 1,2
with rollup;



select * from rating;

select *, 
case 
	when dept = 'RETAIL' THEN 1
    WHEN DEPT = 'HEALTHCARE' then 2
    WHEN DEPT = 'FINANCE' THEN 3
    WHEN  DEPT = 'AUTOMOTIVE' THEN 4
    when dept = 'ALL' THEN 0
    ELSE NULL
END as rank_
from e1
order by rank_ asc, salary desc;

with cte1 as(
	select * from e1
    ),
    cte2 as(
    select * from e1
    )
select * from cte1 join cte2 on cte1.EMP_ID = cte2.EMP_ID;

select avg(EMP_RATING) from e1 WHERE DEPT = 'RETAIL' ;
select DEPT, avg(EMP_RATING) from e1 GROUP BY DEPT ;


SELECT * FROM E1;

select 1 from e1 wHERE dept = 'RETAIL';

select * from e1 
where SALARY > ( select avg(salary)
				from e1 e
                where e.dept = e1.dept);
                
select * from e1;

SELECT first_name, last_name, EMP_ID from e1 order by 3 desc; 


