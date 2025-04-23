SELECT * FROM "Categories"

create table customers(
customerID char(5) Primary key,
companyName Varchar(50) NOT NULL,
ContactName Varchar(50),
ContactTitle Varchar(50),
City Varchar(50),
Country Varchar(30)
);

Create table shippers(
shipperID Serial Primary key,
companyName Text NOT NULL
);

create table categories(
categoryID serial Primary key,
categoryName Varchar(50) NOt Null,
description text
);

create table employees(
employeeID serial Primary key,
employeeName Varchar(50),
title Varchar(50),
city Varchar(50),
country Varchar(50),
reportsTo int 
);

create table products(
productID serial Primary key,
productName Varchar(50) Not null,
quantityPerUnit Text,
unitPrice float,
discontinued Boolean,
categoryID int,
FOREIGN KEY (categoryID) References categories(categoryID)
);


create table orders(
orderID int Primary key,
customerID Char(5),
Foreign key (customerID) References customers(customerID),
employeeID serial,
Foreign key (employeeID) References employees(employeeID),
orderDate Date,
requiredDate Date,
shippedDate Date,
shipperID serial,
Foreign key (shipperID) References shippers(shipperID),
freight float
);


create table order_details(
orderID int,
productID serial,
Primary Key (orderID, productID),
unitPrice float,
quantity int,
discount float
);

select * from categories;
select * from customers;

