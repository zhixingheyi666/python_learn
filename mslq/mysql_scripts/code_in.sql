use fortest;

select * from fmate_code;
select hashid, count(hashid) from fmate_code where namepath regexp 'init' group by hashid;
select * from fmate_code where hashid in (309,54) order by hashid;
select namepath,hashid from fmate_code where hashid = 279;

select * from hash_code;
select strhash,hashid from hash_code where hashid = 279;

select * from fline_code where hashid = 30;
select flid from fline_code where hashid = 255 order by flid;

select last_insert_id() into @lst;
select @lst;

#查找、删除由于算法或其他未知错误导致的垃圾数据，如，hash值并无对应的文件行（line）
select * from fmate_code 
	where hashid in( select hashid from hash_code 
						where hashid not in ( select hashid from fline_code ));
                        
delete from fline_code 
	where hashid in (select hashid 
						from hash_code 
						where hashid not in (select hashid from fmate_code));
                        
delete from fmate_code 
	where hashid in( select hashid from hash_code 
						where hashid not in ( select hashid from fline_code ));





select count(namepath) as num,hashid from fmate_code group by hashid order by num desc;
select namepath from fmate_code where hashid=66 limit 1 into @ttdel;
select namepath,hashid from fmate_code where namepath regexp 'codetest';
select line from fline_code where line regexp '__name__';
select l.line, m.namepath from fline_code l, fmate_code m where line regexp 'executemany' and l.hashid = m.hashid;
select hashid, strhash from hash_code where strhash regexp'fd267a';
select * from fline_code where line regexp 'FileDel';
select line, count(line) from fline_code where hashid = 274 group by line order by count(line) desc;
select count(line) from fline_code 
	where hashid in (select hashid 
						from hash_code 
						where hashid  in (select hashid from fmate_code where namepath regexp 'codetsql'));
select * 
	from fmate_code 
	where hashid in (
			select hashid 
			from fline_code 
			where line regexp 'os.walk');
            
            
use fortest;
show tables;
set sql_safe_updates = 1;
show variables like 'sql_safe%';


create table fmate_code(
			fid int(11) unsigned not null auto_increment,
            namepath varchar(256) not null unique,
            /*设想namepath用来唯一区别文件，考虑有可能的长文件
				就预想设为text，可是text也仅支持在固定前N个字节上建立索引
                这就无法保证唯一性。目前暂时用varchar格式，这样路径不能特别长
                能否实现路径分段存储呢？两个列值组成一个路径*/
            hashid int null,
            fmtime datetime,
            fctime datetime,
            weighted tinyint unsigned default 1,
            primary key(fid) ) engine = innodb  default charset = 'utf8';
            
delete from hash_code 
	where hashid in( select hashid from hash_code 
						where hashid not in ( select hashid from fline_code ));


create table hash_code(
			hashid int(11) unsigned not null auto_increment,
            strhash varchar(66) not null unique,
            primary key(hashid) ) engine = innodb default charset = 'utf8';


create table fline_code(
			lid int(11) unsigned not null auto_increment,
            line text not null,
            hashid int(11) unsigned not null ,
            fstatus bool default 1,
            weighted tinyint default 1,
            ntimestamp timestamp,
            ctimestamp timestamp,
            flid int(11) unsigned not null,
            primary key(lid)
            ) engine = innodb default charset = 'utf8';
            
        
drop table hash_code;

drop table fmate_code;

drop table fline_code;

truncate table hash_code;

truncate table fmate_code;

truncate table fline_code;


