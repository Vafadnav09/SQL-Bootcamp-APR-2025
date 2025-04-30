--1
Select product_name,units_in_stock,
CASE
WHEN units_in_stock =0 THEN 'Out of Stock'
WHEN units_in_stock =20 THEN 'Low Stock'
END AS stock_status
from products;

--2
Select product_name, unit_price 
from products 
where 
category_id = 
(select category_id from categories where category_id=1);


--3 
select order_id, order_date, freight,employee_id from orders
where employee_id= (select employee_id from orders group by employee_id  order by count(*)desc limit 1);


--4
Find orders  where for country!= ‘USA’ with freight costs higher than any order from USA. 
(Subquery, Try with ANY, ALL operators)
select * from orders
select * from orders where

-- ANY Operator
select order_id,ship_country, freight from orders
where ship_country!='USA'and freight > Any (select freight from orders where ship_country='USA')
order by ship_country;

--All Operator
select order_id,ship_country, freight from orders
where ship_country!='USA'and freight > All (select freight from orders where ship_country='USA')
order by ship_country;


