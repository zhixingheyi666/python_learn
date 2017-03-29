show databases;
show tables;
select prod_name 
from products
where prod_name regexp '100';
select prod_name 
from products
where prod_name regexp  '[1-5] ton'
order by prod_name;
select vend_name
from vendors
where vend_name regexp '\\.'
order by vend_name;
select prod_name 
from products
where prod_name regexp '\\([0-9] sticks?\\)';
select prod_name
from products
where prod_name regexp '^[0-9\\.]'
order by prod_name;
select 'hello' regexp '[0-9ol]';
select * 
from vendors;
select vend_id as id, concat(rtrim(vend_name), '----->(', rtrim(vend_country), ')')
as vend_title
from vendors 
order by vend_name;
select 	prod_id, 
		quantity, 
		item_price,
        quantity * item_price as expand_price
from orderitems
where order_num = 20005;
select now();
select trim('   a b ccc   ');