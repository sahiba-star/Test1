create database Shopping_Management;
use Shopping_Management;
create table customers(
customer_Id int Primary key auto_increment,
customer_name varchar(100),
Email varchar(100) unique not null,
Phone_Number char(10) unique,
Age tinyint  unsigned check(Age>0),
Gender enum ('Male,female,other'),
Country varchar(50) default'India',
City varchar(50),
Pincode char(6) default'201301',
Registration_Date date default(current_date()),
Registration_Time time default(current_time()), 
Created_At timestamp default(current_timestamp()),
Address varchar(250),
 Customer_Status enum('Active','inActive','Blocked') default'Active',
 Customer_Notes  tinytext
);
select * from customers;

create table orders(
order_id int primary key auto_increment,
Customer_Id int,
Order_Date date default(current_date()),
Order_Amount Decimal(10,2) ,
Order_Status enum('Pending','Processing','Shipped','Delivered','Cancelled') default 'Pending',
Payment_Method enum ('Cash','Card','UPI','Net-banking'),
Payment_Status enum('Pending','Paid','Failed') default'Pending',
Shipping_Address varchar(250),
Delivery_Pincode char(6),
Quantity int unsigned check(Quantity>0),
Discount_Amount decimal(10,2) default'0',
Delivery_Date date default null,
Created_At timestamp default(current_timestamp()),
Tracking_Number varchar(30) unique not null,
Delivery_Status enum('not-dispatched','Intransit','Delivered','Returned')default'not-dispatched',
Order_Notes tinytext,
foreign key (Customer_Id) references  Customers(customer_Id)
);
select * from orders;
describe orders;
describe customers;