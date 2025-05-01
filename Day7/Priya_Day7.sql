1.     Rank employees by their total sales
(Total sales = Total no of orders handled, JOIN employees and orders table)


SELECT * FROM ORDERS;
SELECT * FROM EMPLOYEES;

SELECT 
    e.employee_id,
    o.order_id,
    oc.total_orders,
    RANK() OVER (ORDER BY oc.total_orders DESC) AS sales_rank
FROM employees e
LEFT JOIN orders o ON e.employee_id = o.employee_id
LEFT JOIN (
    SELECT 
        employee_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY employee_id
) oc ON e.employee_id = oc.employee_id;

2. Compare current order's freight with previous and next order for each customer.
(Display order_id,  customer_id,  order_date,  freight,
Use lead(freight) and lag(freight).

Select 
order_id, customer_id, order_date, freight,
lag(freight) Over(
partition by customer_id order by order_date) As Previous_freight,
freight-lag(freight) Over(
partition by customer_id order by order_date) As Diff_in_freight,
lead(freight) over(partition by customer_id ORDER BY order_date) As next_freight
From orders


3. Show products and their price categories, product count in each category, avg price:
        	(HINT:
·  	Create a CTE which should have price_category definition:
        	WHEN unit_price < 20 THEN 'Low Price'
            WHEN unit_price < 50 THEN 'Medium Price'
            ELSE 'High Price'
·  	In the main query display: price_category,  product_count in each price_category,  ROUND(AVG(unit_price)::numeric, 2) as avg_price)


 Select * from products;
 Select * from categories;

WITH pricecategories AS (
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
SELECT 
    price_category,
    COUNT(*) AS product_count,
    ROUND(AVG(unit_price)::numeric, 2) AS avg_price
FROM 
    pricecategories
GROUP BY 
    price_category
