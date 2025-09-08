use practice;

select * from employees where salary>(select avg(salary) from employees);

select * from employees where salary =(select max(salary) from employees);

select * from employees where department_id =( select department_id from employees where name like "alice");

select * from employees where department_id in (select department_id from departments where location_Id=1700);

select * from employees	where salary> any
(select salary from employees where department_id=20);

select * from employees	where salary> all
(select salary from employees where department_id=20);

select * from employees where salary= any
(select salary from employees where department_id=10);

select * from employees e1 where salary>
(select avg(salary) from employees e2 where e1.department_id=e2.department_id group by department_id);

select * from employees e1 where not exists (select department_id from employees e2 where e2.department_id=e1.department_id);

select * from employees e1 where exists
(select department_id from employees e2 where e1.department_id=e2.department_id 
and e1.salary>60000 group by department_id having count(*)>=1);

select e1.*,(select department_name from departments d1 where d1.department_id=e1.department_id) department_name from employees e1;

select max(salary) from employees where salary<
(select max(salary) from employees);

select * from employees where salary in
(select max(salary) from employees GROUP BY department_id);

update employees set salary=salary+salary*0.10 where department_id=(select department_id from departments where department_name="sales");

delete from employees where department_id=
(select department_id from departments where location_id=1800);



create table emp as selecT * from employees where department_id in (select department_id from departments where department_name="hr");

select * from emp;

select * from employees;


