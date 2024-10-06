-- Question 1 : What are the top customers both in terms of number of orders placed and total amount spent ?
-- Here we are looking for the 10 best clients of the ecommerce company

-- TOP 10 customers per number of orders 

SELECT 
    first_name,
    last_name,
    COUNT(DISTINCT order_id) AS order_count
FROM orders
LEFT JOIN customer ON orders.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY order_count DESC
LIMIT 10;


-- TOP 10 customers per amount spent 

SELECT 
    first_name,
    last_name,
    SUM(amount) AS total_amount
FROM orders
LEFT JOIN customer ON orders.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY total_amount DESC
LIMIT 10;