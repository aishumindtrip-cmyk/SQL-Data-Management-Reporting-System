-- Top selling products
SELECT p.product_name, SUM(s.amount) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

-- Total sales by customer
SELECT c.customer_name, SUM(s.amount) AS total_spent
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_name;

-- Monthly revenue trend
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month, SUM(amount) AS revenue
FROM sales
GROUP BY month
ORDER BY month;
