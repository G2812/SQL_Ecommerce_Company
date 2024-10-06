-- Question 5 : Are the marketing campaings boosting the numbers of orders placed during the specific weeks ? 

-- Retrieving weeks of the years during wich a discount was effectively applied

CREATE TEMPORARY TABLE discount_weeks (
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

-- Comparing effective discount weeks with theoretical ones

SELECT *
FROM discount_weeks
LEFT JOIN marketing_campaigns ON discount_weeks.week = marketing_campaigns.offer_week;

-- We notice some discrepencies between effective discounts applied and the theoretical discounts.

-- Average number of orders placed during discount weeks vs normal weeks using effective discount weeks

SELECT 
    discount,
    AVG(orders) AS avg_orders
FROM 
    (SELECT 
        YEAR(order_date) AS year,
        WEEK(order_date) AS week,
        CASE WHEN discount = 'Yes' THEN 'Yes' ELSE 'No' END AS discount,
        COUNT(DISTINCT order_id) AS orders
    FROM orders
    LEFT JOIN discount_weeks ON YEAR(orders.order_date) = discount_weeks.year AND WEEK(orders.order_date) = discount_weeks.week
    GROUP BY 1,2,3
    ORDER BY orders DESC) AS orders_by_discount_week
GROUP BY discount;

-- Average number of orders placed during discount weeks vs normal weeks using theoretical discount weeks

SELECT 
    discount,
    AVG(orders) AS avg_orders
FROM 
    (SELECT
        YEAR(order_date) AS year,
        WEEK(order_date) AS week,
        CASE WHEN campaign_name IS NULL THEN 'No' ELSE 'Yes' END AS discount,
        COUNT(DISTINCT order_id) AS orders
    FROM orders
    LEFT JOIN marketing_campaigns ON WEEK(orders.order_date) = marketing_campaigns.offer_week
    GROUP BY 1,2,3
    ORDER BY orders DESC) AS orders_by_discount_week
GROUP BY discount;

-- Very similar results with both methods, it seems that the date doesn't really make sense

