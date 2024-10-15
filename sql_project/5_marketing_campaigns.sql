-- Question 5 : Are the marketing campaigns boosting the numbers of orders placed during the specific weeks ? 

-- Retrieving weeks of the years during wich a discount was effectively applied
CREATE TEMPORARY TABLE discounted_weeks (
    SELECT
        YEAR(order_date) AS year,
        WEEK(order_date) AS week,
        discount AS discount
    FROM 
        (SELECT
            order_date,
            CASE WHEN discount > 0 THEN 'Yes' ELSE 'No' END AS discount
        FROM order_item
        LEFT JOIN orders ON order_item.order_id = orders.order_id) AS date_discount
    WHERE discount = 'Yes'
    GROUP BY 1,2,3
);


-- Comparing effective discounted weeks with theoretical ones

-- Retrieving weeks in 'discounted_weeks' table not in 'marketing_campaings' table
SELECT *
FROM discounted_weeks
LEFT JOIN marketing_campaigns ON discounted_weeks.week = marketing_campaigns.offer_week
WHERE marketing_campaigns.offer_week IS NULL;

-- Retrieving weeks in 'marketing_campaings' table not in 'discounted_weeks' table
SELECT *
FROM discounted_weeks
RIGHT JOIN marketing_campaigns ON discounted_weeks.week = marketing_campaigns.offer_week
WHERE discounted_weeks.week IS NULL;


-- We notice some discrepencies between effective discounts applied and the theoretical discounts.
-- Slight change in the initial question : Are the marketing campaigns boosting the numbers of orders placed per discounted day ?

-- Average number of orders placed during discounted days vs normal days using effective data
WITH discounted_days AS (
    SELECT
        DATE(order_date) AS order_date,
        CASE WHEN discount > 0 THEN 'Yes' ELSE 'No' END AS discount
    FROM order_item
    LEFT JOIN orders ON order_item.order_id = orders.order_id
    WHERE discount > 0
    GROUP BY 1,2)

SELECT
    discount,
    AVG(count_orders) AS avg_orders
FROM 
    (SELECT 
        DATE(orders.order_date) AS order_date,
        CASE WHEN discounted_days.discount = 'Yes' THEN 'Yes' ELSE 'No' END AS discount,
        COUNT(DISTINCT order_id) AS count_orders
    FROM orders
    LEFT JOIN discounted_days ON DATE(orders.order_date) = discounted_days.order_date
    GROUP BY 1,2
    ORDER BY count_orders DESC) AS orders_by_discounted_days
GROUP BY discount;
