-- Load cleaned customers into final table
INSERT INTO customers_final (customer_id, name, email, city)
SELECT customer_id, name, email, city
FROM customers;

-- Load cleaned sales into final table
INSERT INTO sales_final (sale_id, customer_id, product, amount, sale_date)
SELECT sale_id, customer_id, product, amount, sale_date
FROM sales;

-- Optional: validate row counts
SELECT 
    (SELECT COUNT(*) FROM customers) AS source_customers,
    (SELECT COUNT(*) FROM customers_final) AS target_customers,
    (SELECT COUNT(*) FROM sales) AS source_sales,
    (SELECT COUNT(*) FROM sales_final) AS target_sales;
