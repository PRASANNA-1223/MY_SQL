use practice;

select (select department_name from departments where departments.department_id=e1.department_id) department_name ,e1.* from employees e1 where salary>
(select avg(salary)
 from employees e2  group by department_id having e1.department_id=e2.department_id);

select avg(salary) from employees where department_id=20;

select * from employees e1 where salary>
(select avg(salary) from employees e2 where e1.department_id =e2.department_id);

select * from employees where
salary> all
(select avg(salary) from employees group by department_id);

select * from employees where
salary> any
(select avg(salary) from employees group by department_id);

 select * from employees e where not exists(select department_id from departments d where e.department_id = d.department_id and location_id=1700);
 
 select * from employees e where exists(select department_id from departments d where e.department_id = d.department_id and location_id=1700);

