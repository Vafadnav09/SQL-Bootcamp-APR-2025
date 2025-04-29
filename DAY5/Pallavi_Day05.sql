--1 

Select
Extract(Year from o.order_date) as Orders_by_Year,
Extract( QUARTER from o.order_date) as Orders_by_Quarter,
Count(*) as order_count,
Round(Avg(freight)::numeric,2) as freight_cost
from Orders o
group by Orders_by_Year, Orders_by_Quarter;

-- 2
Select 
o.ship_region,
Count(*) as orders_each_region, 
Min(freight) as minimum_freight_cost,
Max(freight) as max_freight_cost 
from orders o
Group by ship_region
having Count(*)>=5
order by ship_region Desc;

--3
--union
 Select e.title
 from employees e 
 UNION
 Select c.contact_title
 from customers c

 --union all
 Select e.title
 from employees e
 UNION ALL
 Select c.contact_title
 FRom customers c

 --4
Select c.category_id from categories c
Intersect
Select p.category_id from products p where units_in_stock>0

--5

Select order_id from order_details
Except
Select order_id from order_details where discount=0;


