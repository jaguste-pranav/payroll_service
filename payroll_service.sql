select * from sys.databases
create database payroll_service

use payroll_service

select db_name()

create table employee_payroll
(
id int identity(1,1),
name varchar(25) not null,
salary money not null,
start date not null
);


