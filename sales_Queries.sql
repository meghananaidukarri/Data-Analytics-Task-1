-- create the database
CREATE DATABASE sales_db;
-- Use the database
USE sales_db;
-- create table
CREATE TABLE sales_data (
    order_id VARCHAR(20),
    order_date DATE,
    customer_name VARCHAR(100),
    region VARCHAR(50),
    product_category VARCHAR(100),
    sales DECIMAL(10,2),
    quantity INT,
    profit DECIMAL(10,2),
    discount DECIMAL(5,2)
);
-- View complete dataset
SELECT * FROM sales_data;
-- Calculate total number of orders
SELECT COUNT(*) FROM sales_data;
-- Total sales by region 
SELECT region, SUM(sales) AS total_sales
FROM sales_data
GROUP BY region;
-- Top 5 profitable products
SELECT `product category`, SUM(profit) AS total_profit
FROM sales_data
GROUP BY `product category`
ORDER BY total_profit DESC
LIMIT 5;
-- Monthly sales trend
SELECT 
    MONTHNAME(STR_TO_DATE(`order date`, '%Y-%m-%d')) AS month,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY MONTH(STR_TO_DATE(`order date`, '%Y-%m-%d')),
         MONTHNAME(STR_TO_DATE(`order date`, '%Y-%m-%d'))
ORDER BY MONTH(STR_TO_DATE(`order date`, '%Y-%m-%d'));
-- Highest discount impact
SELECT 
    discount,
    AVG(profit) AS average_profit
FROM sales_data
GROUP BY discount
ORDER BY discount;