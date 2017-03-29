select * 
	from customers
    where cust_id = 10006;
update customers
	set cust_email = 'elmer@fudd.com'
    where cust_id = 10005;
update customers
	set cust_email = 'elmer@fudd.com',
		cust_name = 'The Fudds'
    where cust_id = 10005;
update customers
	set cust_email = null
    where cust_id = 10005;
delete from customers
	where cust_id = 10006;