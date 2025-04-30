--1.      Categorize products by stock status
--(Display product_name, a new column stock_status whose values are based on below condition
 --units_in_stock = 0  is 'Out of Stock'
   --    units_in_stock < 20  is 'Low Stock')
Select 
product_name,
CASE 
		WHEN units_in_stock =0 then 'Out Of Stock'
		When units_in_stock < 20 then  'Low stock'
		Else 'In Stock'
End As stock_status
From products


--2.      Find All Products in Beverages Category
--(Subquery, Display product_name,unitprice)

Select product_name,unit_price
from products
where category_id = (
						Select category_id
						from categories
						where category_name = 'Beverages'
)
Order By unit_price


--3.      Find Orders by Employee with Most Sales
--(Display order_id,   order_date,  freight, employee_id.
--Employee with Most Sales=Get the total no.of of orders for each employee then order by DESC and limit 1. 
--Use Subquery)
Select order_id,order_date,freight,employee_id
from orders
where employee_id = (
					Select employee_id from orders
					Count(order_id)
					GROUP BY employee_id
					ORDER BY Count(order_id) DESC
					Limit 1
)

--4.Find orders  where for country!= ‘USA’ with freight costs 
--higher than any order from USA. (Subquery, Try with ANY, ALL operators)

--USING ANY
SELECT *
FROM orders
WHERE ship_country <> 'USA'
  AND freight > ANY (
    SELECT freight
    FROM orders
    WHERE ship_country = 'USA'
  );

  
  --USING ALL
  SELECT *
FROM orders
WHERE ship_country <> 'USA'
  AND freight > ALL (
    SELECT freight
    FROM orders
    WHERE ship_country = 'USA'
  );




