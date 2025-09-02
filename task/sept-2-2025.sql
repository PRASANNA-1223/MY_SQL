use practice;

delimiter $$
create function avg_mark(mark1 int,mark2 int,mark3 int,mark4 int,mark5 int)
returns int
deterministic
begin
declare total int;
set total=(mark1+mark2+mark3+mark4+mark5)/5;
 return total;
end $$
delimiter ;

drop function avg_mark;

select avg_mark(1,2,3,4,5);