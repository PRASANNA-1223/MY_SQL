use practice;

create table students_details(
roll_no int auto_increment primary key,
name varchar(10),
department varchar(40),
mark int
);

INSERT INTO students_details (name, department, mark) VALUES
('Arun', 'Computer Science', 85),
('Divya', 'Mechanical', 81),
('Kiran', 'Electrical', 92),
('Sneha', 'Civil', 67),
('Ravi', 'Information Tech', 88),
('Meena', 'Electronics', 74),
('Vijay', 'Computer Science', 95),
('Anu', 'Mechanical', 81),
('Raj', 'Civil', 67),
('Priya', 'Information Tech', 90);

truncate table students_details;

-- window function
select *,dense_rank() over( partition by department order by mark desc) as Dense_rank_mark,rank() over(partition by department order by mark desc) Rank_mark from students_details;

select mark, department, dense_rank() over( partition by department
order by mark asc) dense_mark from students_details;

-- temporary table
create temporary table temp_details(
id int,
name varchar(60),
contact bigint
);

select * from temp_details;

select round(4.4), round(4.5) from dual;

select abs(5),abs(-5) from dual;

select sign(-8),sign(18) from dual;

select mod(48,300),mod(3,4),mod(7,3) from dual;

select round(rand()*10) from dual;

select truncate(rand()*10,0) from dual;

select now();

select 10+20 sum from dual;

select curdate(), current_date() from dual;

select curtime() , current_time() from dual;

select utc_timestamp(),utc_date(),utc_time() from dual;