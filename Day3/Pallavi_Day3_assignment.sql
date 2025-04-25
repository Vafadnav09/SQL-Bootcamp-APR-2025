select * from categories
select * from products
select * from order_details

Update categories SET category_name='Drinks' where category_name='Beverages';

select * from shippers
Insert into shippers ( shipper_id,company_name, phone) Values ( 7,'PallaviDay3','1-800-222-3333');
Delete from shippers where company_name='PallaviDay3';



ALTER TABLE orders
DROP CONSTRAINT fk_custid;

Alter table products 
ADD CONSTRAINT pk_products_category  
FOREIGN KEY ("categoryID") 
REFERENCES categories ("categoryID")
ON DELETE CASCADE;

Alter table order_details 
ADD CONSTRAINT od_proddet_fk  
FOREIGN KEY ("productID") 
REFERENCES products ("productID")
ON DELETE CASCADE;

Update categories set "categoryID"=1 where "categoryID"=1001;

Delete from categories where "categoryID"=3;

Alter table orders
ADD CONSTRAINT fk_cust  
FOREIGN KEY ("customerID") 
REFERENCES customers ("customerID")
ON DELETE SET NULL;

select * from orders where "customerID"='VINET';

Delete from customers where "customerID"='VINET';

select * from products where "productID"=100;

Insert into products ("productID", "productName","quantityPerUnit","unitPrice",discontinued, "categoryID") Values
(100, 'Wheat bread', '10 boxes', 13, 0, 3)
on conflict ("productID")
Do Update
Set "productID"= Excluded."productID",
    "productName"= Excluded."productName",
    "quantityPerUnit"= Excluded."quantityPerUnit",
    "unitPrice"= Excluded."unitPrice",
    discontinued=Excluded.discontinued,
    "categoryID"=Excluded."categoryID";

ALTER TABLE products
ALTER COLUMN discontinued TYPE integer USING discontinued::integer;

Create TEMP TABLE updated_products 
(productid INT, productname varchar(50), quantityperunit varchar(100), unitprice decimal(5,2),discontinued int, categoryid int);

select * from updated_products
select * from products where "productID" in(100,101,102,103);
INSERT INTO updated_products (productid, productname, quantityperunit, unitprice, discontinued, categoryid)
VALUES 
(100, 'Wheat bread', '10', 20, 1, 3),
(101, 'White bread', '5 boxes', 19.99, 0, 3),
(102, 'Midnight Mango Fizz', '24 - 12 oz bottles', 19, 0, 1),
(103, 'Savory Fire Sauce', '12 - 550 ml bottles', 10, 0, 2);

Drop table  updated_products

MERGE INTO products p
USING updated_products up
 on p."productID"=up.productid
WHEN MATCHED and up.discontinued=1 then
delete
WHEN MATCHED and up.discontinued=0 then
update set 
"productName"= up.productname,
"unitPrice"= up.unitprice
WHEN NOT MATCHED and up.discontinued=0 then
    INSERT ("productID", "productName", "quantityPerUnit", "unitPrice", discontinued, "categoryID")
    VALUES (up.productid, up.productname, up.quantityperunit, 
	up.unitprice, up.discontinued, up.categoryid);

Select * from employees
Select * from orders



   