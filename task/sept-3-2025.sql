use practice;

delimiter $$
create function total_amount(original_price int ,discount_percent decimal (10,3))
returns decimal(10,4)
deterministic
begin
declare discount_amount int;
declare amount int;
set discount_amount=(original_price*discount_percent)/100;
set amount=(original_price-discount_amount);
return amount;
end $$
delimiter ;

select total_amount(100,10);

select * from employee order by salary desc;

select * from employee order by salary,department;

