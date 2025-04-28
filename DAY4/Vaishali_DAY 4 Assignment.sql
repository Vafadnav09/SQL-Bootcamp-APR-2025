1.List all customers and the products they ordered with the order date. (Inner join)
Tables used: customers, orders, order_details, products
Output should have below columns:
    companyname AS customer,
    orderid,
    productname,
    quantity,
    orderdate	
 
SELECT * FROM customers
SELECT * FROM products
SELECT * FROM order_details
SELECT * FROM orders

SELECT company_name AS customer, o.order_id,p.product_name, od.quantity, o.order_date FROM customers
INNER JOIN orders o
ON o.customer_id = customers.customer_id
INNER JOIN order_details od
ON od.order_id=o.order_id
INNER JOIN products p
ON p.product_id=od.product_id
===================================================================================================================================================================

2. Show each order with customer, employee, shipper, and product info — even if some parts are missing. (Left Join)
Tables used: orders, customers, employees, shippers, order_details, products



SELECT * FROM shippers
SELECT * FROM order_details


SELECT o.order_id,
    c.company_name AS customer,
    e.first_name || ' ' || e.last_name AS employee,
    s.company_name AS shipper,
    p.product_name,
    od.quantity,
    o.order_date FROM orders o
LEFT JOIN customers c 
ON c.customer_id = o.customer_id
LEFT JOIN employees e
ON o.employee_id= e.employee_id
LEFT JOIN shippers s
ON o.ship_via=s.shipper_id
LEFT JOIN order_details od
ON o.order_id=od.order_id
LEFT JOIN products p
ON od.product_id= p.product_id
=============================================================================================================================================================================

3.    Show all order details and products (include all products even if they were never ordered). (Right Join)
Tables used: order_details, products
Output should have below columns:
    orderid,
    productid,
    quantity,
    productname
	
select * from products
Select * from order_details

SELECT order_id,
    p.product_id,
    quantity,
    p.product_name
	FROM order_details od
	RIGHT JOIN products p
	ON p.product_id= od.product_id
==============================================================================================================================================================================
4.List all product categories and their products — including categories that have no products, and products that are not assigned to any category.(Outer Join)
Tables used: categories, products
SELECT * FROM categories
SELECT * FROM products

SELECT c.category_id,c. category_name,p.product_id, p.product_name
FROM products p
FULL OUTER JOIN  categories c
ON c.category_id= p.category_id
=============================================================================================================================================================================
5. 	Show all possible product and category combinations (Cross join).
Select * from categories
SELECT * FROM products p
CROSS JOIN categories c
============================================================================================================================================================================

6. 	Show all employees and their manager(Self join(left join))
SELECT * FROM employees

    SELECT e.employee_id, e.first_name ||' '|| e.last_name as Employee_name, m.employee_id AS manager_id, m.first_name ||' '|| m.last_name as Manager_name 
	FROM employees e
	LEFT JOIN  employees m
	ON m.employee_id= e.reports_to
	
===========================================================================================================================================================================	 
7	List all customers who have not selected a shipping method.
Tables used: customers, orders
(Left Join, WHERE o.shipvia IS NULL)

SELECT * FROM customers
SELECT * FROM orders

SELECT c.customer_id FROM customers c
LEFT JOIN orders o
ON c.customer_id= o.customer_id
WHERE ship_via IS NULL

============================================================================================================================================================================





