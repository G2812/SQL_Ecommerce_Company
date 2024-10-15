-- Question 1 : Who are the top customers ?
-- Here we are looking for the 10 best clients of the ecommerce company. 
-- Two alternatives : the number of orders placed or the total amount spent.


-- Top 10 customers per number of orders 
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    COUNT(DISTINCT order_id) AS nb_of_orders
FROM orders
LEFT JOIN customer ON orders.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY nb_of_orders DESC
LIMIT 10;


-- Top 10 customers per amount spent 
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    SUM(amount) AS total_amount,
    ROUND((SUM(amount)/(AVG(SUM(amount)) OVER ()) - 1) * 100, 2) AS comparison_to_avg
FROM orders
LEFT JOIN customer ON orders.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY total_amount DESC
LIMIT 10;