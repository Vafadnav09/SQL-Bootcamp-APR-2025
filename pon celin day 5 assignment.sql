-----1.      GROUP BY with WHERE - Orders by Year and Quarter
Display, order year, quarter, order count, avg freight cost only for those orders where freight cost > 100

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(QUARTER FROM order_date) AS order_quarter,
    COUNT(*) AS order_count,
    AVG(freight) AS avg_freight
FROM 
    orders
WHERE 
    freight > 100
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(QUARTER FROM order_date)
ORDER BY 
    order_year,
    order_quarter;

select * from orders

----2.      GROUP BY with HAVING - High Volume Ship Regions
Display, ship region, no of orders in each region, min and max freight cost
 Filter regions where no of orders >= 5


SELECT 
    ship_region,
    COUNT(*) AS order_count,
    MIN(freight) AS min_freight,
    MAX(freight) AS max_freight
FROM 
    orders
WHERE 
    ship_region IS NOT NULL
GROUP BY 
    ship_region
HAVING 
    COUNT(*) >= 5
ORDER BY 
    order_count DESC;

	
----3.      Get all title designations across employees and customers ( Try UNION & UNION ALL)

SELECT title FROM employees
UNION
SELECT contact_title FROM customers;

SELECT title FROM employees
UNION ALL
SELECT contact_title FROM customers;


select * from employees
select * from customers

-----4.      Find categories that have both discontinued and in-stock products
(Display category_id, instock means units_in_stock > 0, Intersect)

select * from products


----Categories with discontinued products
SELECT category_id
FROM products
WHERE discontinued = 0

INTERSECT

-- Categories with in-stock products (units_in_stock > 0)
SELECT category_id
FROM products
WHERE units_in_stock > 0;


-----5.      Find orders that have no discounted items (Display the  order_id, EXCEPT)

-- All order IDs
SELECT order_id
FROM order_details

EXCEPT

-- Orders that have at least one discounted item
SELECT order_id
FROM order_details
WHERE discount > 0;




 

