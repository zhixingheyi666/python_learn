select *
from lendwork;
select avg( distinct price) AS avg_price
from bookclass;# where bcid like 'G%';
select avg( price) AS avg_price
from bookclass;# where bcid like 'G%';
select avg(prod_price)
from products
where vend_id = 1003 ;
select count(*) as cust_num
from customers;
show columns from booklist;
select *
from booklist;
select sum( Number*price) as total
from booklist
where bcid like 'B%';
select title, bcid, sum(price), EnterDate
from booklist 
where bcid in (
select bcid 
from bookclass
where price > 10.50)
order by price;
select  *
from bookclass
where price > 100.00;
select sum(quantity) as items_ordered
from orderitems 
where order_num = 20005;
select count( distinct bcid )
from catbooklist;
select count( bcid )
from catbooklist;
select count(*) As num_items,
		min( prod_price ) as min_price,
        max( prod_price ) as max_price,
        avg( prod_price ) as avg_price
from products;
select count(*) As num_items,
		min( price ) as min_price,
        max( price ) as max_price,
        avg( price ) as avg_price
from booklist;