use practice;

create table shop1(productname varchar(40), price decimal(10,2));

create table shop2(productname varchar(40), price decimal(10,2));

create table shop3(productname varchar(40), price decimal(10,2));

insert into shop1 values("tomato",50.50,1),("onion",60.20,2),("ginger",20.50,2);

insert into shop2 values("onion",40,1),("brinjal",30,1),("potato",50,2);

insert into shop3 values("onion",60,2),("beetroot",40,1),("rice",500,3);

alter table shop1 add column quantity int;

alter table shop2 add column quantity int;

alter table shop3 add column quantity int;

select * from shop1 s1 left join shop2 s2 on s1.productname=s2.productname;

select s1.price+s2.price+s3.price sell_amount from shop1 s1,shop2 s2,shop3 s3 where s1.productname=s2.productname and s1.productname=s3.productname;

select * from shop1 s1 left join shop2 s2 
on s1.productname=s2.productname 
left join shop3 s3 on s2.productname = s3.productname;

select s1.productname ,s2.productname,s3.productname from shop1 s1 left join shop2 s2 
on s1.productname=s2.productname 
left join shop3 s3 on s2.productname = s3.productname;

select s1.productname ,s2.productname,s3.productname from shop1 s1 right join shop2 s2 
on s1.productname=s2.productname 
right join shop3 s3 on s2.productname = s3.productname;

select * from shop1 union all  select * from shop2 union all select * from shop3;

select * from shop1;

select * from shop2;

select * from shop3;