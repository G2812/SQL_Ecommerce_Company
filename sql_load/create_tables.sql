USE ecommerce_project;

-- CREATE customer table

CREATE TABLE customer (
    customer_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    country VARCHAR(100)
);

-- CREATE supplier table

CREATE TABLE supplier (
    supplier_id INT NOT NULL PRIMARY KEY,
    supplier_name VARCHAR(255),
    email VARCHAR(255)
);

-- CREATE payment method table 

CREATE TABLE payment_method (
    payment_method_id INT NOT NULL PRIMARY KEY,
    payment_method VARCHAR(50)
);

-- CREATE category table

CREATE TABLE category (
	category_ID INT NOT NULL PRIMARY KEY,
    category_name VARCHAR(50)
);

-- CREATE subcategory table

CREATE TABLE subcategory (
    subcategory_id INT NOT NULL PRIMARY KEY,
    subcategory_name VARCHAR(50),
    category_id INT REFERENCES category (category_id)
);

-- CREATE product table

CREATE TABLE product (
    product_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    price DOUBLE(10,2),
    description TEXT,
    subcategory_id INT REFERENCES subcategory (subcategory_id)
);

-- CREATE customer_product_ratings table

CREATE TABLE customer_product_ratings (
    customerproductrating_id INT NOT NULL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    ratings DOUBLE(2,1),
    review VARCHAR(255),
    sentiment VARCHAR(10)
);

-- CREATE marketing_campaigns table

CREATE TABLE marketing_campaigns (
    campaign_id INT NOT NULL PRIMARY KEY,
    campaign_name VARCHAR(255),
    offer_week INT
);

-- CREATE campaign_product_subcategory table

CREATE TABLE campaign_product_subcategory (
    campaign_product_subcategory_id INT NOT NULL PRIMARY KEY,
    campaign_id INT REFERENCES marketing_campaigns (campaign_id),
    subcategory_id INT REFERENCES subcategory (subcategory_id),
    discount DOUBLE(3,2)
);

-- CREATE orders table

CREATE TABLE orders (
    order_id_surrogate INT NOT NULL PRIMARY KEY,
    order_id INT,
    customer_id INT REFERENCES customer (customer_id),
    order_date TIMESTAMP,
    campaign_id INT REFERENCES marketing_campaign (campaign_id),
    amount INT,
    payment_method_id INT REFERENCES payment_method (payment_method_id)
);

-- CREATE order_item table

CREATE TABLE order_item (
    order_item_id INT NOT NULL PRIMARY KEY,
    order_id INT REFERENCES orders (order_id),
    product_id INT REFERENCES product (product_id),
    quantity INT,
    supplier_id INT REFERENCES supplier (supplier_id),
    subtotal DOUBLE(10,2),
    discount DOUBLE(5,2)
);

-- CREATE returns table

CREATE TABLE returns (
    return_id INT NOT NULL PRIMARY KEY,
    order_id INT REFERENCES orders (order_id),
    product_id INT REFERENCES product (product_id),
    return_date TIMESTAMP,
    reason TEXT,
    amount_refunded DOUBLE(10,2)
);

