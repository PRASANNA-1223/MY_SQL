use practice;

select * from employees;

delimiter $$
create trigger t4 after update on employees for each row
begin
call update_table(old.emp_id,old.salary,new.salary);
end $$
delimiter ;

drop trigger t4;

select * from update_value;

create table update_value(emp_id int,old_salary int,new_salary int,date date,status varchar(60));

select * from employees;

select * from employees ;

truncate table update_value;

use practice;

update employees set salary =55000 where emp_id= 104; 

delimiter $$
create procedure update_table(in empp_id int, in old_salary int,in new_salary int)
begin  
declare message varchar(60);
if(old_salary>=new_salary) then
set message='current salary equal or lesser than original';
insert into update_value values(empp_id,old_salary,new_salary,current_timestamp(),message);
else
set message='updated successfully';
insert into update_value values(empp_id,old_salary,new_salary,current_timestamp(),message); 
end if;
end $$
delimiter ;

drop procedure update_table;