select * from originurl;
use fortest;

select  uid, url,length(url) as tl from bookmurl order by tl desc;
select *, count(urll) from bookmurl group by urll;
select distinct utext, url, mdftm from  bookmurl where url regexp 'lili' order by mdftm desc;
select count(distinct url) , count(url) from  bookmurl into @abUrl, @Url;
select @abUrl - @Url;
select distinct urll from  bookmurl;
select count(distinct url) from  bookmurl;


create table bookmurl(
	uid  int(11) unsigned auto_increment,
    url varchar(255) not null,
    urll text,
    utext text,
    tags varchar(255),
    addtm datetime,
    mdftm datetime,
    primary key(uid)
    ) engine = innodb, default charset = 'utf8';
create table bookmurl(
	uid  int(11) unsigned auto_increment,
    url varchar(255) not null,
    urll text,
    utext text,
    exmsg text,
    tags varchar(255),
    addtm timestamp,
    mdftm datetime,
    primary key(uid)
    ) engine = innodb, default charset = 'utf8';
    
drop table bookmurl;
	