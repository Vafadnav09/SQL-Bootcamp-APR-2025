select * from categories;

update categories
set categoryname='Drinks'
where categoryname='Beverages';

select * from shippers;

insert into shippers(shipperid, companyname)
values (4, 'UPS');

delete from shippers where shipperid=4;
select * from products;

update categories
set categoryid=1001
where categoryid=1

ALTER table products
Add constraint products_categoryid_fkey
foreign key(categoryid) references categories(categoryid)
ON UPDATE CASCADE
ON DELETE CASCADE;


ALTER table products
drop constraint if exists products_categoryid_fkey

Delete from categories
where categoryid=3

select * from order_details


select * from products
where categoryid=3

ALTER table order_details
drop constraint if exists fk_product

ALTER table order_details
Add constraint fk_product
foreign key(productid) references products(productid)
ON DELETE CASCADE;

select * from customers
select * from orders

ALTER table orders
drop constraint if exists orders_customerid_fkey

ALTER table orders
Add constraint orders_customerid_fkey
foreign key(customerid) references customers(customerid)
ON DELETE SET NULL;

Delete from CUSTOMERS
where customerid='VINET';

select * from products;

INSERT INTO products(productId,productname,quantityPerUnit,unitPrice,discontinued,categoryid)
values
(101,'White bread','5 boxes',13,'false',5),
(100,'Wheat bread','10 boxes',13,'false',5)
ON CONFLICT(productId) 
DO UPDATE SET 
   productId = EXCLUDED.productId,
   productname = EXCLUDED.productname,
   quantityPerUnit = EXCLUDED.quantityPerUnit,
   unitPrice = EXCLUDED.unitPrice,
   discontinued = EXCLUDED.discontinued,
   categoryid = EXCLUDED.categoryid;


MERGE INTO products p
USING updated_products u
ON p.productid = u.productid
WHEN NOT MATCHED AND u.discontinued = 'false' THEN
    INSERT (productid, productname, quantityperunit, unitprice, discontinued, categoryid)
    VALUES (u.productid, u.productname, u.quantityperunit, u.unitprice, u.discontinued, u.categoryid);


select * from orders;
select * from employees;

select orders.orderid, orders.employeeid, employees.employeename 
FROM orders 
INNER JOIN employees on
orders.employeeid=employees.employeeid

