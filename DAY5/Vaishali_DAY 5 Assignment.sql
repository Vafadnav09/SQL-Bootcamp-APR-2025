 1 GROUP BY with WHERE - Orders by Year and Quarter
Display, order year, quarter, order count, avg freight cost only for those orders where freight cost > 100

SELECT * FROM orders 
SELECT count(*),avg(freight),EXTRACT(YEAR from order_date )as year, EXTRACT(QUARTER from order_date )AS quarter
FROM orders  
WHERE freight>100
GROUP BY year,quarter

=============================================================================================================================
2. GROUP BY with HAVING - High Volume Ship Regions
Display, ship region, no of orders in each region, min and max freight cost
 Filter regions where no of orders >= 5
 
SELECT * FROM orders 

 SELECT ship_region,count(ship_region),MIN(freight), max (freight)
 FROM orders
 GROUP BY ship_region
 Having count(ship_region)>=5


==============================================================================================================================
3. Get all title designations across employees and customers ( Try UNION & UNION ALL)

SELECT * FROM customers
SELECT * FROM employees

SELECT title
FRom Employees
UNION 
SELECT contact_title
FROM customers

SELECT title
FRom Employees
UNION ALL
SELECT contact_title
FROM customers
=====================================================================================================================================
4. Find categories that have both discontinued and in-stock products
(Display category_id, instock means units_in_stock > 0, Intersect)

SELECT * FROM categories
SELECT * FROM products

SELECT category_id FROM categories
Intersect
SELECT category_id  FROM products
WHERE discontinued=1 and units_in_stock > 0

=======================================================================================================================================

5. Find orders that have no discounted items (Display the  order_id, EXCEPT)

SELECT * FROM  orders
SELECT * FROM order_details

SELECT order_id FROM order_details
EXCEPT
SELECT order_id FROM order_details
WHERE discount = 0

======================================================================================================================================






