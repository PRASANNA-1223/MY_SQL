use practice;

create table a (id int unique);

insert into a values(),(),();

select * from a;

select * from employees e1 where salary>
(select avg(salary) a1 from employees e2 where e1.department_id=e2.department_id);

select * from employees where salary>
(select max(salary) from employees) and department_id=10;


select count(*),avg(salary) from employees group by department_id having count(*)>5 
and avg(salary)=(select avg(salary) from employees group by department_id order by avg(salary) desc limit 1);


select * from employees e1 where salary>
(select avg(salary)  from employees e2 where e1.department_id=e2.department_id limit 5) ;