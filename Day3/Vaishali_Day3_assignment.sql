-- 1) Update the categoryName From “Beverages” to "Drinks" in the categories table.
select * from categories

update categories
set categoryname = 'Drinks'
where categoryname = 'Beverages'
----------------------------------------------------------------------------------------------------------------------------

-- 2) Insert into shipper new record (give any values) Delete that new record from shippers table.
select * from shippers
-- Insert into shipper new record (give any values)
insert into shippers(shipperid,companyname)
values (5,'Numpyninja')
--------------------------------------------------------------------------------------------------------------------------------

-- Delete that new record from shippers table.
delete from shippers
where shipperid = 5
______________________________________________________________________________________________________________________________________________________

3 Update categoryID=1 to categoryID=1001. Make sure related products update their categoryID too. Display the both category and products table to show the cascade.
 Delete the categoryID= â€œ3â€  from categories. Verify that the corresponding records are deleted automatically from products.
 (HINT: Alter the foreign key on products(categoryID) to add ON UPDATE CASCADE, ON DELETE CASCADE)

ALTER TABLE products
DROP CONSTRAINT products_categoryid_fkey;

ALTER TABLE products
ADD CONSTRAINT fk_constraint
FOREIGN KEY (categoryID)
REFERENCES categories(categoryID)
ON DELETE CASCADE
ON UPDATE CASCADE;

UPDATE categories
set categoryID= 1001
where categoryID =1


SELECT * FROM categories

// For deleting row from Category, we have relation

ALTER TABLE order_details
DROP CONSTRAINT order_details_productid_fkey;

alter table order_details 
add constraint pk_category
foreign key (productid)
references products(productid)
on delete cascade

DELETE FROM categories
WHERE categoryID= 3

------------------------------------------------------------------------------------------------------------------------------------------------
4)Delete the customer = 'VINET'  from customers. Corresponding customers in orders table should be set to null (HINT: Alter the foreign key on orders(customerID) to use ON DELETE SET
NULL)

SELECT * FROM customers

ALTER TABLE orders
DROP CONSTRAINT orders_customerid_fkey

ALTER TABLE orders
ADD CONSTRAINT fk_orders
FOREIGN KEY (customerid)
REFERENCES customers(customerid)
ON DELETE SET NULL

SELECT * FROM customers

DELETE FROM customers
WHERE customerid='VINET'
-----------------------------------------------------------------------------------------------------------------------------------------------

5)      Insert the following data to Products using UPSERT:
product_id = 100, product_name = Wheat bread, quantityperunit=1,unitprice = 13, discontinued = 0, categoryID=5
product_id = 101, product_name = White bread, quantityperunit=5 boxes,unitprice = 13, discontinued = 0, categoryID=5
product_id = 100, product_name = Wheat bread, quantityperunit=10 boxes,unitprice = 13, discontinued = 0, categoryID=5

 SELECT * FROM products

INSERT INTO products 
VALUES 
    (100, 'Wheat bread', '1', 13, false, 5)
ON CONFLICT (productid)
DO UPDATE SET 
    productname = EXCLUDED.productname,
    quantityperunit = EXCLUDED.quantityperunit,
    unitprice = EXCLUDED.unitprice,
    discontinued = EXCLUDED.discontinued,
    categoryid = EXCLUDED.categoryid;
	
product_id = 101, product_name = White bread, quantityperunit=5 boxes,unitprice = 13, discontinued = 0, categoryID=5	
INSERT INTO products 
VALUES 
    (101, 'Wheat bread', '5', 13, false, 5)
ON CONFLICT (productid)
DO UPDATE SET 
    productname = EXCLUDED.productname,
    quantityperunit = EXCLUDED.quantityperunit,
    unitprice = EXCLUDED.unitprice,
    discontinued = EXCLUDED.discontinued,
    categoryid = EXCLUDED.categoryid;
	
product_id = 100, product_name = Wheat bread, quantityperunit=10 boxes,unitprice = 13, discontinued = 0, categoryID=5
INSERT INTO products 
VALUES 
    (100, 'Wheat bread', '10', 13, false, 5)
ON CONFLICT (productid)
DO UPDATE SET 
    productname = EXCLUDED.productname,
    quantityperunit = EXCLUDED.quantityperunit,
    unitprice = EXCLUDED.unitprice,
    discontinued = EXCLUDED.discontinued,
    categoryid = EXCLUDED.categoryid;


 
---------------------------------------------------------------------------------------------------------------------------------------------------



 6)      Write a MERGE query:
Create temp table with name:  ‘updated_products’ and insert values as below:

 
 Update the price and discontinued status for from below table ‘updated_products’ only if there are matching products and updated_products .discontinued =0 

If there are matching products and updated_products .discontinued =1 then delete 
 
 Insert any new products from updated_products that don’t exist in products only if updated_products .discontinued =0.


SELECT * FROM products

Create temp table updated_products(
productId int PRIMARY KEY,
productname VARCHAR,
quantityPerUnit TEXT,
unitPrice DECIMAL(10,2),
discontinued boolean,
categoryid int  
)
SELECT * FROM updated_products

INSERT INTO updated_products
VALUES 
('100','Wheat bread','10', 20,'true', 5),
('101','White bread','5 boxes', 19.99,'false', 5),
('102','Midnight Mango Fizz','24-12 oz bottles', 19,'false', 1),
('103','Savory Fire Sauce','12 - 550 ml bottles', 10,'false', 2)

ALTER TABLE Products
DROP CONSTRAINT fk_constraint
--Update the price and discontinued status for from below table ‘updated_products’ only if there are matching products and updated_products .discontinued =0 
MERGE INTO products p
USING updated_products u
on p.productId= u.productId
WHEN MATCHED THEN
UPDATE SET unitPrice= u.unitPrice,
           discontinued = u.discontinued,
		   categoryID = u.categoryID
WHEN NOT MATCHED THEN
INSERT(productId,productname,quantityPerUnit,unitPrice,discontinued,categoryid)
VALUES(u.productId,u.productname,u.quantityPerUnit,u.unitPrice,u.discontinued,u.categoryid);

SELECT * FROM products
 SELECT * FROM categories

--If there are matching products and updated_products .discontinued =1 then delete
MERGE INTO products p
USING updated_products u
on p.productId= u.productId
WHEN MATCHED AND u.discontinued='true' THEN
DELETE 


SELECT * FROM products
SELECT * FROM updated_products


-- Insert any new products from updated_products that don’t exist in products only if updated_products .discontinued =0.
INSERT INTO updated_products
VALUES 
('104','Wheat Chapti ','8', 100,'true', 6),
('105','Chapti ','8', 100,'false', 7)

MERGE INTO products p
USING updated_products u
ON p.productId = u.productId
WHEN NOT MATCHED AND u.discontinued = 'false' THEN
INSERT (productId, productname, quantityPerUnit, unitPrice, discontinued, categoryid)
VALUES (u.productId, u.productname, u.quantityPerUnit, u.unitPrice, u.discontinued, u.categoryid);
-------------------------------------------------------------------------------------------------------------------------------------------------------
