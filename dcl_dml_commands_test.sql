CREATE DATABASE IF NOT EXISTS interview_commands_practice;
USE interview_commands_practice;
SET autocommit = 1;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(60),
    department VARCHAR(30),
    city VARCHAR(40),
    salary DECIMAL(10, 2),
    employment_status VARCHAR(15),
    phone VARCHAR(15) UNIQUE
) ENGINE = InnoDB;

INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
    (1, 'Rahul Sharma', 'IT', 'Delhi', 45000.00, 'Active', '9000000001'),
    (2, 'Priya Verma', 'HR', 'Mumbai', 42000.00, 'Active', '9000000002'),
    (3, 'Amit Patel', 'Sales', 'Ahmedabad', 38000.00, 'Inactive', '9000000003'),
    (4, 'Anjali Singh', 'IT', 'Kolkata', 50000.00, 'Active', '9000000004'),
    (5, 'Vijay Kumar', 'Finance', 'Bangalore', 55000.00, 'Active', '9000000005'),
    (6, 'Sanjay Reddy', 'Sales', 'Hyderabad', 36000.00, 'Active', '9000000006'),
    (7, 'Megha Iyer', 'IT', 'Chennai', 48000.00, 'Active', '9000000007'),
    (8, 'Neha Gupta', 'HR', 'Delhi', 32000.00, 'Inactive', '9000000008'),
    (9, 'Arjun Mehta', 'Finance', 'Pune', 52000.00, 'Active', '9000000009'),
    (10, 'Pooja Shah', 'Sales', 'Mumbai', 40000.00, 'Active', '9000000010');
COMMIT; 
select * from employees;
insert into employees
	(employee_id, employee_name, department, city, salary, employment_status, phone)
values
	(11, 'vani','IT','Panipat',45000,'Active','9087654321');
    
    
insert into employees
	(employee_id, employee_name, department, city, salary, employment_status, phone)
values
	(12,"neha sharma","HR","Delhi","24000","Active","9876543210"),
    (13,"akash","Finance","Sonipat","55000","inactive","8976543210");
select * from employees;

update employees 
SET city="Gurgaon" , salary="46000"
where employee_id=11;
select * from employees;

update employees
set salary= (salary*10)/100 + salary
where employee_id in (1,4,7);

delete from employees
where employee_id in (3,8,13);
select * from employees;

alter table employees 
add column email varchar(100);
select * from employees;

alter table employees
modify column phone varchar(20);
describe employees;

alter table employees
rename column city to work_city;
select * from employees;

alter  table employees
drop column email ;
select * from employees;



rename table employees to staff;
show tables;

select * from staff;

start transaction;
insert into staff
	(employee_id, employee_name, department, work_city, salary, employment_status, phone)
VALUES
	("15","mehak","IT","Sonipat","45000","actve","9897654311");
update staff
set salary="45000"
where employee_id=2;
commit;

start transaction;
update staff
set salary=60000
where employee_id=5;

delete from staff
where employee_id=6;
select* from staff;
rollback;
select * from staff;

start transaction;
update staff
set salary=47000
where employee_id=14;
savepoint salary_saved;

update staff
set work_city="jaipur"
where employee_id=14;
savepoint city_saved;

delete from staff
where employee_id=14;


rollback to salary_saved;
commit;
select* from staff;

start transaction;
truncate table staff;
rollback;
select* from staff;

drop table staff;
