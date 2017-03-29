select cust_name, cust_contact
	from customers, orders, orderitems
    where customers.cust_id = orders.cust_id
		and orders.order_num = orderitems.order_num
        and prod_id = 'TNT2';
select cust_name as cn, cust_contact as cc
	from productcustomers
    where prod_id = 'TNT2';
create or replace view productcustomers as
	select cust_name, cust_contact, prod_id
		from customers as c, orders as o, orderitems as oi
        where c.cust_id = o.cust_id
			and o.order_num = oi.order_num;
select * from productcustomers;
create or replace view vendorlocation as 
	select concat( rtrim( vend_name ), ' (',rtrim(vend_country), ')' ) as vendtitle
		from vendors
		order by vend_country;
select * 
	from vendorlocation;
create view custemail as
	select cust_id, cust_name, cust_email as e
		from customers
        where cust_email is not null;
create view cust_noemail as
	select cust_id, cust_name, cust_email as e
		from customers
        where cust_email is null;
select * 
	from cust_noemail;
create view order_expand as
	select order_num, 
			prod_id, 
            quantity, 
            item_price,
			quantity * item_price as expand_price
		from orderitems;
select  *
	from order_expand
	where order_num = 20006;