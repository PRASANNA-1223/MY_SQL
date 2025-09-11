use practice;


select * from employee where salary>(select avg(salary) from employee);

drop table employee;

select * from employees;

CREATE TABLE employees (
emp_id INT ,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(20),
hire_date DATE,
job_id VARCHAR(20),
salary DECIMAL(10,2),
department_id int);

DELIMITER //

CREATE PROCEDURE generate_employees()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 107 DO
    INSERT INTO employees (
        emp_id, first_name, last_name, email, phone, hire_date, job_id, salary, department_id
    ) VALUES (
        i,
        CONCAT('FirstName', i),
        CONCAT('LastName', i),
        CONCAT('employee', i, '@example.com'),
        CONCAT('9876500', LPAD(i, 3, '0')),
        DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 2000) DAY),
        ELT(1 + (i MOD 5), 'DEV', 'HR', 'MGR', 'SALES', 'FIN'),
        FLOOR(30000 + (RAND() * 50000)),
        100 + (i MOD 5)
    );
    SET i = i + 1;
  END WHILE;
END //

DELIMITER ;

-- Run procedure
CALL generate_employees();


select * from employees where salary>(select avg(salary) from employees);

select salary from employees order by salary desc;

select avg(salary),department_ID from employees group by department_id HAVING AVG(SALARY)>56000;

DROP TABLE EMPLOYEES;

CREATE TABLE EMPLOYEES (
EMPID int,
name varchar(50),
salary int,
department_id int);

drop table employees;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location_id INT
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert into departments
INSERT INTO departments (department_id, department_name, location_id) VALUES
(10, 'HR', 1700),
(20, 'Sales', 1700),
(30, 'IT', 1800);

-- Insert into employees
INSERT INTO employees (emp_id, name, salary, department_id) VALUES
(101, 'John', 50000, 10),
(102, 'Alice', 60000, 20),
(103, 'Bob', 45000, 30),
(104, 'Emma', 70000, 20),
(105, 'David', 55000, 10);

truncate table employees;

select * from employees;

select * from employees where department_id in(
select department_id from departments 
where location_id=1700 and
employees.department_id=departments.department_id);

select * from employees where department_id in (select department_id from departments where location_id =1700);

;


select name from employees where department_id in
(select department_id from departments where location_id=1700);


