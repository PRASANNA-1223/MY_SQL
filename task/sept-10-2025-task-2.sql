use practice;

select * from students;

select * from payments;

select * from enrollments;

select * from courses;

-- •	Students(StudentID, Name, Email, City, JoinDate)
create table Students(
studentid int primary key,
name varchar(60),
email varchar(60),
city varchar(60),
joindate date);

drop table students;

-- •	Coursese(CourseID, Title, Category, Price)
create table Courses(
courseid int primary key,
title varchar(60),
category varchar(60),
Price int);

drop table courses;

-- •	Enrollments(EnrollID, StudentID, CourseID, EnrollDate, Status)
create table enrollments(
enrollid int primary key,
studentid int references students(studentid),
courseid int references courses(courseid),
enrolldate date,
status varchar(60)
);

-- •	Payments(PaymentID, StudentID, Amount, PayDate)
create table payments(
paymentid int primary key,
studentid int references students(studentid),
amount int,
paydate date
);

-- 1.	Add a new student who joined today.
insert into students values(100,"press","press@gmail.com","chennai",current_date());

-- 2.	Insert 3 new courses into the Courses table.
insert into courses values(200,"java","programming",20000),
(201,"python","programming",10000),
(202,"C++","programming",30000);

-- 3.	A student enrolls in 2 courses — insert into Enrollments.
insert into enrollments values(300,100,200,current_date(),"enrollment"),
(301,100,201,current_date(),"enrollment");

select * from enrollments;

truncate TABLE ENROLLMENTS;

-- 4.	Record a payment for a student in the Payments table.
insert into payments values(400,100,5000,current_date());

-- 5.	Insert multiple rows of students in a single query.
insert into students values(101,"praveen","praveen@gmail.com","erode",current_date()),
(102,"prem","press@gmail.com","ariyalur",current_date());

-- 6.	Update a student’s city from Chennai to Bangalore.
update students set city='bangalore' where city='chennai';

-- 7.	Increase the price of all Programming courses by 10%.
update courses set price=price*0.10+price;

-- 8.	Update enrollment status to Completed for a student who finished a course.
update enrollments set status='completed' where status='enrollment';

-- 9.	Correct a wrongly typed student email.
update students set email="press22@gmail.com" where studentid=100;

-- 10.	Delete a student who requested account removal.
delete from students where name="press";

-- 11.	Delete all enrollments for a specific course.
delete from enrollments where courseid=201;

-- 12.	Truncate the Payments table before re-importing fresh data.
truncate table payments;

-- 13.	Add a new column PhoneNumber to the Students table.
alter table students add column phone_number int;

-- 14.	Drop the Payments table (assume migrating to another system).
drop table payments;

-- 15.	Find the total number of students enrolled in all courses.
select count(*) total_number,courseid from enrollments group by courseid;

-- 16.	Calculate the average price of courses by category.
select avg(price) from courses group by category;

-- 17.	Get the highest payment made by any student.
select max(amount) from payments;

-- 18.	Find students who enrolled in more than 2 courses.
select name from employees where studentid=(
select studentid from enrollments group by studentid having count(*)>2);

-- 19.	List courses that no one has enrolled in (use NOT IN subquery).
select courseid from courses where courseid not in 
(select courseid from enrollments);

-- 20.	Find the student who paid the maximum amount (nested subquery).
select name from students where studentid =(select studentid from payments 
where amount=(select max(amount) from payments));

-- 21.	Write a stored procedure to add a new student (with Name, Email, City).
delimiter $$
create procedure add_student(in name varchar(60),in email varchar(60),in city varchar(60))
begin
declare current_value int;
select studentid into current_value from students order by studentid desc limit 1;
insert into students values(current_value+1,name,email,city,current_date(),0);
end $$
delimiter ;

drop procedure add_student;

call add_student("santhosh",'santhosh@gmail.com','salem');

-- 22.	Write a stored procedure that takes StudentID and returns all courses enrolled by that student.
delimiter $$
create procedure all_course(in student_id int)
begin
select title from courses where courseid in
(select courseid from enrollments where studentid=student_id);
end $$
delimiter ;

drop procedure all_course;

call all_course(100);

-- 23.	Create a trigger on Enrollments that automatically updates Status = 'Active' when a new row is inserted.
delimiter $$
create trigger t5 after insert on enrollments for each row
begin
-- update enrollments set status='active' where studentid=new.studentid;
call proc(new.studentid);
end $$
delimiter ;

delimiter $$
create procedure proc (in emp_id int)
begin
update enrollments set status='active' where studentid=emp_id;
end $$
delimiter ;


drop trigger t5; 

select * from enrollments;

insert into enrollments values (2,100,200,current_date,'enroll');

-- 24.	Create a trigger on Payments that prevents inserting negative amounts.
delimiter $$
create trigger prevent_negative before insert on payments for each row
begin
declare msg varchar(60);
if (new.amount <=0) then
delete from payments where paymentid=new.paymentid;
end if;
end $$ 
delimiter ;

drop trigger prevent_negative ;

show triggers;

truncate table payments;

select * from payments;

insert into payments values ( 403,100,-4400,current_date);

