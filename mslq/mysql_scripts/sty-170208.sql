create procedure prodprice()
	select prod_price from products;
select * from products;
show procedure status;
delimiter //
create procedure prodprice(
	out pl decimal(8,2),
    out ph decimal(8.2),
    out pa decimal(8.2)
    )
begin
	select avg(prod_price) into pa
		from products;
	select max(prod_price) into ph
		from products;
	select min(prod_price) into pl
		from products;
end //
delimiter ;
drop procedure prodprice;
show create procedure prodprice;
call prodprice();
 

	