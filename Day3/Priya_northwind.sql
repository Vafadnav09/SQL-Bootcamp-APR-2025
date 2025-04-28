select * from orders;
select * from employees;

select o.order_id, o.employee_id, concat(emp.first_name, ' ', emp.last_name)as employee_fullname
FROM orders o
INNER JOIN employees emp on
o.employee_id=emp.employee_id
