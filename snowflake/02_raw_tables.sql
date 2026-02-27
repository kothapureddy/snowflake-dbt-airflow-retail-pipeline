USE SCHEMA RAW;

CREATE OR REPLACE TABLE CUSTOMERS (
    customer_id INT,
    name STRING,
    city STRING,
    signup_date DATE
);

CREATE OR REPLACE TABLE PRODUCTS (
    product_id INT,
    product_name STRING,
    category STRING,
    price NUMBER
);

CREATE OR REPLACE TABLE ORDERS (
    order_id INT,
    customer_id INT,
    order_date DATE,
    status STRING
);

CREATE OR REPLACE TABLE ORDER_ITEMS (
    order_id INT,
    product_id INT,
    quantity INT
);