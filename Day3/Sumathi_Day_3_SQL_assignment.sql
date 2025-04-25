UPDATE categories 
set category_name = 'Drinks'
where category_name = 'Beverages';

select * from categories;

select * from shippers;

INSERT INTO shippers(shipper_id,company_name, phone)
VALUES(9,'USPS', 5232352345);

DELETE FROM shippers
where shipper_id = 9;

select * from products;

ALTER TABLE products
DROP CONSTRAINT fk_products_categories

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY(category_id) REFERENCES categories(category_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

UPDATE categories
SET category_id = 1001
where category_id = 1;

select * from order_details;

ALTER TABLE order_details
DROP CONSTRAINT IF EXISTS fk_order_details_products

ALTER TABLE order_details
ADD CONSTRAINT fk_order_details_products
FOREIGN KEY(product_id) REFERENCES products(product_id)
ON DELETE CASCADE;

DELETE from categories
where category_id = 3;

select * from customers
where customer_id = 'VINET';

ALTER TABLE orders
DROP CONSTRAINT IF EXISTS fk_orders_customers

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
ON UPDATE CASCADE
ON DELETE SET NULL;

DELETE from customers
where customer_id = 'VINET';

select * from orders
where customer_id = 'VINET';

select * from products
where product_id IN(100 , 101);

INSERT INTO products(product_id, product_name, quantity_per_unit, unit_price, discontinued, category_ID)
VALUES ( 100,  'Wheat bread', '1', 13,  0, 5),
         (101,  'White bread', '5 boxes', 13,  0, 5),
DO UPDATE 
SET product_name = EXCLUDED.product_name,
    quantity_per_unit = EXCLUDED.quantity_per_unit,
	unit_price   =  EXCLUDED.unit_price,
	discontinued = EXCLUDED.discontinued,
	category_ID   = EXCLUDED.category_ID;

CREATE TEMP TABLE updated_product(
productid  smallint,
productname  varchar(50),
quantityperunit varchar(20),
unitprice real, 
discontinued boolean,
categoryID int
);

ALTER TABLE updated_product
ADD COLUMN discontinued int 

INSERT INTO updated_product (productid, productname, quantityperunit, unitprice, discontinued, categoryID)
values(100, 'wheat bread', '10', 20, 1, 5),
      (101,'white bread', '5 Boxes', 19.99, 0,5 ),
	  (102, 'Midnight Mango Fizz', '24 - 12 oz bottles', 19, 0, 1),
	  (103, 'Savory Fire Sauce', '12 - 550 ml bottles', 10, 0, 2);
	  
MERGE INTO products p 
USING updated_product up 
ON p.product_id = up.productid
WHEN MATCHED AND up.discontinued = 1 THEN DELETE
WHEN MATCHED AND up.discontinued = 0 THEN UPDATE 
SET  unit_price = up.unitprice,
      discontinued = up.discontinued 
WHEN NOT MATCHED  AND up.discontinued = 0 THEN 
INSERT (product_id, product_name, quantity_per_unit, unit_price, discontinued, category_ID)
VALUES(up.productid, up.productname, up.quantityperunit, up.unitprice, up.discontinued, up.categoryID);

select * from products 
where product_id IN (100,101, 102, 103);


select order_id, (employees.first_name|| ' ' || employees.last_name) as employee_fullName from orders
INNER JOIN employees ON employees.employee_id = orders.employee_id;





