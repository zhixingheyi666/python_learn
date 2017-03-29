insert into customers
	values( null,
		'Pep E. Pew',
        '100 Main Street',
        'Los Angeles',
        'CA',
        '90046',
        'USA',
        null,
        null);
select * 
	from customers;
insert into customers(
				cust_name,
                cust_address,
                cust_city,
                cust_state,
                cust_zip,
                cust_country )
			values(
				'M. Martian',
                '42 Galaxy Way',
                'New York',
                'NY',
                '11213',
                'USA' ),
                (
				'Pep E. Pew',
				'100 Main Street',
				'Los Angeles',
				'CA',
				'90046',
				'USA' );
select *
	from again_sql_learn.customers;
select count(*)
	from `sql-learn`.customers;
select count(*)
	from tsg_import_study01.bookclass;
select count(*)
	from bookclass;
insert into tsg_import_study01.bookclass(
									bcid,
                                    bid,
                                    state,
                                    clerk,
                                    enterdate,
                                    price,
                                    sk,
                                    inform,
                                    ddid )
					select bcid,
							bid,
                            state,
							clerk,
							enterdate,
							price,
							sk,
							inform,
							ddid 
                            from `sql-learn`.bookclass;
							
                