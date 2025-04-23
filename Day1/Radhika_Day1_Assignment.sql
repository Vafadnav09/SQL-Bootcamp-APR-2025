CREATE DATABASE Northwind_Traders;		---- To Create Database


-----CREATING TABLES
--===============================

CREATE TABLE Shippers( 
shipperID INT PRIMARY KEY,
companyName VARCHAR(100)
);

CREATE TABLE employees(
employeeID INT PRIMARY KEY,
employeeName VARCHAR(25),
title VARCHAR(25),
city VARCHAR(25),
country VARCHAR(25),
reports_to INT,
CONSTRAINT fk_employees
FOREIGN KEY(employeeID) REFERENCES employees(employeeID)
);


CREATE TABLE categories(
categoryID INT PRIMARY KEY,
categoryName VARCHAR(25),
description VARCHAR(100)
);

CREATE TABLE products(
productID SERIAL PRIMARY KEY,
productName VARCHAR(100),
QuantityPerUnit VARCHAR(50),
unitPrice double precision,
discontinued BOOLEAN,
categoryID INT,
CONSTRAINT fk_categories
FOREIGN KEY(categoryID) REFERENCES categories(categoryID)
);

CREATE TABLE CUSTOMERS(
customerID VARCHAR(10) PRIMARY KEY,
companyName VARCHAR(50),
contactName VARCHAR(50),
contactTitle VARCHAR(50),
city VARCHAR(25) NOT NULL,
country VARCHAR(25)
);

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

CREATE TABLE order_details(
orderID INT,
productID INT,
unitPrice float,
quantity INT,
discount float,
PRIMARY KEY(orderID,productID),
FOREIGN KEY(orderID) REFERENCES orders(orderID),
FOREIGN KEY(productID) REFERENCES products(productID)
);


---------------------------------------------------------------------------------


--To import data into tables
--=============================

copy shippers(shipperid,companyname) 
from 'C:\archive_nwt\shippers.csv' 
DELIMITER ','
CSV HEADER;

select * from shippers;				--To Check the loaded data

-------------------------------------------------------------------------
copy employees(employeeID,employeeName,title,city,country,reports_to)
from 'C:\archive_nwt\employees.csv'
CSV HEADER;

select * from employees;
-----------------------------------------------------------------------------
copy categories(categoryID,categoryName,description)
from 'C:\archive_nwt\categories.csv'
CSV HEADER;

select * from categories;

-----------------------------------------------------------------------------

COPY products FROM 'C:\archive_nwt\products.csv' 
WITH (FORMAT csv, HEADER true, ENCODING 'LATIN1');


select * from products;

-----------------------------------------------------------------------------

COPY customers FROM 'C:\archive_nwt\customers.csv' 
WITH (FORMAT csv, HEADER true, ENCODING 'LATIN1');


select * from customers;

------------------------------------------------------------------------------

COPY orders FROM 'C:\archive_nwt\orders.csv' 
WITH (FORMAT csv, HEADER true);

select * from orders;

------------------------------------------------------------------------------
COPY order_details FROM 'C:\archive_nwt\order_details.csv' 
WITH (FORMAT csv, HEADER true);

select * from orders;

-------------------------------------------------------------------------------
--CREATING FOREIGN KEY REFRENCES for Shipping table and Order table

ALTER TABLE ORDERS
ADD CONSTRAINT FK_shipperid
FOREIGN KEY(shipperid) REFERENCES shippers(shipperid);


