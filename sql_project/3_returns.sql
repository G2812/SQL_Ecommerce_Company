-- Question 3 : What are the products most likely returned ?

SELECT 
    name AS product_name,
    SUM(CASE WHEN return_id IS NULL THEN 0 ELSE quantity END) AS qty_returned,
    SUM(quantity) AS qty_sold,
    SUM(CASE WHEN return_id IS NULL THEN 0 ELSE quantity END)/SUM(quantity) AS perc_returned
FROM order_item
LEFT JOIN returns ON order_item.order_id = returns.order_id AND order_item.product_id = returns.product_id
LEFT JOIN product ON order_item.product_id = product.product_id
GROUP BY name
ORDER BY perc_returned DESC;