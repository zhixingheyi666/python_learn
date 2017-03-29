use spider;
select line as l 
	from tips as t
		where t.line regexp '自己建立';
select *
	from tips;
select * 
	from tips;
select * 
	from test 
		where ttext regexp '\\\\\\'
			order by mark;
insert into test( ttext, mark ) values( '\\', 's2.0' );
insert into test( ttext, mark ) values( '\\\M', 's3.M' );
delete from test
	where tid = 24;
select * 
	from test 
		where tid > 30
			order by mark;