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

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'employee_payroll'
insert into employee_payroll values('Bill', 100000.00, '2018-01-03'), ('Terisa', 200000.00, '2019-11-13'), ('Charlie', 300000.00, '2020-05-21');
