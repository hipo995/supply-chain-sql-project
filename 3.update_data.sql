UPDATE customers
SET 
    email = CASE customer_id
        WHEN 1 THEN 'anna.mueller@gmail.com'
        WHEN 2 THEN NULL
        WHEN 3 THEN 'laura.w@gmail.com'
        WHEN 4 THEN NULL
        WHEN 5 THEN 'sophie.d@gmail.com'
        WHEN 6 THEN NULL
        WHEN 7 THEN 'emma.b@gmail.com'
        WHEN 8 THEN 'luca.rossi@gmail.com'
        WHEN 9 THEN 'sarah.j@gmail.com'
    END,
    
    phone = CASE customer_id
        WHEN 1 THEN NULL
        WHEN 2 THEN '+49 151 222333'
        WHEN 3 THEN NULL
        WHEN 4 THEN NULL
        WHEN 5 THEN '+33 612345678'
        WHEN 6 THEN NULL
        WHEN 7 THEN NULL
        WHEN 8 THEN '+39 333111222'
        WHEN 9 THEN NULL
    END,

    city = CASE customer_id
        WHEN 1 THEN 'Berlin'
        WHEN 2 THEN 'Hamburg'
        WHEN 3 THEN 'Vienna'
        WHEN 4 THEN 'Chicago'
        WHEN 5 THEN 'Paris'
        WHEN 6 THEN 'Istanbul'
        WHEN 7 THEN 'London'
        WHEN 8 THEN 'Milan'
        WHEN 9 THEN 'New York'
    END,

    segment = CASE customer_id
        WHEN 1 THEN 'B2C'
        WHEN 2 THEN 'B2C'
        WHEN 3 THEN 'B2B'
        WHEN 4 THEN 'B2C'
        WHEN 5 THEN 'B2C'
        WHEN 6 THEN 'B2B'
        WHEN 7 THEN 'B2C'
        WHEN 8 THEN 'B2C'
        WHEN 9 THEN 'B2B'
    END,

    signup_date = CASE customer_id
        WHEN 1 THEN '2024-01-01'
        WHEN 2 THEN '2024-01-02'
        WHEN 3 THEN '2024-01-03'
        WHEN 4 THEN '2024-01-04'
        WHEN 5 THEN '2024-01-05'
        WHEN 6 THEN '2024-01-06'
        WHEN 7 THEN '2024-01-07'
        WHEN 8 THEN '2024-01-12'
        WHEN 9 THEN '2024-01-10'
    END;


