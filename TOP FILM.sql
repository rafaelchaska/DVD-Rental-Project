--Question 1 What are the top and least rented (in-demand) genres and what are their total sales?
SELECT name,
COUNT(name) AS total_rent_demand,
SUM(amount) AS total_sales
FROM ((((inventory AS i 
INNER JOIN film_category AS fc ON fc.film_id = i.film_id)
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id)
INNER JOIN category AS c ON c.category_id = fc.category_id )
INNER JOIN payment AS p ON p.rental_id = r.rental_id)
GROUP BY name 
ORDER BY COUNT(name) DESC 

--Question 2 Can we know how many distinct users have rented each genre?
SELECT COUNT(DISTINCT customer_id) AS distinct_users,
name
FROM (((category AS c
INNER JOIN film_category AS fc ON fc.category_id = c.category_id)
INNER JOIN inventory AS i ON i.film_id = fc.film_id)
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id)
GROUP BY name
ORDER BY COUNT(DISTINCT customer_id) DESC

--Question 3 What is the average rental rate for each genre? (from the highest to the lowest)
SELECT name,
ROUND(AVG(rental_rate),2) AS avg_rental_rate
FROM ((category AS c 
INNER JOIN film_category AS fc ON c.category_id = fc.category_id)
INNER JOIN film AS f ON f.film_id = fc.film_id)
GROUP BY name
ORDER BY AVG(rental_rate) DESC

--Question 4 How many rented films were returned late, early, and on time?
SELECT
COUNT(*) AS total_number_of_films,
CASE 
WHEN rental_duration < DATE_PART('day', return_date - rental_date) THEN 'Late Return'
WHEN rental_duration > DATE_PART('day', return_date - rental_date) THEN 'Early Return'
ELSE 'On-Time Return'
END status
FROM inventory AS i
INNER JOIN film AS f ON f.film_id = i.film_id 
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
GROUP BY status
ORDER BY COUNT(*) DESC


--Question 5a In which countries does ’Top Films’ have a presence and what is the customer base in each country? 
-- 5b What are the total sales in each country? (from most to least)
SELECT country,
COUNT(DISTINCT c.customer_id) AS customer_base,
SUM(amount) AS total_sales
FROM country AS co
INNER JOIN city AS ci ON ci.country_id = co.country_id
INNER JOIN address AS ad ON ad.city_id = ci.city_id
INNER JOIN customer AS c ON c.address_id = ad.address_id
INNER JOIN payment AS p ON p.customer_id = c.customer_id
GROUP BY country
ORDER BY SUM(amount) DESC

--Question 6 Who are the top 5 customers per total sales and can we get their details just in case ‘Top Films’ wants to reward them?
SELECT CONCAT(first_name,' ',last_name) AS full_name,
email,
address,
phone,
city,
country,
SUM(amount)
FROM customer AS c
INNER JOIN payment AS p ON p.customer_id = c.customer_id
INNER JOIN address AS a ON a.address_id = c.address_id 
INNER JOIN city AS ci ON ci.city_id = a.city_id
INNER JOIN country AS co ON co.country_id = ci.country_id
WHERE active != 0
GROUP BY first_name, last_name, email,address,phone,city,country
ORDER BY SUM(amount) DESC
LIMIT 5;
