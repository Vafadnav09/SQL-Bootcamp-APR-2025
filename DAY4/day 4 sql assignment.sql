   ---List all customers and the products they ordered with the order date. (Inner join)
Tables used: customers, orders, order_details, products
Output should have below columns:
    companyname AS customer,
    orderid,
    productname,
    quantity,
    orderdate--
-----------------------------------------------------------------------------------

select * from customers
select * from orders
select * from order_details
select * from products

SELECT 
    c.companyname AS customer,
    o.orderid,
    p.product_name,
    od.quantity,
    o.orderdate
FROM customers c
INNER JOIN orders o ON c.customerid = o.customerid
INNER JOIN order_details od ON o.orderid = od.orderid
INNER JOIN products p ON od.productid = p.product_id
ORDER BY c.companyname, o.orderdate;

----2.     Show each order with customer, employee, shipper, and product info — even if some parts are missing. (Left Join)
Tables used: orders, customers, employees, shippers, order_details, products----


SELECT 
    o.orderid,
    c.companyname AS customer,
    s.company_name AS shipper,
    p.product_name,
    od.quantity,
    o.orderdate
FROM orders o
LEFT JOIN customers c ON o.customerid = c.customerid
LEFT JOIN employees e ON o.employeeid = e.employeeid
LEFT JOIN shippers s ON o.shipperid = s.shipper_id
LEFT JOIN order_details od ON o.orderid = od.orderid
LEFT JOIN products p ON od.productid = p.product_id

-----------3.     Show all order details and products (include all products even if they were never ordered). (Right Join)
Tables used: order_details, products
Output should have below columns:
    orderid,
    productid,
    quantity,
    productname--------------

SELECT 
    od.orderid,
    p.product_id,
    od.quantity,
    p.product_name
FROM order_details od
RIGHT JOIN products p ON od.productid = p.product_id
ORDER BY p.product_id;

------4. 	List all product categories and their products — including categories that have no products, and products that are not assigned to any category.(Outer Join)Tables used: categories, products-----

 select * from categories

SELECT 
    c.category_name,
    p.product_id,
    p.product_name
FROM categories c
FULL OUTER JOIN products p ON c.category_id = p.category_id
ORDER BY c.category_name, p.product_name;

----5. 	Show all possible product and category combinations (Cross join).----

SELECT 
    p.product_id,
    p.product_name,
    c.category_id,
    c.category_name
FROM products p
CROSS JOIN categories c
ORDER BY p.product_id, c.category_id;


 ------6. 	Show all employees and their manager(Self join(left join)-----------
 select * from employees
 
SELECT 
    e.employeeid,
FROM employees e
LEFT JOIN employees m ON e.reportsto = m.employeeid
ORDER BY e.employeeid;


----7. 	List all customers who have not selected a shipping method.
Tables used: customers, orders
(Left Join, WHERE o.shipvia IS NULL)----

SELECT 
    c.customerid,
    c.companyname AS customer
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid
WHERE o.shipperid IS NULL
ORDER BY c.companyname;



