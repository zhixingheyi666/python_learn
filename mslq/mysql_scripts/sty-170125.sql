select concat( rtrim( vend_name )    , '  (',  rtrim(     vend_country ), ')'  ) as  vend_title
	from vendors
    order by vend_name;
select cust_name, cust_contact
	from customers as c, orders as o, orderitems as oi
    where c.cust_id = o.cust_id
		and o.order_num = oi.order_num
        and prod_id = 'TNT2';
select prod_id, prod_name, vend_id as vi
	from products
    where vend_id  = ( select vend_id
						from products
						where prod_id = 'DTNTR' );
select p1.prod_id, p1.prod_name
	from products as p1, products as p2
	where p1.vend_id = p2.vend_id
		and p2.prod_id = 'DTNTR';
select c.*, o.order_num, o.order_date, oi.prod_id, oi.quantity, oi.item_price 
	from customers as c, orders as o, orderitems as oi
    where c.cust_id = o.cust_id
		and oi.order_num = o.order_num
        and prod_id = 'FB';
select c.cust_id, oi.order_num, oi.prod_id
	from customers as c, orderitems as oi, orders as o
    where c.cust_id = o.cust_id
		and c.cust_id = 10001
        and o.order_num = oi.order_num;
select customers.cust_id, orders.order_num
	from customers inner join orders
		on customers.cust_id = orders.cust_id;
select c.cust_id, o.order_num
	from customers as c right outer join orders as o 
    on c.cust_id = o.cust_id;
select c.cust_id, c.cust_name,
		count( o.order_num ) as num_ord
	from customers as c left outer join orders as o
     on c.cust_id = o.cust_id
	group by c.cust_id;
select * 
	from products
    where prod_price <= 5 or vend_id in (1001,1002)
    order by prod_price;
select vend_id, prod_id, prod_price
	from products
    where prod_price <= 5
union
select  prod_id, vend_id, prod_price
	from products
    where vend_id in (1001, 1002)
order by prod_id;

    