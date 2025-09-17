create database javadb;

drop database java;

use javadb;

create table ToDoList(
task varchar(60),
status varchar(60) default "incomplete",
add_date timestamp default current_timestamp
);

select * from todolist;

truncate table todolist;



show tables;

show databases;

show procedure status;

create table result(
description varchar(30),
result varchar(30));

select * from result;

delete from result where result="answer8";

truncate table result;

alter table result modify column    result varchar(100);



