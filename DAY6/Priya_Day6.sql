 
1. Categorize products by stock status
(Display product_name, a new column stock_status whose values are based on below condition
 units_in_stock = 0  is 'Out of Stock'
       units_in_stock < 20  is 'Low Stock')


Select product_name,
case
When units_in_stock=0 Then 'Out of stock'
When units_in_stock<20 Then 'Low Stock'
Else
'In Stock'
End As Stock_status
From products

2. Find All Products in Beverages Category
(Subquery, Display product_name,unitprice)

select * from categories;

Select product_name, unit_price
From products
Where category_id = (
Select category_id
from categories
Where category_name='Beverages'
)



3.      Find Orders by Employee with Most Sales
(Display order_id,   order_date,  freight, employee_id.
Employee with Most Sales=Get the total no.of of orders for each employee then order by DESC and limit 1. Use Subquery)

select * from employees;
select * from orders;

Select order_id, order_date, freight, employee_id
From orders
Where employee_id = (
select employee_id From employees
Group By employee_id
ORDER BY COUNT(*) DESC
Limit 1
)
Order By order_id DESC;

4. Find orders  where for country!= ‘USA’ with freight costs higher than any
order from USA. (Subquery, Try with ANY, ALL operators)

SELECT order_id, order_date, ship_country, freight
FROM orders
WHERE ship_country != 'USA'
  AND freight > ANY (
      SELECT freight
      FROM orders
      WHERE ship_country = 'USA'
  );
