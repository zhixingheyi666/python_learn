drop  procedure if exists proorders;
delimiter //
create procedure proorders()
begin
	declare o int;
    declare done boolean default 0;
    declare t decimal(8,2);
	declare ordernumbers  cursor
    for
	select order_num
		from orders;
	declare continue handler for sqlstate '02000' set done = 1;
    create table if not exists ordertotals(
		order_num int not null,
        total decimal(8,2) );
	open ordernumbers;
    repeat
		fetch ordernumbers into o;
		call ordertotal( o, t);
		insert into ordertotals( order_num, total)
		values( o, t);
	until done end repeat;
--    fetch ordernumbers into o;
    close ordernumbers;
--    select o into ot;
end //
delimiter ;
call proorders();
select * from ordertotals;
drop table if exists ordertotals;
select * from orders where order_num = 20008;
show procedure code ordertotal;
select order_num from orders;
