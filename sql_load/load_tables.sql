 SET GLOBAL local_infile = 'ON';

-- LOAD the various tables with the data

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/customer.csv'
INTO TABLE customer
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/supplier.csv'
INTO TABLE supplier
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/payment_method.csv'
INTO TABLE payment_method
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/category.csv'
INTO TABLE category
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/subcategory.csv'
INTO TABLE subcategory
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/marketing_campaigns.csv'
INTO TABLE marketing_campaigns
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/campaign_product_subcategory.csv'
INTO TABLE campaign_product_subcategory
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/product.csv'
INTO TABLE product
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/order_item.csv'
INTO TABLE order_item
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/returns.csv'
INTO TABLE returns
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/gilles/Documents/Data/Projects/Ecommerce Company/Data/customer_product_ratings.csv'
INTO TABLE customer_product_ratings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


