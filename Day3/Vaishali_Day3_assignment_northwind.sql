7)List all orders with employee full names. (Inner join)

SELECT order_id, first_name||''||last_name AS fullname FROM orders
INNER JOIN employees 
ON orders.employee_id=employees.employee_id

Select * FROM orders
Select * FROM employees

