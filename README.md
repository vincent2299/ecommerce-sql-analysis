# E-Commerce Sales & Customer Insights (SQL practice Project)

## Project Overview
This project shows some SQL skills by analyzing an e-commerce database. I generated a simple relational database with four tables (`Customers`, `Orders`, `Products`, `Order_Items`) and wrote queries to extract actionable business insights regarding revenue, product performance, and customer behavior.

## Output sample:
<img width="1910" height="840" alt="image" src="https://github.com/user-attachments/assets/31fed8e8-e3e9-47db-9e77-c059b68595cc" />


## Tech Stack
- **Database:** PostgreSQL
- **Concepts Applied:** Joins, Aggregations, Control Flow (`CASE WHEN`), Window Functions (`ROW_NUMBER()`, `LAG()`), and Common Table Expressions (CTEs).

## The Business Problems Solved
**1. Total Revenue by Category:** 
Used `INNER JOIN` and `GROUP BY` to aggregate sales data and determine which product categories generate the most income.

**2. Customer Segmentation:** 
Used `CASE WHEN` logic to group customers into 3 groups: 'VIP', 'Regular', and 'Occasional' based on their total lifetime spending.

**3. Top-Selling Products per Category:** 
Used a CTE and the `ROW_NUMBER()` Window Function to accurately isolate and rank the #1 selling product within each specific category without losing the product's name.

**4. Month-over-Month Growth:** 
Used the `LAG()` Window Function alongside `DATE_TRUNC` to compare current month revenue against previous month revenue, calculating the exact percentage of business growth.

## How to Run the Code
All code was written for PostgreSQL. You can view the raw SQL queries in the `.sql` files within this repository, or run them yourself by copying the schema and queries into any free SQL environment like [DB Fiddle](https://www.db-fiddle.com/).
