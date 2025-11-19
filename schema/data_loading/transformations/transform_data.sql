-- Standardize customer names
UPDATE customers
SET name = INITCAP(name);

-- Standardize email to lowercase
UPDATE customers
SET email = LOWER(email);

-- Remove special characters from product names
UPDATE sales
SET product = REGEXP_REPLACE(product, '[^a-zA-Z0-9 ]', '');

-- Convert sale_date into consistent format (YYYY-MM-DD)
UPDATE sales
SET sale_date = TO_CHAR(TO_DATE(sale_date, 'DD-MM-YYYY'), 'YYYY-MM-DD');
