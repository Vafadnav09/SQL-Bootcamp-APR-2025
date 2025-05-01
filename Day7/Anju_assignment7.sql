-- 1.     Rank employees by their total sales

SELECT 
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    COUNT(o.order_id) AS total_orders,
    RANK() OVER (ORDER BY COUNT(o.order_id) DESC) AS rank
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY rank;

--2.      Compare current order's freight with previous and next order for each customer.
--(Display order_id,  customer_id,  order_date,  freight,
--Use lead(freight) and lag(freight).


SELECT
    order_id,
    customer_id,
    order_date,
    freight,
    LAG(freight) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_freight,
    LEAD(freight) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_freight
FROM
    orders
ORDER BY
    customer_id, order_date;

--3.     Show products and their price categories, product count in each category, avg price:

--Step 1: Define the CTE to categorize prices
WITH price_cte AS (
    SELECT 
        product_id,
        product_name,
        unit_price,
        CASE
            WHEN unit_price < 20 THEN 'Low Price'
            WHEN unit_price < 50 THEN 'Medium Price'
            ELSE 'High Price'
        END AS price_category
    FROM 
        products
)

-- Step 2: Main query to count and average by category
SELECT 
    price_category,
    COUNT(*) AS product_count,
    ROUND(AVG(unit_price)::numeric, 2) AS avg_price
FROM 
    price_cte
GROUP BY 
    price_category
ORDER BY 
    price_category;
	