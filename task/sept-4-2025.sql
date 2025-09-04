use practice;

select * from employees where name like "a%";

select * from employees where city like "san%";

select * from employees where name like 'a%';

select count(department),department from employee group by department having count(department)>2 order by avg(salary) desc;


