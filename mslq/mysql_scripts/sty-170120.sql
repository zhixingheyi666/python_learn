select vend_id, count(*) as num_prods
from products
group by vend_id with rollup;
select *
from lendwork
limit 10;
select bcid, lenddate, count(*) as num_lending
from lendwork 	
group by month(lenddate) with rollup;
select bcid, title
from bookclass
where bcid in(
	select bcid, lenddate, count(*) as num_lending
	from lendwork 	
	group by bcid 
	having count(*) > 90
    )
;
select lenddate, bcid,  count(*) as num_lending
	from lendwork 	
	group by year(lenddate), bcid 
	#having count(*) > 90
    ;
select *
	from reader
;
select cust_name, cust_contact
	from customers
    where cust_id in ( select cust_id
							from orders
							where order_num in ( select order_num
													from orderitems
													where prod_id = 'tnt2' ));
select order_num, sum( quantity * item_price ) as ordertotal
	from orderitems
    group by order_num
    #having sum( quantity * item_price ) >= 50
    having ordertotal  >= 50
    order by ordertotal;
select * 
	from orderitems;
select cust_name,
		cust_state,
        ( select count( * ) 
			from orders
            where orders.cust_id = customers.cust_id ) as orders
		from customers
        order by cust_name;