-- Create the categories table
CREATE TABLE categories (
    category_id INTEGER NOT NULL,
    category_name VARCHAR(50),
    category_description VARCHAR(255),
    PRIMARY KEY (category_id)
);

-- Select all from categories
SELECT * FROM categories;


-----customer-----------
 CREATE TABLE customers(
 customerID CHAR(5) PRIMARY KEY,
 companyName VARCHAR(200),
 contactName VARCHAR(50),
 contactTitle VARCHAR(50),
 city VARCHAR(50),
 country VARCHAR(50)
 );
SELECT * FROM customers;

------Employees-----------
CREATE TABLE employees(
employeeID INT PRIMARY KEY,
employeeName TEXT NOT NULL,
title TEXT,
city TEXT,
country TEXT,
reportsTo INT,
FOREIGN KEY(reportsTo)REFERENCES employees(employeeID)
);

SELECT * FROM employees;


--employeeID PRIMARY KEY- Acts as a primary key.
--employeeName NOT NULL - Column should not have null Value
--FOREIGN KEY(reportsTo)REFERENCES- self-referencing foreign key

------orders-----------
CREATE TABLE orders(
orderID SERIAL PRIMARY KEY,
customerID VARCHAR(10),
employeeID INT,
orderDate DATE,
requiredDate DATE,
shippedDate DATE,
shipperID INT,
freight double precision,
FOREIGN KEY(customerID) REFERENCES customers(customerID),
FOREIGN KEY(employeeID) REFERENCES employees(employeeID)
);

SELECT * FROM orders;

------order details-----------
create table order_details(
orderID int,
productID serial,
Primary Key (orderID, productID),
unitPrice float,
quantity int,
discount float
);

SELECT * FROM order_details;

----products-----------------

CREATE TABLE products (
    product_id bigint NOT NULL,
    product_name character varying(100) NOT NULL,
    quantity_per_unit character varying(100) NOT NULL,
    unit_price numeric,
    discontinued smallint,
    category_id integer NOT NULL
);

-- Name: shippers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippers (
    shipper_id bigint NOT NULL,
    company_name character varying
);


SELECT * FROM public.shippers;






