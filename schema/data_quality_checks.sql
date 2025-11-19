-- Check missing emails
SELECT * FROM customers
WHERE email IS NULL;

-- Check invalid amount values
SELECT * FROM sales
WHERE amount < 0;

-- Check orphan sales (invalid customer_id)
SELECT * FROM sales
WHERE customer_id NOT IN (SELECT customer_id FROM customers);

-- Count duplicates
SELECT product_id, COUNT(*)
FROM sales
GROUP BY product_id
HAVING COUNT(*) > 1;
