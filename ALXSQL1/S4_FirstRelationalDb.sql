create database company
go
use company
go

create table departments
(
	id uniqueidentifier not null primary key,
	department_name nvarchar(50) not null unique
)
go

create table employees
(
	id uniqueidentifier not null primary key,
	first_name nvarchar(100) not null,
	last_name nvarchar(100) not null,
	email nvarchar (50) unique not null,
	department_id uniqueidentifier not null foreign key references departments(id)
)
go

insert into departments(id, department_name)
values (NEWID(), 'HR'),
	(NEWID(), 'IT'),
	(NEWID(), 'PR'),
	(NEWID(), 'R&D'),
	(NEWID(), 'Office')
go

insert into employees(id, first_name, last_name, email, department_id)
values(NEWID(), 'Tomasz', 'IeeeMacarena', 'a@kotamaala.com', 'FA50E322-A986-4F5D-8776-328E9A7E888A'),
(NEWID(), 'Jacek', 'Aaa', 'aa@kotamaala.com', 'FA50E322-A986-4F5D-8776-328E9A7E888A'),
(NEWID(), 'Piotr', 'BBB', 'bbb@kotamaala.com', '4656040C-EE24-44D1-98B6-C534E93CA2FA'),
(NEWID(), 'Misio', 'Yya', 'pp@kotamaala.com', '886EEE76-1508-44A6-A172-C2A5255B9DA6')

select * from departments
select * from employees
select * from employees inner join departments on employees.department_id=departments.id

select department_name from departments
select first_name, last_name from employees
select first_name, last_name, department_name from employees inner join departments on employees.department_id=departments.id