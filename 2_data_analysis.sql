-- task 1: Total revenue by product categories

-- Get data for math: price x quantity
SELECT p.category, SUM(oi.quantity * p.price) AS total_revenue

-- need category and price
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id

-- organize by catgeory
GROUP BY p.category

-- get biggest numbers on top
ORDER BY total_revenue DESC;
