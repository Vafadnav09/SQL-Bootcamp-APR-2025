Select * from customers;
Select * from orders;
Select * from order_details;
Select * from products;
Select * from employees;
Select * from shippers;

--1
SELECT c.company_name as customer, o.order_id, p.product_name, od.quantity, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id
order by order_date desc;

--2
Select c.company_name As customer, e.first_name ||' '|| e.last_name As employee,
s.company_name As shipper, p.product_name as product_info
from orders o
left join customers c on c.customer_id= o.customer_id
left join order_details od  on od.order_id = o.order_id
left join shippers s on s.shipper_id= o.ship_via
left join employees e on e.employee_id = o.employee_id
left join products p on p.product_id = od.order_id

--3
Select od.order_id, od.product_id,od.quantity,p.product_name
from order_details od 
right join products p on od.product_id=p.product_id;

--4
select p.product_name, c.category_name from products p full outer join
categories c on p.category_id=c.category_id;

--5 
select p.product_name, c.category_name from products p cross join
categories c ;

--6
select e1.first_name||''||e1.last_name as employee_name,
e2.first_name||''||e2.last_name as manager_name
from employees e1 left join employees e2 on e1.employee_id= e2.reports_to;

--7
select * from customers;
select * from orders;
select c.company_name,c.contact_name, o.order_id  from customers c
left join orders o on c.customer_id=o.customer_id where  o.ship_via is null;

