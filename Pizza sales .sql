-- " PIZZA SALES REPORT PROJECT "

SELECT * FROM pizza_sales

-- The sum of the total price of all pizza orders.

SELECT CEILING(SUM(total_price)) AS [Total Revenue Price]
FROM pizza_sales;

-- The average amount spent per order, 
-- calculated by dividing the total revenue by the total number of orders.

SELECT FLOOR(SUM(total_price) / COUNT(DISTINCT(order_id))) AS [Avg order value]
FROM pizza_sales;

-- The sum of the quantities of all pizza sold.

SELECT SUM(quantity)AS [Total pizza sold] 
FROM pizza_sales;

-- The total number of order placed.

SELECT COUNT(distinct(order_id)) AS [Total_orders]
FROM pizza_sales;

-- The average pizza per order,
-- calculated by dividing total number of pizzas sold by the total number of orders.

SELECT
CAST(CAST(SUM(quantity) AS decimal(10,2)) / 
CAST(COUNT(DISTINCT(order_id)) AS decimal(10,2)) AS decimal(10,2)) AS [Avg per order]
FROM pizza_sales;

-- Daily trend for total orders.

SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY COUNT(DISTINCT order_id);

-- Monthly trend for total orders.

SELECT DATENAME(MONTH, order_date) AS Month_Name,
COUNT(DISTINCT order_id) AS [Total orders per month]
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY COUNT(DISTINCT order_id) DESC;

-- Hourly trend for total orders.

SELECT DATENAME(HOUR, order_time) AS [Hourly total orders],
COUNT(DISTINCT order_id) AS [Total order]
FROM pizza_sales
GROUP BY DATENAME(HOUR, order_time)
ORDER BY COUNT(DISTINCT order_id) DESC;

-- percentage of sales by pizza category.

SELECT pizza_category,
ROUND((SUM(total_price)*100) / 
(SELECT CAST(SUM(total_price) AS decimal(10)) FROM pizza_sales),2) AS [Percentage]
FROM pizza_sales
GROUP BY pizza_category;

-- '(OR)'

SELECT pizza_category,
CAST((SUM(total_price)*100) / 
(SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS [Percentage]
FROM pizza_sales
GROUP BY pizza_category;

-- Percentage of sales by pizza size.

SELECT pizza_size,
CAST((SUM(total_price)*100) / 
(SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS [Percentage]
FROM pizza_sales
GROUP BY pizza_size;

-- Total pizza sold by pizza category

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

-- Top 5 revenue sales

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

-- Bottom 5 revenue sales

SELECT TOP 5 pizza_name,
ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue;

-- Top 5 for best quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC;

-- Bottom 5 pizzas by quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity;

-- Top 5 pizzas by total orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC;

-- Bottom 5 pizzas by total orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders;

-- " Starting with my own Analysis and Insights "
-- " After understanding the core analysis from the tutorial, I extended the project by asking my own questions and writing new SQL queries "
-- As i came with this questions:
/* 1. In which order time customer prefer the most?
   2. Which pizza category is sold the highest as well as the lowest?
   3. Total pizza with distinct name and ingredients?
   4. Which Month customer buys the most?
   5. What is the total revenue generated each month along with percentage?
   6. What is the total revenue and its percentage share by each day of the week?
   7. Which ingredients is prefered the most from people?
   8. What is the commonly used ingredient across all pizza orders?
   9. Which pizza size is sold the most as well as least?*/


-- 1. In which order time customer prefer the most?

SELECT TOP 1 COUNT(order_id) AS [Total orders], DATENAME(HOUR, order_time) AS [Order Time]
FROM pizza_sales
GROUP BY DATENAME(HOUR, order_time)
ORDER BY [Total orders] DESC;

/* OUTPUT : 
     Most preferred order time: 12 PM
     Total orders placed at 12 PM: 6543 orders */

--  2.  Which pizza category is sold the highest as well as the lowest?

SELECT TOP 1 pizza_category, COUNT(order_id) AS [Order ID]
FROM pizza_sales
GROUP BY pizza_category
ORDER BY [Order ID] DESC;

SELECT TOP 1 pizza_category, COUNT(order_id) AS [Order ID]
FROM pizza_sales
GROUP BY pizza_category
ORDER BY [Order ID] ASC;

/* OUTPUT:
      Most sold pizza category: Classic - 14579 [Orders]
      Least sold pizza category: Chicken - 10815[Orders] */

-- 3. Total pizza with distinct name and ingredients?

SELECT  COUNT(DISTINCT(Pizza_name + pizza_ingredients)) AS [Total Unique Pizza]
FROM pizza_sales;

/* OUTPUT:
     Total Unique Pizza : 32 */

-- 4. Which Month customer buys the most and buys the least?

-- Maximum Month Customer buys the most:

SELECT TOP 1 COUNT(order_id) AS [Orders] , DATENAME(MONTH, order_date) AS [Month]
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY [Orders] DESC;

-- Least Month Customer buys the least:

SELECT TOP 1 COUNT(order_id) AS [Orders] , DATENAME(MONTH, order_date) AS [Month]
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY [Orders] ASC;

/* OUTPUT:
    Maximum Month Customer buys the most: Order - 4301, Month - July 
	Least Month Customer buys the least: Order - 3797, Month - October */

-- 5. What is the total revenue generated each month along with percentage?

SELECT DATENAME(MONTH, order_date) AS [Month],
ROUND(SUM(total_price),2) AS [Total Revenue],
ROUND(
    (SUM(total_price) * 100.0) / 
    (SELECT SUM(total_price) FROM pizza_sales), 
    2
  ) AS [Percentage of Total Revenue]
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY [Total Revenue] DESC;

/* 1.Useful for seasonal trend analysis.
   2.Can be used to make marketing decisions like offering discounts during low-performing months.*/

--  6. What is the total revenue and its percentage share by each day of the week?

SELECT DATENAME(DW, order_date) AS [Days],
ROUND(SUM(total_price),2) AS [Total Revenue],
ROUND(
    (SUM(total_price) * 100.0) / 
    (SELECT SUM(total_price) FROM pizza_sales), 
    2
  ) AS [Percentage of Total Revenue]
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY [Total Revenue] DESC;

/* 1. Focus offers or discounts on low-performing days to increase sales.
   2. Help stakeholders understand customer demand cycles — weekdays vs. weekends */

-- 7. Ingredients that prefered the most from people from highest to lowest?

SELECT pizza_ingredients, COUNT(*) AS Total_Pizzas
FROM pizza_sales
group by pizza_ingredients
ORDER BY Total_Pizzas DESC;

-- 8. What is the commonly used ingredient across all pizza orders?

SELECT TRIM(value) AS Ingredients, COUNT(*) AS [Count]
FROM pizza_sales
CROSS APPLY STRING_SPLIT(pizza_ingredients, ',')
GROUP BY TRIM(value)
ORDER BY [Count] DESC;

/* 1. Ordering the results by the count allows for easy identification of the top ingredients.
   2. Helps restaurants understand which ingredients are popular and it is also
   useful for menu planning.*/

-- 9. Which pizza size is sold the most as well as least?

SELECT pizza_size, COUNT(*) AS Total_Sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Total_Sales DESC;

/* 1. It directly reflects customer preferences, which can be used to improve overall business strategy.
   2. The results tell you which pizza sizes are most popular (at the top) and which are least popular (at the bottom).
   3. It groups Pizza size so that we can see total sales for each size*/