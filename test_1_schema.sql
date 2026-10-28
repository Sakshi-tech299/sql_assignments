drop database if exists shopping_management;
create database shopping_management;
use shopping_management;
create table customer(
customer_id int primary key auto_increment,
customer_name varchar(100) not null,
email varchar(50) unique not null,
phone_no char(10) unique not null,
gender enum ("male", "female", "other"),
country varchar(50) default "india",
city varchar(50) not null,
pincode char(6) default "201301",
registration_date date default (current_date),
registration_time time default(current_time),
created_at datetime default(current_timestamp),
address varchar(250),
customer_status enum ("active", "inactive", "blocked" )default "active",
customer_notes tinytext
);


create table orders(
order_id int primary key auto_increment,
customer_id int not null,
order_date date default(current_date),
order_amount decimal(10,2) not null,
order_status enum ("pending","processing","shipped","delivered","cancelled") default "pending",
payment_method enum ("cash","card","upi","net banking"),
payment_status enum ("pending","paid","failed")default "pending",
shipping_address varchar(250) not null,
delivery_pincode char(6),
quantity int check(quantity>0) not null,
discount_amount decimal(10,2) default "0",
delivery_date  date default null ,
created_at timestamp default (current_timestamp),
tracking_number varchar(30) unique not null,
delivery_status enum("not dispatched", "in transit","delivered", "returned") default "not dispatched",
order_noted tinytext,
constraint fk_orders_customer foreign key(customer_id) references customer (customer_id) on delete cascade on update cascade
);

show tables;
describe customer;
describe orders;
select* from customer;
select* from orders;