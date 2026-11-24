create database film
use film
go
create schema schema_film
go
create table schema_film.actor(
act_id int primary key,
act_fname char(20),
act_lname char(20),
act_gender char(1)
)
create table schema_film.movie_cast(
act_id int,
mov_id int,
role char(30)
primary key(act_id,mov_id)
)
create table schema_film.director(
dir_id int primary key,
dir_fname char(20),
dir_lname char(20)
)
create table schema_film.movie(
mov_id int primary key,
mov_title char(50),
mov_year int ,
mov_time int,
mov_lang char(50),
mov_dt_rel date,
mov_rel_country char(5)
)
create table schema_film.movie_direction(
dir_id int,
mov_id int
primary key(dir_id,mov_id)
)
create table schema_film.reviewer(
rev_id int primary key,
rev_name char(30)
)
create table schema_film.genres(
gen_id int primary key,
gen_title char(20)
)
create table schema_film.movie_genres(
mov_id int,
gen_id int
primary key(mov_id,gen_id)
)
create table schema_film.rating(
mov_id int references schema_film.movie(mov_id),
rev_id int,
rev_stars int,
num_o_rating int
)
--Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table projects(
projectid int primary key,
projectname varchar(20)
)
--Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
--Add a primary key constraint to the "Employees" table for the "ID" column.
create table employee(
id int primary key, 
Name varchar(15)
)
alter table employee
add salary decimal
--Add a new column named "Department" to the "Employees" table with data type varchar(50).
alter table employee 
add department varchar(50)
--Rename the "Department" column in the "Employees" table to "DeptName".
execute sp_rename 'dbo.employee.Department','DeptName','column'
--Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
--Remove the foreign key relationship between "Employees" and "Projects."
alter table employee
drop  column salary
alter table employee
add projectid int references projects(projectid)
alter table dbo.employee
drop constraint FK__employee__projec__0A9D95DB
alter table dbo.employee
drop column projectid
--Add a unique constraint to the "Name" column in the "Employees" table.
alter table employee
add unique(name)
--Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
create table customers(
customersid int,
firstname varchar,
lastname varchar,
email varchar,
status varchar
)
--Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
alter table customers
add unique(firstname,lastname)
--Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.
alter table customers
add default'active'for status
--Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
--Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
--Create a schema named "Sales" and move the "Orders" table into this schema.
go
create schema sales
go
create table sales.orders(
orderid int ,
customerid int,
orderdate datetime,
totalamount decimal check(totalamount>0)
)
--Rename the "Orders" table to "SalesOrders."
exec sp_rename 'sales.orders','salesorders'
--Select all columns from the "Employees" table.
select*
from dbo.employee
--Select only the "Name" and "Salary" columns from the "Employees" table.
select name , salary 
from dbo.employee 
--Select distinct values of the "DeptName" column from the "Employees" table.
select DeptName 
from dbo.employee
--Select the top 5 records from the "Employees" table.
select Top 5 * 
from dbo.employee
--Select all records from the "Employees" table, ordered by the "Salary" column in descending order.
select *  
from dbo.employee 
order by salary desc
--Select the first 10 records from the "Employees" table, starting from the third record.
select *
from dbo.employee
order by id
offset 3 rows
--Select the average salary from the "Employees" table. (search on it)
select avg(salary) average_salary
from dbo.employee 
--Select the maximum and minimum salaries from the "Employees" table. (search on it)
select max(salary) max_salary , min(salary) min_salary
from dbo.employee
--Select the top 3 highest salaries from the "Employees" table.
select top 3 salary
from dbo.employee
order by salary desc
--Select all records from the "Employees" table, ordered by "Name" in ascending order.
select name
from dbo.employee 
order by name asc
--Select the first 5 records from the "Employees" table, starting from the second record, ordered by "Salary" in descending order.
select *
from dbo.employee
order by salary desc
offset 2 rows 
fetch next 5 rows only
--Select the sum of all salaries from the "Employees" table. (search on it)
select sum(salary) sum_salary
from dbo.employee
--Select records from the "Employees" table where the "Salary" is between 40000 and 60000, ordered by "Salary" in ascending order.
select *
from dbo.employee
where salary between 40000 and 60000
order by salary asc

