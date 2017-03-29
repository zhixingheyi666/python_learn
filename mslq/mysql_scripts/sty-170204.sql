select order_num, count(order_item)
	from orderitems
    group by order_num
    order by order_num;
alter table vendors
	add vend_phone char(20);
select * 
	from vendors;
alter table vendors
	drop column vend_phone;
CREATE TABLE `customers2` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` char(50) NOT NULL,
  `cust_address` char(50) DEFAULT NULL,
  `cust_city` char(50) DEFAULT NULL,
  `cust_state` char(5) DEFAULT NULL,
  `cust_zip` char(10) DEFAULT NULL,
  `cust_country` char(50) DEFAULT NULL,
  `cust_contact` char(50) DEFAULT NULL,
  `cust_email` char(255) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8;

rename table 
		customer_bak to test_c,
        vend_bak to test_v,
        product_bak to test_b;
show tables like'test%';
select *
	from customers2;

drop table customers2;