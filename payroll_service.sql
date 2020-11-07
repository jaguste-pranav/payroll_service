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

ALTER TABLE employee_payroll ADD CONSTRAINT PK_id PRIMARY KEY (id);

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'employee_payroll'
insert into employee_payroll values('Bill', 100000.00, '2018-01-03'), ('Terisa', 200000.00, '2019-11-13'), ('Charlie', 300000.00, '2020-05-21');

select * from employee_payroll;

select salary from employee_payroll where name = 'Bill';

select * from employee_payroll where start between '2018-01-01' and GETDATE();

alter table employee_payroll add gender varchar(20);

update employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';

update employee_payroll set gender = 'F' where name = 'Terisa';

select gender, sum(salary) from employee_payroll group by gender;

alter table employee_payroll add phoneNo varchar(15);

alter table employee_payroll add department varchar(50);

select max(salary) from employee_payroll;
select avg(salary) from employee_payroll;
select min(salary) from employee_payroll;
select count(salary) from employee_payroll;

insert into employee_payroll values('Billy', 150000.00, '2018-01-05', 'M', '4545454545', 'R&D', 'Pune');

alter table employee_payroll add deduction money,taxable_pay money,income_tax money,net_pay money;

