🔵 SOURCE LAYER (RAW)
INSERT INTO customers VALUES
(1, 'Anna Müller', 'Germany'),
(2, 'Max Schmidt', 'Germany'),
(3, 'Laura Weber', 'Austria'),
(4, 'John Miller', 'USA'),
(5, 'Sophie Dubois', 'France'),
(6, 'Ali Yilmaz', 'Turkey'),
(7, 'Emma Brown', 'UK'),
(8, 'Luca Rossi', 'Italy', 'luca.rossi@gmail.com', '+39 333 111222', 'Milan', 'B2C', '2024-01-12'),
(9, 'Sarah Johnson', 'USA', 'sarah.j@gmail.com', '+1 212 555777', 'New York', 'B2B', '2024-01-10');

INSERT INTO orders VALUES
(101, 1, '2024-01-01', 'Delivered'),
(102, 2, '2024-01-03', 'Delivered'),
(103, 3, '2024-01-05', 'Shipped'),
(104, 4, '2024-01-06', 'Processing'),
(105, 5, '2024-01-07', 'Delivered'),
(106, 6, '2024-01-08', 'Delivered'),
(107, 7, '2024-01-09', 'Created'),
(108, 1, '2024-01-10', 'Shipped'),
(109, 2, '2024-01-11', 'Delivered');

INSERT INTO shipments VALUES
(1, 101, '2024-01-04', '2024-01-06'),
(2, 102, '2024-01-03', '2024-01-05'),
(3, 103, '2024-01-06', NULL),
(4, 105, '2024-01-07', '2024-01-09'),
(5, 106, '2024-01-08', '2024-01-10'),
(6, 108, '2024-01-10', NULL),
(7, 109, '2024-01-11', '2024-01-13');

INSERT INTO order_status_history VALUES
(1, 101, 'Created', '2024-01-01'),
(2, 101, 'Processing', '2024-01-02'),
(3, 101, 'Shipped', '2024-01-04'),
(4, 101, 'Delivered', '2024-01-06');

🟢 DIMENSION LAYER

INSERT INTO dim_customer
SELECT
    customer_id,
    customer_id,
    name,
    country,
    city,
    segment,
    email,
    CASE 
        WHEN phone IS NULL THEN 0
        ELSE 1
    END,
    signup_date
FROM customers;

INSERT INTO dim_shipment
SELECT
    shipment_id,
    shipped_date,
    delivery_date,
    CASE 
        WHEN delivery_date IS NULL THEN NULL
        ELSE delivery_date - shipped_date
    END
FROM shipments;


INSERT INTO dim_product (product_id, product_name, category, brand, cost_price) VALUES
(1, 'iPhone 14', 'Electronics', 'Apple', 799.00),
(2, 'Galaxy S23', 'Electronics', 'Samsung', 699.00),
(3, 'MacBook Air M2', 'Computers', 'Apple', 999.00),
(4, 'ThinkPad X1 Carbon', 'Computers', 'Lenovo', 1200.00),
(5, 'AirPods Pro', 'Accessories', 'Apple', 199.00),
(6, 'Sony WH-1000XM5', 'Accessories', 'Sony', 349.00),
(7, 'Nike Air Max 270', 'Footwear', 'Nike', 150.00),
(8, 'Adidas Ultraboost', 'Footwear', 'Adidas', 180.00),
(9, 'Instant Pot Duo', 'Home Appliances', 'Instant Pot', 89.00),
(10, 'Dyson V11 Vacuum', 'Home Appliances', 'Dyson', 599.00);

INSERT INTO dim_date
SELECT
    date('2024-01-01', '+' || n || ' day') AS date_key,
    CAST(strftime('%Y', date('2024-01-01', '+' || n || ' day')) AS INT) AS year,
    CAST(strftime('%m', date('2024-01-01', '+' || n || ' day')) AS INT) AS month,
    CAST(strftime('%d', date('2024-01-01', '+' || n || ' day')) AS INT) AS day,
    CASE strftime('%w', date('2024-01-01', '+' || n || ' day'))
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS weekday,
    ((CAST(strftime('%m', date('2024-01-01', '+' || n || ' day')) AS INT)-1)/3)+1 AS quarter
FROM (
    SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL
    SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL
    SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL
    SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL
    SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL
    SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL
    SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL
    SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30
);

🔴 FACT LAYER
INSERT INTO fact_orders (order_id, customer_id, order_date, status)
SELECT 
    order_id,
    customer_id,
    order_date,
    status
FROM orders;
