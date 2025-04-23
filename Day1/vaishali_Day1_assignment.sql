------categories-----------
CREATE TABLE categories(
categoryID SERIAL PRIMARY KEY,
categoryName VARCHAR(200)NOT NULL UNIQUE,
description TEXT
)
--SERIAL--Auto-incrementing primary key using a sequence.
--NOT NULL -Column should not have null Value
--UNIQUE- Column should not have Repetative value

------customer-----------
CREATE TABLE customers(
customerID CHAR(5) PRIMARY KEY,
companyName VARCHAR(200),
contactName VARCHAR(50),
contactTitle VARCHAR(50),
city VARCHAR(50),
country VARCHAR(50)
)
--customerID PRIMARY KEY-Acts as a primary key.

------Employees-----------
CREATE TABLE employees(
employeeID INT PRIMARY KEY,
employeeName TEXT NOT NULL,
title TEXT,
city TEXT,
country TEXT,
reportsTo INT,
FOREIGN KEY(reportsTo)REFERENCES employees(employeeID)
)
--employeeID PRIMARY KEY- Acts as a primary key.
--employeeName NOT NULL - Column should not have null Value
--FOREIGN KEY(reportsTo)REFERENCES- self-referencing foreign key

------orders-----------
create table orders(
orderID int primary key,
customerID char(5) references customers(customerID),
employeeID int references employees(employeeID),
orderDate DATE,
requiredDate DATE,
shippedDate DATE,
shipperID int references shippers(shipperID),
freight DECIMAL(10, 2)
)
--orderID primary key- Act as Primary key
--customerID, employeeID, shipperID: Foreign keys to their respective tables

------order details-----------
CREATE TABLE order_details (
orderID INT REFERENCES orders(orderID),
productID INT REFERENCES products(productID),
unitPrice DECIMAL(10, 2),
quantity INT,
discount DECIMAL(10, 2),
PRIMARY KEY (orderID, productID)
)

-- orderID ,productID : Foreign keys to their respective tables
--PRIMARY KEY -Ensures that each product appears only once per order 

----products-----------------
create table products(
productID SERIAL primary key,
productName TEXT NOT NULL,
quantityPerUnit TEXT,
unitPrice DECIMAL(10,2),
discontinued BOOLEAN,
categoryID int references categories(categoryID)
)
--productID  primary key - Act as primary key
--productName -NOT NULL - Not acctpting null values

--------shippers---------------
create table shippers(
shipperID SERIAL primary key,
companyName TEXT NOT Null 
)
--shipperID : primary key - Act as primary key
--companyName :NOT NULL - Not acctpting null values


