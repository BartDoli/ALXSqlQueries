use alx_db
go

insert into students (first_name, last_name, index_number, number_of_plusses, is_active, email)
values ('Mateusz', 'Gumkowski', 734828, 6, 1, 'mateusz.gumkowski@mistrzowie-programowania.io')
insert into students (first_name, last_name, index_number, number_of_plusses, is_active, email)
values ('Mateusz', 'Sadurski', 734118, 6, 1, 'mateusz.dokumentujacy@mistrzowie-programowania.io')
insert into students (first_name, last_name, index_number, number_of_plusses, is_active, email)
values ('Andrzej', 'Frydryszak', 134828, 0, 1, 'af@mistrzowie-programowania.io')
insert into students (first_name, last_name, index_number, number_of_plusses, is_active, email)
values ('Monika', 'Danych', 134328, 0, 1, 'md@mistrzowie-programowania.io'),
	   ('Damian', 'Malejka', 734718, 6, 1, 'dm@mistrzowie-programowania.io'),
	   ('Emil', 'Pałczyński', 1314328, 5, 1, 'ep@mistrzowie-programowania.io')

select * from students

insert into alx_db.dbo.employees(first_name, phone_number, email, age)
values ('Aa', '123231', 'af@paparamq.com', 29)

insert into alx_db.dbo.employees(first_name, phone_number, email)
values ('Heyoo1', '243424', 'hey@paparaeqm.com')
select * from employees

insert into dogs (id, breed)
values(NEWID(), 'Labrador'),
(NEWID(), 'WHWT'),
(NEWID(), 'German Shephard'),
(NEWID(), 'Corgy')

select * from dogs