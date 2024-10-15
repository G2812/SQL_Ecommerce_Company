-- Question 4 : What are the suppliers most likety to disappoint ?

-- Extracting the possible reasons for a return

SELECT DISTINCT reason
FROM returns;

-- The suppliers with the highest rates of return due to defective orders

-- Extract the id's of the orders for which there is at least one defective item
WITH defective_orders_id AS (
    SELECT DISTINCT order_id
    FROM returns
    WHERE reason IN ("Received wrong product", "Color doesn't match", "Item not as described", "Product didn't meet expecations", "Defective product")
)

-- Retrieving the percentage of defective orders per supplier
SELECT
    supplier_name,
    COUNT(DISTINCT defective_orders_id.order_id) AS defective_orders,
    COUNT(DISTINCT order_item.order_id) AS total_orders,
    COUNT(DISTINCT defective_orders_id.order_id)/COUNT(DISTINCT order_item.order_id) AS perc_defective_orders
FROM order_item
LEFT JOIN defective_orders_id ON defective_orders_id.order_id = order_item.order_id
LEFT JOIN supplier ON order_item.supplier_id = supplier.supplier_id
GROUP BY supplier_name
ORDER BY perc_defective_orders DESC;