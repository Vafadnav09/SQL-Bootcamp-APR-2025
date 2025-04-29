-- GROUP BY with WHERE - Orders by Year and Quarter
--Display, order year, quarter, order count, avg freight cost only for those orders where freight cost > 100
Select 
EXTRACT(YEAR FROM o.order_date) AS Order_Year,
EXTRACT(QUARTER FROM o.order_date)AS Order_QUARTER,
Count(*) AS order_count,
ROUND(AVG(freight)::numeric,2) AS Avg_freight_cost
FROM Orders o
WHERE freight >100
GROUP BY Order_Year,Order_QUARTER;



--GROUP BY with HAVING - High Volume Ship Regions
--Display, ship region, no of orders in each region, min and max freight cost
 --Filter regions where no of orders >= 5
Select
o.ship_region,
Count(*) AS no_of_orders,
MIN(freight) AS Minimum_freight,
MAX(freight) AS Maximum_freight
FROM orders o
GROUP BY ship_region
HAVING Count(*) >=5
ORDER BY no_of_orders DESC;


--Get all title designations across employees and customers ( Try UNION & UNION ALL)

 Select e.title
 From employees e

 UNION ALL

 Select c.contact_title
 FRom customers c
 
--with union
  Select e.title
 From employees e

 UNION 

 Select c.contact_title
 FRom customers c

 --4.      Find categories that have both discontinued and in-stock products
 Select c.category_id
 from categories c

 Intersect

 Select p.category_id
 from products p
 where units_in_stock >0

 --5.      Find orders that have no discounted items (Display the  order_id, EXCEPT)
 Select o.order_id 
 from orders o

 Except

 Select DISTINCT od.order_id
 from order_details od
 where discount = 0



 

