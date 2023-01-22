create database alx_db

use alx_db
go

create table students
(
	id int not null primary key identity,
	first_name nvarchar(50),
	last_name nvarchar(50),
	index_number int not null,
	number_of_points int,
	is_active bit
)

alter table students alter column email nvarchar(100)

create table dogs
(
	-- GUID
	id uniqueidentifier not null,
	breed nvarchar(50)
)

create table employees
(
--  name type constraints
	id int not null primary key identity,
	first_name nvarchar(50) not null,
	phone_number varchar(25) not null unique,
	email varchar(50) not null unique,
	age int check (age > 17) default 18
)

-- use {db_name} exec sp_rename 'rename what', 'into what'
-- table
use alx_db exec sp_rename 'students2', 'students'
-- column
use alx_db exec sp_rename 'students.number_of_points', 'number_of_plusses'

alter table students add email nvarchar(30)

select * from alx_db.dbo.students
select * from dogs