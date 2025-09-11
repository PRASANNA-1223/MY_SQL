use practice;

select * from emp;


truncate table emp;

select * from employees;

delete from employees;

truncate table employees;

delimiter $$
create trigger t1 before delete 
on employees for each row
begin
insert into emp values (old.emp_id,old.name,old.salary,old.department_id);
end $$
delimiter ;

drop trigger t1;

-- table for insert
create table insert_table(emp_id int, name varchar(60),salary int, department_id int);

delimiter $$
create trigger t2 after insert
on employees for each row
begin
insert into insert_table values (new.emp_id,new.name,new.salary,new.department_id);
end $$
delimiter ;

drop trigger t2;

select * from insert_table;

select * from employees;
insert into employees values(106,"rajan",50000,20);

-- update table
create table update_table (emp_id int,name varchar(60),);


