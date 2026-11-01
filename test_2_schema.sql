create database company_training;
use company_training;
create table departments(
	department_id int not null,
    dept_name varchar(80) not null,
    city varchar(60)
);
select* from departments;
create table employees(
	employee_id int not null,
    employee_name varchar(100) not null,
    email varchar (120),
    department_id int not null,
    salary decimal(10,2),
    status varchar(20)
    );
select* from employees;
-- 1. add primary key departmet_id
alter table departments add primary key(department_id);
describe departments;

-- 2. add primary kkey employee_id
alter table employees add primary key(employee_id);
describe employees;

-- 3. change column name.
alter table departments change column dept_name department_name varchar(80) not null;
select* from departments;

-- 4. add new column location
alter table departments add column location varchar(100);

-- 5. modify employye_salary
alter table employees modify column salary decimal(12,2) not null;
describe employees;

-- 6. set default value of employee_status
alter table employees modify column status varchar(20) default "active";

-- 7. add a unique constraint
alter table employees modify column email varchar(120) unique;

-- 8. rename the table
alter table employees rename staff;
select* from staff;

-- 9. add foreign key
alter table staff add constraint fk_id foreign key(department_id) references departments(department_id);
describe staff;

-- 10. drop the unique constraint
alter table staff drop index email;
describe staff;

-- 11. drop the foreign key
alter table staff drop foreign key fk_id;

-- 12. drop the primary key
alter table staff drop primary key;
describe staff;

-- 13. add primary key
alter table staff add primary key(employee_id);

-- 14. drop the location column
alter table departments drop location;
select* from departments;

-- 15. rename the database
create database company_management;
rename table company_training.departments to company_management.departments;
rename table company_training.staff to company_management.staff;
drop database company_training;
