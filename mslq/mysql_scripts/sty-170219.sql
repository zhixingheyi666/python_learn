	create table tips(
		t_id int(11) not null auto_increment,
        line text null,
        t datetime null,
        primary key(t_id)
        ) engine = InnoDB default charset = 'utf8' auto_increment = 2;
insert into tips( line ) values( 'sfddfs');
select * from tips;
drop table tips;
select ';\;' ;
select char(59),';\;';
select concat( 123, char(59),456);
select ';' as aa;
use spider;
select * 
	from tips
    where line regexp '\\\t\\\t';
select * 
	from tips
    where line regexp '\\';
insert into test( ttext) values( 'zai chengxu zhong zhixing de yuju, ruguo han you chengxu de teshu zifu, 
xuyao xian manzu chengxu de zhuanyi xuyao');
select '1\n2';