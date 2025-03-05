create table Customers(
customerID int ,
customerName varchar(100),
contactName nvarchar(100),
Customeraddress varchar(100),
city varchar(100),
postalCode int,
country varchar(100)
)



insert into Customers values
(3,'Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312' ,'México D.F.','05023','Mexico'),
(4,'Around the Horn','Thomas Hardy','120 Hanover Sq.','London', 'WA1 1DP','UK'),
(5,'Berglunds snabbköp','Christina Berglund','Berguvsvägen 8','Luleå','S-958 22','Sweden')

ALTER TABLE Customers 
ALTER COLUMN PostalCode VARCHAR(100);

select * from Customers

select distinct country from Customers

select count(distinct country) as Diff_countries from  Customers

use Practice
go

select * from customers
where country = 'mexico'

select * from  Customers
where customerID = 1

select * from  Customers
where customerName like '%a%'

select * from Customers
order by contactName


create table product
(
productID int,
productName varchar(100),
supplierID int,
categoryID int,
unit varchar(100),
price float
)

insert into product values
(1,'Chais',1,1,'10 boxes x 20 bags',18),
(2,'Chang',1,1,'24 - 12 oz bottles',19),
(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10),
(4,'Chef Antons Cajun Seasoning',2,2,'48 - 6 oz jars',22),
(5,'Chef Antons Gumbo Mix',2,2,'36 boxes',21.35)

select * from product
order by price DESC

select * from product
order by productName DESC

select * from Customers
order by country , customername
