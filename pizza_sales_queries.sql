-- 1 - Total Revenue: The sum of the total price of all pizza orders

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- 2 - Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.

SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;

-- 3 - Total Pizzas Sold: The sum of the quantities of all pizzas sold.

SELECT SUM(quantity) AS Total_pizzas_sold FROM pizza_sales;

-- 4 - Total Orders: The total number of orders placed.

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- 5 - Average Pizza Per Order: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT(order_id)) AS DECIMAL (10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM pizza_sales;

-- Chart Requirments MySQL queries Below:

-- 1 - Daily Trend for Total Orders

SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales GROUP BY DAYNAME(order_date);

-- 2 - Monthly Trend for Total Orders:

SELECT MONTHNAME(order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales GROUP BY MONTHNAME(order_date);

-- 3- Percentage of Sales by Pizza Category:

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percentage FROM pizza_sales GROUP BY pizza_category;

-- 4 - Percentage of sales by pizza size:

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percentage FROM pizza_sales GROUP BY pizza_size ORDER BY pizza_size;

-- 5 - Total Pizzas Sold by Pizza Category:

SELECT pizza_category, SUM(quantity) AS total_quantity_sold FROM pizza_sales WHERE MONTH (order_date) = 2 GROUP BY pizza_category ORDER BY Total_Quantity_Sold DESC;

-- 6 - Top 5 Pizzas by Revenue:

SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue DESC LIMIT 5;

-- 7 - Bottom 5 Pizzas by Revenue:

SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue ASC LIMIT 5;

-- 8 - Top 5 Pizzas by Quantity:

SELECT pizza_name, SUM(quantity) as Total_pizzas_sold FROM pizza_sales GROUP BY pizza_name ORDER BY pizza_name DESC LIMIT 5;

-- 9 - Bottom 5 Pizzas by Quantity:

SELECT pizza_name, SUM(quantity) as Total_pizzas_sold FROM pizza_sales GROUP BY pizza_name ORDER BY pizza_name ASC LIMIT 5;

-- 10 - Top 5 Pizzas by Total Orders:

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Orders DESC LIMIT 5;

-- 11 - Bottom 5 Pizzas by Total Orders:

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Orders ASC LIMIT 5;