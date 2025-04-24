ALTER TABLE employees
ADD linkedin_profile VARCHAR(75)

ALTER TABLE employees
ALTER COLUMN linkedin_profile TYPE text

UPDATE employees
SET linkedin_profile = 'https://www.linkedin.com/in/'||"employeeName" 
where linkedin_profile is NULL	

ALTER TABLE employees
ALTER COLUMN linkedin_profile SET NOT NULL

ALTER TABLE employees
ADD CONSTRAINT unique_linkedin UNIQUE(linkedin_profile)

Select linkedin_profile from employees
Limit 10

ALTER TABLE employees
ADD first_name VARCHAR(15),
ADD last_name VARCHAR(15)

ALTER TABLE employees
ALTER COLUMN first_name TYPE VARCHAR,
ALTER COLUMN last_name TYPE VARCHAR

UPDATE employees
SET first_name = split_part("employeeName",' ',1),
	last_name = split_part("employeeName",' ',2)
Select * from employees	


Select "employeeName",title from employees






SELECT DISTINCT unitPrice from products

Select "customerID","companyName" from customers
ORDER BY "companyName" ASC

ALTER TABLE products
RENAME COLUMN unitprice TO unit_price

ALTER TABLE employees
DROP COLUMN linkedin_profile

Select "productName",unitPrice as price_in_usd
from products

Select "customerID","country" from customers where "country" = 'France' or "country" = 'Spain'

ALTER TABLE "Orders"
ADD COLUMN order_year integer;

UPDATE "Orders"
SET order_year = EXTRACT(YEAR FROM "orderDate")
ALTER TABLE employees
DROP COLUMN first_name,
DROP COLUMN last_name,
DROP COLUMN linkedin_profile

Select * from "Orders" 
where EXTRACT(YEAR FROM "orderDate") =2014
AND (freight>50 or "shippedDate" IS NOT NULL)











Select "productID","productName",unit_price from products
where unit_price>15

Select * from employees where "country"='USA' AND "title" ='Sales Representative'

Retrieve all products that are not discontinued and priced greater than 30.

Select * from "products"
where "discontinued" = 1 AND unit_price>30

Select* from "Orders"
limit 20

SELECT *
FROM "Orders"
OFFSET 10
FETCH FIRST 10 ROWS ONLY;

SELECT *
FROM customers
WHERE "contactTitle" IN ('Sales Representative', 'Owner');

Select * from "Orders"
where "orderDate" between '01/01/2013' AND '12/01/2013'

SELECT *
FROM products
WHERE category_id NOT IN (1, 2, 3);

Select * from customers
where "companyName" Like 'A%'



INSERT INTO "Orders" ("customerID","employeeID","orderDate","requiredDate","shippedDate","shipperID","freight","orderID")
VALUES ('ALFKI', 5,'2025-04-23', '2025-04-30','2025-04-25',2,45.50,11078);

		

UPDATE products
SET unit_price = unit_price * 1.10
WHERE category_id = 2;

Select * from products WHERE category_id = 2;
		
		
