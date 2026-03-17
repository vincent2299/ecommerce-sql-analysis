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

-- task 2: Segment customers by how much money they spend
-- goal : give custumor status: regular, occaisonal, VIP
-- based on lifetime spending

-- get base data, so: customer and spending (orders)
SELECT 
	c.name,
    SUM(o.total_amount) as total_spent,
-- now we have a list of names with money spent
-- assign their status
  	CASE
    	WHEN SUM(o.total_amount) > 1000 THEN 'VIP'
    	WHEN SUM(o.total_amount) between 500 AND 1000 THEN 'Regular'
    	WHEN SUM(o.total_amount) < 500 THEN 'Occaisonal'
  	END AS customer_segment

FROM Customers c
-- assign order to custumer ID and status
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

-- task 3: identif the top selling product in each category

-- create a temporary table (CTE) to get total sales for each product
WITH ProductSales AS (
	SELECT
  		p.category,
  		p.product_name,
  		SUM(oi.quantity) as total_sold
  	FROM Order_Items oi
  	JOIN Products p ON oi.product_id = p.product_id
  	GROUP BY p.category, p.product_name
),

-- create a CTE to rank the sales

RankedSales AS(
  	SELECT
  		category,
  		product_name,
  		total_sold,
  		-- use ROW_NUMBER() to get the best (i.e #1)
  		-- PARTITION BY means restart counting at 1 every category
  		--ORDER BY total_sold means get the ones with highest ammount first
  		ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_sold DESC) as rank
  	FROM ProductSales
  )
  
  -- query the final CTE and get #1s
  SELECT
  	category,
    product_name,
    total_sold
 FROM RankedSales
 WHERE rank = 1;
