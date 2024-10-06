-- Question 4 : What are the suppliers most likety to disappoint ?

-- Extracting the possible reasons for a return

SELECT DISTINCT reason
FROM returns;

-- The supplier with the highest rates of return due to poor quality products
-- Assumption : we assume that the suppliers are not responsibles of the packing of the final orders, that's why we are not
-- including "Received wrong product" and "Color doesn't match" in the reasons below.

SELECT
    supplier_name,
    COUNT(DISTINCT returns.order_id) AS defective_orders,
    COUNT(DISTINCT order_item.order_id) AS total_orders,
    COUNT(DISTINCT returns.order_id)/COUNT(DISTINCT order_item.order_id) AS percentage_defective_orders
FROM order_item
LEFT JOIN returns ON returns.order_id = order_item.order_id AND returns.product_id = order_item.product_id
LEFT JOIN supplier ON order_item.supplier_id = supplier.supplier_id
WHERE reason IN ("Item not as described", "Product didn't meet expecations", "Defective product") OR reason IS NULL
GROUP BY supplier_name
ORDER BY percentage_defective_orders DESC;