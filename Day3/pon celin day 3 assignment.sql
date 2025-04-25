    --UPDATE---
 UPDATE categories
SET category_name = 'Drinks'
WHERE category_name = 'Beverages';

SELECT * FROM categories WHERE category_name = 'Beverages';
  ---shippers---
  
SELECT * FROM shippers;

insert into shippers values('4','ups');
delete from shippers where shippers.shipper_id='4';

-- 3)Update categoryID=1 to categoryID=1001. Make sure related products update their categoryID too. 
 --Display the both category and products table to show the cascade.
  ALTER TABLE products
  ADD CONSTRAINT fk_name FOREIGN KEY(category_id)
  REFERENCES categories("categoryID")
  ON UPDATE CASCADE
  ON DELETE CASCADE;

  Select * from products

  Select * from "categories"

  UPDATE categories
  SET "categoryID" = 1001
  WHERE "categoryID" = 1

 Select * from products

  Select * from "categories"

  --4)Delete the customer = “VINET”  from customers.
--Corresponding customers in orders table should be set to null
--(HINT: Alter the foreign key on orders(customerID) to use ON DELETE SET NULL)

ALTER TABLE "Orders"
DROP CONSTRAINT IF EXISTS "customerID"

ALTER TABLE "Orders"
ADD CONSTRAINT fk_order_customer FOREIGN KEY("customerID")
REFERENCES customers("customerID")
ON DELETE  SET NULL

Select * from "Orders"

DELETE FROM customers 
WHERE "customerID" = 'VINET'

--5)      Insert the following data to Products using UPSERT:
--product_id = 100, product_name = Wheat bread, quantity_per_unit=1,unitprice = 13, discontinued = 0, categoryID=3
--product_id = 101, product_name = White bread, quantity_per_unit=5 boxes,unitprice = 13, discontinued = 0, categoryID=3
--product_id = 100, product_name = Wheat bread, quantity_per_unit=10 boxes,unitprice = 13, discontinued = 0, categoryID=3

Select * from products where product_id = 101

ALTER TABLE products
ADD CONSTRAINT unique_product_id UNIQUE (product_id);

INSERT INTO products(product_id,product_name,quantity_per_unit,unit_price,discontinued,category_id)
VALUES(101,'White bread','5 boxes',13,0,3)
ON CONFLICT(product_id)
DO UPDATE
SET product_name = EXCLUDED.product_name,
	quantity_per_unit = EXCLUDED.quantity_per_unit,
    unit_price = EXCLUDED.unit_price,
	discontinued = EXCLUDED.discontinued,
	category_id = EXCLUDED.category_id;

--6) Merge Query
MERGE INTO products target
USING (
	VALUES
		(100, 'Wheat bread', '10', 20, 1, 3),
		(101, 'White bread', '5 boxes', 19.99, 0, 3),
		(102, 'Midnight Mango Fizz', '24 - 12 oz bottles', 19, 0, 1),
		(103, 'Savory Fire Sauce', '12 - 550 ml bottles', 10, 0, 2)
	) AS updated_products(productID, productName, quantityPerUnit, unitPrice, discontinued, categoryID)
ON target.product_id = updated_products.productID

-- Update when matched and discontinued = 0
WHEN MATCHED AND updated_products.discontinued = 0 THEN
    UPDATE SET 
        unit_price = updated_products.unitPrice,
        discontinued = updated_products.discontinued

-- Delete when matched and discontinued = 1
WHEN MATCHED AND updated_products.discontinued = 1 THEN
    DELETE

-- Insert when not matched and discontinued = 0
WHEN NOT MATCHED BY target AND updated_products.discontinued = 0 THEN
    INSERT (product_id, product_name, quantity_per_unit, unit_price, discontinued, category_id)
    VALUES (updated_products.productID, updated_products.productName, updated_products.quantityPerUnit, updated_products.unitPrice, updated_products.discontinued, updated_products.categoryID);
;

Select *  from products
 



