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

select *,dense_rank() over( partition by department order by mark desc) as Dense_rank_mark,rank() over(partition by department order by mark desc) Rank_mark from students_details;

select mark, department, dense_rank() over( partition by department
order by mark asc) dense_mark from students_details;