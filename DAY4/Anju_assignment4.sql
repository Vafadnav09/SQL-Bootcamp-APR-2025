--1.     List all customers and the products they ordered with the order date. (Inner join)
Select c.company_name AS customer,o.order_id,p.product_name,od.quantity,o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id;

--2. Show each order with customer, employee, shipper, and product info — even if some parts are missing. (Left Join)

Select 
c.contact_name AS customer,
o.order_id,
e.first_name||' '||e.Last_name,
p.product_name AS product,
s.shipper_id AS shipper,
od.quantity,
o.order_date
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN employees e  ON o.employee_id = o.employee_id
LEFT JOIN shippers s ON o.ship_via = s.shipper_id
LEFT JOIN order_details od ON o.order_id = od.order_id
LEFT JOIN products p ON od.product_id = p.product_id;

-- Show all order details and products (include all products even if they were never ordered). (Right Join)
--Tables used: order_details, products
--Output should have below columns:
--    orderid,
--  productid,
--  quantity,
--  productname

Select od.order_id,
p.product_id,
od.quantity,
p.product_name
From order_details od
Right Join products p ON od.product_id = p.product_id

--4. 	List all product categories and their products — including categories that have no products, 
	--  and products that are not assigned to any category.(Outer Join)
	--  Tables used: categories, products

Select 
cat.category_name,
p.product_name
From categories cat
Full Outer Join products p ON cat.category_id = p.category_id

-- 5. 	Show all possible product and category combinations (Cross join).
Select 
cat.category_name,
p.product_name
From categories cat
Cross Join products p

-- 6. 	Show all employees and their manager(Self join(left join))
Select e.first_name||' '||e.last_name AS employeesname,m.first_name||' '||m.last_name AS Manager
from employees e
Left Join employees m ON e.employee_id = m.reports_to

--7. List all customers who have not selected a shipping method.
--Tables used: customers, orders
--(Left Join, WHERE o.shipvia IS NULL)
Select 
c.company_name AS customers,
o.ship_via AS shipping_method
from customers c
Left Join orders o ON c.customer_id = o.customer_id
where o.ship_via IS NULL









