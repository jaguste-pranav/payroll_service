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


create table Emp_Payroll
(
EId int not null FOREIGN KEY REFERENCES employee_payroll(id),
BasicPay money not null,
Deduction money not null,
TaxablePay money not null,
IncomeTax money not null,
NetPay money not null,
)

Insert into Emp_Payroll values
(1,35000, 7000,15000,1000,14000),
(2,75000, 4000,24000,3000,21000),
(3,26000, 10000,30000,5000,25000);

select * from Emp_Payroll

select Gender,SUM(BasicPay) as SUM,
AVG(BasicPay) as AVG, MIN(BasicPay) as MIN,
MAX(BasicPay) as MAX from employee_payroll INNER JOIN Emp_Payroll 
ON employee_payroll.id = Emp_Payroll.EId GROUP BY Gender;

select BasicPay from Emp_Payroll INNER JOIN employee_payroll ON Emp_Payroll.EId = employee_payroll.id where name = 'Bill';

select employee_payroll.id ,name, department ,BasicPay from employee_payroll
INNER JOIN  Emp_Payroll ON employee_payroll.id = Emp_Payroll.EId
