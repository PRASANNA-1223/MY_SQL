use practice;

-- 1:A teacher wants a list of all subjects each student has enrolled in.
select name ,group_concat( title separator ',' ) title from 
(select name,title from enrollments e inner join courses c on e.courseid=c.courseid inner join students s on s.studentid=e.studentid) course group by name;

-- 2: Cleaning up user input (removing extra spaces).
select trim(" mysql ") remove from dual;

-- 3: Ranking employees within each department.
 select  salary,department_id,dense_rank() over(partition by department_Id order by salary desc ) ranks from employees ;
 
 -- 4: Create a view for reusable queries (high salary employees).
create view max_salary as select max(salary) from employees;

-- 5: Divide students into 3 groups based on marks.
select ntile(3) over (order by mark) from students;

-- 6: Correct misspelled words in a product description.
select replace('salary is bad','bad','good') sentence from dual;

-- 7: Format employee IDs with leading zeros (LPAD) and right padding with stars (RPAD).
select rpad(lpad(123,5,0),6,'*') demo from dual;

-- 8: Extract first 3 letters of employee names.
select substring(name,2),name from employees;
