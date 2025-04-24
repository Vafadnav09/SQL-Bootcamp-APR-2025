Alter table employees
Add column linkedin_profile varchar;

select * from employees;

Alter table employees
Alter column linkedin_profile
set data type text;

ALTER TABLE employees
ALTER COLUMN linkedin_profile SET NOT NULL,
ADD constraint unique_linkedin_profile Unique(linkedin_profile);

Alter table employees
Drop column linkedin_profile;

select * from employees;

select * from products;

SELECT DISTINCT unitprice
FROM products;



Select employeename, title from employees;

select * from customers 
Order by companyname ASC;

select productname, unitprice AS price_in_usd from products;
select * from customers;

select * from customers where country='Germany';

select * from customers where country='France' OR country='Spain';

select * from orders;

select * from orders
where EXTRACT(year from orderdate)=2014 
AND (freight>50 OR shippeddate is not null);

Select productid, productname, unitprice from products 
where unitprice>15;

select * from employees
Where country= 'USA' AND title='Sales Representative';

select * from products
where discontinued=false AND unitprice>30;

select * from orders
fetch first 10 rows only;

select * from orders
Offset 10 rows
Fetch next 10 Rows only;


Select * from customers
where contacttitle IN ('Sales Representative', 'Owner');

select * from orders
Where orderdate Between '2013-01-01' AND '2013-12-31';

select * from products
where categoryid Not IN (1, 2, 3);


Select * from customers
Where companyname Like 'A%';

INSERT into orders(orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipperid, freight)
values (11078,'ALFKI', 5, '2025-04-23', '2025-04-30', '2025-04-25', 2, 45.50);

UPDATE products
SET unitprice = unitprice * 1.10
WHERE categoryid = 2;

select * from employees

update employees
Set linkedin_profile = 'https://www.linkedin.com/in/employee9'
WHERE employeeid = 9;
