use practice;

-- 1. List all subjects each student has enrolled in as a single row. 
with a as
(select name,title from students s inner join enrollments e on s.studentid=e.studentid inner join courses c on  c.courseid=e.courseid )
select  name,group_concat(title) from a group by name ;

-- 2.Show all department names each employee has worked in (comma separated). 
select (select department_name from departments where departments.department_id=employees.department_id) name,
group_concat(name) employee from employees group by department_id;

-- 3.Concatenate all phone numbers of each customer separated by ;. 
select customer_id ,group_concat(phone separator ';') from customer group by customer_id;

-- 4.Display a list of all product names under each category. 
select group_concat(product_name) from products group by category;

-- 5.Combine all cities where a supplier delivers into a single string. 
select group_concat(city) from delivery group by employee;

-- 6. Remove extra spaces before and after employee names in the employee table. 
select trim(name) from employees;

-- 7. Clean up email addresses where users have mistakenly added spaces. 
select trim(email) from employees;

-- 8. Show names after trimming only leading spaces. 
select trim( leading from name) from employees;

-- 9. Show names after trimming only trailing spaces. 
select trim(trailing from name) from employees;

-- 10. Remove # characters from both sides of a string. 
select trim(  '@' from '@ ada @') data from dual;

-- 11. Assign a unique row number to employees ordered by salary. 
select e.*,row_number() over(order by salary) from employees e;

-- 12. Within each department, number employees based on their hire date. 
select department_id , count(*),row_number() over(order by hire_date) from emp1 group by department_id;

-- 13. List the top 3 earners in each department using row numbers. 
select * from
(select department_id ,row_number() over(partition by department_id  order by salary desc) r,salary from employees) tab 
where r<=3;

-- 14. Generate sequential numbers for students ordered by marks. 
select row_number() over(order by marks desc) ,name from students;

-- 15. Rank orders in each region by order amount.
select row_number() over(order by sum(amount)) reg_no,region_name from region group by region_name;

-- 16. Create a view that shows only employees with salary greater than 50,000.
create or replace view emp_high_sal as select * from employees where salary >50000;
select * from emp_high_sal;

-- 17. Create a view for students who scored more than 80 in exams.
create or replace view high_mark as select * from students where marks > 80;
select * from high_mark;

-- 18. Create a view that displays all products out of stock. 
create or replace view product_zero as select * from products where quantity=0;
select * from product_zero;

-- 19. Create a view that joins orders and customers for quick access. 
create or replace view joined_data as select * from orders,customers;
select * from joined_data;

-- 20. Create a view to show monthly sales summary. 
create or replace view monthly as select month(date) from sale order by month(date);
select * from monthly;

-- 21. Divide employees into 4 performance groups based on salary. 
select ntile(4) over(order by salary),employees.* from employees;

-- 22. Assign students into 3 grade buckets based on marks. 
select ntile(3) over(order by marks),s.* from students s;

-- 23. Split salespeople into 5 groups according to sales value. 
select ntile(5) over (order by value) from sales ;

-- 24. Divide marathon runners into quartiles based on completion time.
select ntile(5) over (order by time),m.* from marathon m;

--  25. Classify customers into 2 halves: high spenders and low spenders.
select ntile(2) over(order by spend desc) from customer;

-- 26. Replace all occurrences of "colour" with "color" in a product description. 
select replace(product,'colour','color') from products;

-- 27. Replace dashes - with slashes / in date strings. 
select replace(now(),'-','/') from dual; 

-- 28. Replace old company name with new one in the clients table. 
select replace (company_name,'old','new')  from client;

-- 29. Replace spaces with underscores in usernames. 
select replace(name,' ','_') from employees;

-- 30. Replace "N/A" with NULL in the data column.
select replace(name,'n/a',null) from employees;

-- 31. Pad employee IDs with leading zeros to make them 6 digits.
select lpad(emp_id,6,0) from employees;

-- 32. Right-pad customer names with * to make them 15 characters long.
select rpad(cust_name,15,'*') from customers;

-- 33. Display order numbers with leading ORD- prefix using LPAD. 
select lpad(order_id,7,'ord-') from orders;

-- 34. Format account numbers so they are always 10 digits (with LPAD). 
select lpad(ac_no,10,0) from accounts;

-- 35. Pad invoice numbers with trailing # until they reach length 12.
select rpad(invoice,12,'#') from tax;

-- 36. Extract the first 3 letters of each employee name.
select substring(name,1,3) from employees;

-- 37. Show last 4 digits of each phone number. 
select substring(phno,-4) from employees;

-- 38. Display the middle 2 characters of product codes.
select substr(codes,length(codes)/2,2) from product;

-- 39. Extract year from a date string using substring. 
select substr('23/12/2003',-4) from dual;

-- 40. Show initials of each employee (first letter of first name + last name). 
select concat(substr(first_name,1,1),' ',last_name) from employees;