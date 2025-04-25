select o.order_id,concat(emp.first_name,' ',emp.last_name) as employee_fullname from orders o
inner join employees emp on o.employee_id=emp.employee_id;


select * from orders;