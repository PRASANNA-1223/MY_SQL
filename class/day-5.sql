use practice;

select name,salary,ranks from (select employees.*,dense_rank() over(order by salary desc) as ranks  from employees) tab1 where ranks =2;

select *  from (select salary as sal from employees order by salary desc limit 4) tb1 order by  sal limit 1;

select max(salary) from employees where salary<
(select max(salary) from employees);

select * from employees where department_id=10;

select * from departments where department_id=10;

select name,department_name from employees,departments where employees.department_id=departments.department_id;