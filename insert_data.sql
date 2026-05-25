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
