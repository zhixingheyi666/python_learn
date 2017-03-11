use fortest;
create table acode(
			cid int(11) not null auto_increment,
            namepath text not null,
            fhash tinyblob null,
            fline text null,
            weighted tinyint,
            primary key(cid) ) engine = innoDB default charset = 'utf8';
show tables;
select * from acode;
drop table fmate_code;
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
drop table hash_code;
truncate table hash_code;
truncate table fmate_code;
insert into fmate_code( namepath, hashid ) values( 'd:/python/learn/testsx.xt', @lst);
select * from fmate_code;
select * from hash_code;
select count(*) from fline_code;
create table hash_code(
			hashid int(11) unsigned not null auto_increment,
            strhash varchar(66) not null unique,
            primary key(hashid) ) engine = innodb default charset = 'utf8';
insert into hash_code( strhash ) value( 'mmmmt' );
select * from hash_code;
select last_insert_id() into @lst;
select @lst;
drop table fline_code;
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
select * from fmate_code;