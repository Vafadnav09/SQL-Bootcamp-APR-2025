select * from orders;


1. GROUP BY with WHERE - Orders by Year and Quarter
Display, order year, quarter, order count, avg freight cost only for those orders where freight cost > 100


Select 
extract(year FROM order_date) AS Order_year, extract(quarter FROM order_date) As Quarter, count(*) AS Order_count,
Round(avg(freight)) As Avg_freight_cost
From orders
where freight>100
Group By Order_year, Quarter

2. GROUP BY with HAVING - High Volume Ship Regions
Display, ship region, no of orders in each region, min and max freight cost
 Filter regions where no of orders >= 5

Select Ship_region, count(ship_region) As no_of_orders_in_each_region,
min(freight) As Min_freight, max(freight) As Max_freight
From orders
Group By ship_region
Having count(ship_region)>=5
Order BY count(ship_region) DESC


3. Get all title designations across employees and customers ( Try UNION & UNION ALL)

select * from employees;
select * from customers;

Select contact_title from customers
Group By contact_title
UNION ALL
Select title From employees
Group By title

Select contact_title from customers
Group By contact_title
UNION 
Select title From employees
Group By title


4. Find categories that have both discontinued and in-stock products
(Display category_id, instock means units_in_stock > 0, Intersect)

select * from categories;
select * from products;

Select p.units_in_stock, c.category_id, p.discontinued From products p
inner join categories c ON p.category_id=c.category_id
where units_in_stock>0 
Intersect
Select p.units_in_stock, c.category_id, p.discontinued From categories c
Inner join products p On p.category_id=c.category_id
where discontinued=1


5. Find orders that have no discounted items (Display the  order_id, EXCEPT)

select * from orders;
select * from order_details;


Select order_id, discount From order_details
Except
Select order_id, discount From order_details
Where discount=0



