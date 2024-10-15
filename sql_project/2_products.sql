-- Question 2 : What are the top-sellings categories of product ? 
-- In this question, we are looking at the products sold but instead of looking at the best indiviual products (in terms of number of items sold 
-- or in terms of customer reviews, similarly to what we did for the customers), we are checking the percentage of total sales for each category 
-- of product to find the top-selling categories.

-- But before checking the top categories, we can do a quick a check to see if there are any products that are not selling

SELECT name
FROM product
WHERE product_id NOT IN
    (SELECT DISTINCT product_id
     FROM order_item);


-- Top categories in terms of percentage of the total sales

SELECT
    category_name,
    SUM(subtotal)/SUM(SUM(subtotal)) OVER() AS perc_of_total_sales
FROM product
LEFT JOIN order_item on product.product_id = order_item.product_id
LEFT JOIN subcategory on product.subcategory_id = subcategory.subcategory_id
LEFT JOIN category on subcategory.category_id = category.category_ID
GROUP BY category_name
ORDER BY perc_of_total_sales DESC;