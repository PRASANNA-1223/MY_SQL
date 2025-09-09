use practice;

delimiter $$
create procedure update_salary( in salary_in integer, in employee_id_in int ,out message varchar(60))
begin
declare current_salary int;
select salary into current_salary from employees where emp_id=employee_id_in;
if(salary_in > current_salary) then
update employees set salary = salary_in where emp_id=employee_id_in;
set message='updated successfully';
else
set message='current salary higher then new salary';
end if;
end $$
delimiter ;

select * from employees;

drop procedure update_salary;

set @msg='';
call update_salary(55000,101,@msg);
select @msg;

select * from employees;

delimiter $$
begin;
declare msg varchar(60);
execute update_salary(101,55000.00,msg);
end $$
delimiter ;

select * from departments;
select * from employees;

select department_id from employees where department_id = (select department_id from departments where department_name = 'hr');



delimiter $$
create procedure updatedep(in new_department_name varchar(20), in employee_id int)
begin
declare current_dep varchar(20);
declare message varchar(90);
declare new_dep int;
declare new_dep_id varchar(40);
select department_name into current_dep from departments where department_id=(select department_id from employees where emp_id=employee_id);
select count(*) into new_dep from departments where department_name=new_department_name;
if (new_dep =0)then
set message='invalid department';
select message;
else
select department_id into new_dep_id from departments where department_name=new_department_name;
if (new_department_name != current_dep)then
update employees set department_id=new_dep_id where emp_id=employee_id;
set message='updated successfully';
select message;
else
set message='you have entered same department';
select message;
end if;
end if;
end $$
delimiter ;

call updatedep('sales',101);


select* from employees;

select * from departments;
 
 drop procedure updatedep;
