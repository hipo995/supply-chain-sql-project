\\ 1. Fehlende Customer-Daten ergänzen (Data Cleaning)
UPDATE customers
SET email = 'unknown@example.com'
WHERE email IS NULL;

UPDATE customers
SET city = 'Unknown'
WHERE city IS NULL;

\\2. Customer 1–2 nachträglich verbessern (Realistic enrichment)
  
UPDATE customers
SET 
    email = 'anna.mueller@gmail.com',
    phone = '+49 151 123456',
    city = 'Berlin',
    customer_segment = 'B2C',
    registration_date = '2023-12-01'
WHERE customer_id = 1;

UPDATE customers
SET 
    email = 'max.schmidt@gmail.com',
    phone = '+49 160 987654',
    city = 'Hamburg',
    customer_segment = 'B2C',
    registration_date = '2023-11-15'
WHERE customer_id = 2;

\\3. Order Status korrigieren (Business Update)

UPDATE orders
SET status = 'Delivered'
WHERE order_id = 103;

UPDATE orders
SET status = 'Processing'
WHERE order_id = 107;

\\4. Shipment Update (Lieferung abgeschlossen)

UPDATE shipments
SET delivery_date = '2024-01-12'
WHERE shipment_id = 3;

UPDATE shipments
SET delivery_date = '2024-01-14'
WHERE shipment_id = 6;

\\5. Business Scenario Update 

UPDATE customers
SET customer_segment = 'B2B'
WHERE customer_id = 9;

