----DAY3 Assignment

--1) Update the categoryName From “Beverages” to "Drinks" in the categories table.

update categories set categoryname = 'Drinks' where categoryname ='Beverages';
----------------------------------------------------------------------------------------------------

--2)Insert into shipper new record (give any values) Delete that new record from shippers table.

insert into shippers(shipperid,companyname) 
values (4,'Universal Shipping');

select * from shippers;

delete from shippers where shipperid=4;
--------------------------------------------------------------------------------------------
/* 3)Update categoryID=1 to categoryID=1001. Make sure related products update their categoryID too.
Display the both category and products table to show the cascade.*/

alter table order_details 
drop constraint if exists order_details_productid_fkey;

alter table products
add constraint fk_categoryid
Foreign key (categoryid) references categories(categoryid) 
on update cascade
on delete cascade;


alter table order_details
add constraint order_details_productid_fkey
foreign key(productid) references products(productid)
on delete cascade;


select * from products where categoryid=3;

update categories set categoryid=1001 where categoryid=1;

delete from categories where categoryid=3;

--------------------------------------------------------------------------

---4)
alter table orders
drop constraint if exists orders_customerid_fkey;

alter table orders
add constraint orders_customerid_fkey
foreign key(customerid) references customers(customerid)
on delete set null(customerid);

select * from customers where customerid='VINET';

delete from customers where customerid='VINET';

--------------------------------------------------------------

--5)
INSERT INTO products (productid,productname,quantityperunit,unitprice,discontinued,categoryid)
VALUES (100,'Wheat bread',1,13,0,5);


INSERT INTO products (productid,productname,quantityperunit,unitprice,discontinued,categoryid)
VALUES(101,'White bread',5,13,0,5),
		(100,'Wheat bread',10,13,0,5)
ON CONFLICT (productid)
DO UPDATE SET productname = EXCLUDED.productname,
quantityperunit = EXCLUDED.quantityperunit;

select * from products where productid in(100,101);
----------------------------------------------------------------------------------
--6)

CREATE table products_new(
productID INT PRIMARY KEY,
productName VARCHAR(100),
QuantityPerUnit VARCHAR(50),
unitPrice double precision,
discontinued int,
categoryID INT,
CONSTRAINT fk_cat_prod_new
FOREIGN KEY(categoryID) REFERENCES categories(categoryID)
);

COPY products_new FROM 'C:\archive_nwt\products.csv' 
WITH (FORMAT csv, HEADER true, ENCODING 'LATIN1');

CREATE temporary table updated_products(
productID SERIAL PRIMARY KEY,
productName VARCHAR(100),
QuantityPerUnit VARCHAR(50),
unitPrice double precision,
discontinued int,
categoryID INT);

INSERT into updated_products(productid,productname,quantityperunit,unitprice,discontinued,categoryid)
VALUES(100,'Wheat bread',10,20,1,5),
(101,'White bread','5 boxes',19.99,0,5),
(102,'Midnight Mango Fizz','24 - 12 oz bottles',19,0,1001),
(103,'Savory Fire Sauce','12 - 550 ml bottles',10,0,2);


MERGE INTO products_new as p
USING updated_products as updated
ON p.productid = updated.productid
WHEN MATCHED AND updated.discontinued = 1 THEN
	DELETE
WHEN MATCHED AND updated.discontinued = 0 THEN
    UPDATE SET
		discontinued = updated.discontinued,
		unitprice = updated.unitprice
WHEN NOT MATCHED THEN
    INSERT (productid,productname,quantityperunit,unitprice,discontinued,categoryid)
    VALUES (updated.productid,updated.productname,updated.quantityperunit,updated.unitprice,updated.discontinued,updated.categoryid);
	

select * from products_new where productid in (100,101,102,103);