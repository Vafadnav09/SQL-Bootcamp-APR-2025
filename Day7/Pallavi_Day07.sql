--1
select count(order_id) as total_sales,e.employee_id, e.first_name || ' ' || e.last_name AS employee_name, 
rank() over (order by count(o.order_id)  desc ) as employee_rank 
from orders o 
inner join employees e on e.employee_id= o.employee_id 
group by e.employee_id,e.first_name,e.last_name 
order by employee_rank;

--2
--lag & lead
select order_id, customer_id, order_date, freight, 
lag(freight) over (partition by customer_id order by order_date )as previous_freight,
lead(freight)over (partition by customer_id order by order_date)as next_freight
from orders ;

--3
With price_cte as (select  product_id,product_name,unit_price,
case 
when unit_price < 20 then 'Low Price'
when unit_price < 50 THEN 'Medium Price'
else 'High Price'
end as price_category
from 
        products
)
select
price_category,COUNT(*) AS product_count,ROUND(AVG(unit_price)::numeric, 2) AS avg_price
FROM price_cte
GROUP BY price_category
ORDER BY price_category;