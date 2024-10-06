-- Question 2 : What are the top-sellings categories of product ? 
-- In this question, we are looking at the products sold but instead of looking at the best indiviual products (in terms of number of items sold 
-- or in terms of customer reviews, similarly to what we did for the customers), we are checking the percentage of total sales for each category 
-- of product to find the top-selling categories.

-- But before checking the top categories, we can do a quick a check to see if there are any products that are not selling

SELECT DISTINCT name
FROM product
LEFT JOIN order_item on product.product_id = order_item.product_id
WHERE order_item.product_id IS NULL;

-- Top categories in terms of percentage of the total sales

WITH total_sales AS (
SELECT 
    order_item_id,
    order_id,
    product.product_id,
    subtotal,
    category.category_ID,
    category_name,
    SUM(subtotal) OVER () AS total_sales
FROM product
LEFT JOIN order_item on product.product_id = order_item.product_id
LEFT JOIN subcategory on product.subcategory_id = subcategory.subcategory_id
LEFT JOIN category on subcategory.category_id = category.category_ID
)

SELECT 
    category_name,
    SUM(subtotal)/total_sales AS category_percentage
FROM total_sales
GROUP BY category_name, total_sales
ORDER BY category_percentage DESC;