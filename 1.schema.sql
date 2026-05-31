
Fact Tables 🔵 SOURCE LAYER 

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(50)
);

CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    shipped_date DATE,
    delivery_date DATE
);

CREATE TABLE order_status_history (
    id INT PRIMARY KEY,
    order_id INT,
    status VARCHAR(50),
    status_date DATE
);


Dimension Tables 🟢 DIMENSION LAYER

1. dim_customer (erste Dimension)

CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY,
    customer_id INT,
    name VARCHAR(100),


    country VARCHAR(50),
    city VARCHAR(50),
    segment VARCHAR(10),
    email VARCHAR(100),
    has_phone INT,
    signup_date DATE
);


2. dim_date
CREATE TABLE dim_date (
    date_key DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    weekday VARCHAR(10),
    quarter INT
);
3. dim_shipment
CREATE TABLE dim_shipment (
    shipment_key INT PRIMARY KEY,
    shipped_date DATE,
    delivery_date DATE,
    delivery_days INT
);
4. dim_order_status
CREATE TABLE dim_order_status (
    status_key INT PRIMARY KEY, 
    status VARCHAR(50) 
    
🔴 FACT LAYER
    CREATE TABLE fact_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    status VARCHAR(50)
);





