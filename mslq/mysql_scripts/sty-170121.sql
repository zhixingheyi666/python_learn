select *
from vendors;
select *
from products;
select vend_name, prod_name, prod_price, products.vend_id, vendors.vend_id
	from vendors, products
    order by vend_name desc, prod_name;
    #where vendors.vend_id = products.vend_id
    #order by prod_price, vend_name desc; #prod_name;
select vend_name, prod_name, prod_price
	from vendors Inner join products
    on vendors.vend_id = products.vend_id;
select order_num, prod_name, vend_name, prod_price, quantity,
			prod_price * quantity as total
	from orderitems, products, vendors
    where order_num = 20005
			and orderitems.prod_id = products.prod_id
            and products.vend_id = vendors.vend_id;
select * from orders;
select * from orderitems;
select * from products;
select  cust_name, cust_contact#, prod_name
	from customers, orders, orderitems, products
	where	products.prod_name regexp '[0-9]' 
		and orderitems.prod_id = products.prod_id
		and customers.cust_id = orders.cust_id
		and orders.order_num = orderitems.order_num;
