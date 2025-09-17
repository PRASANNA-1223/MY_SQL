use practice;

select * from employees;

create view user_view as select * from employees where salary <56000;

select * from user_view;

create or replace view user_view as select department_name,emp_id from employees e,departments d where d.department_id=e.department_id;

select *, ntile(2) over(order by name desc) emp_group from employees;

select *, row_number() over(order by name desc) row_int from employees;

select department_id,group_concat(name separator ',') from employees group by department_id;

select trim("       my ") ,"        mysql      ",rtrim("                       mysql    ") r,ltrim("        mysql      ") from dual;

select trim(both '0' from '000 0 test 000 0');

select trim(leading '0' from '000 0 test 000 0');

