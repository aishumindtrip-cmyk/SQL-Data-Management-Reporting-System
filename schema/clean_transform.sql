-- Remove duplicates
DELETE FROM customers
WHERE customer_id NOT IN (
    SELECT MIN(customer_id)
    FROM customers
    GROUP BY email
);

-- Standardize city names
UPDATE customers
SET city = UPPER(city);

-- Convert sale_date format if needed
UPDATE sales
SET sale_date = STR_TO_DATE(sale_date, '%d-%m-%Y')
WHERE sale_date LIKE '%-%-%';

-- Replace NULL amounts with 0
UPDATE sales
SET amount = 0
WHERE amount IS NULL;
