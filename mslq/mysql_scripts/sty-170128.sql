show tableproductnotess;
select * 
	from productnotes;
drop table productnotes;
create table productnotes
(
	note_id 	int 	not null	auto_increment,
    prod_id		char(10)	not null,
    note_date	datetime	not null,
	note_text	text		null,
    primary key(note_id),
    fulltext(note_text)
)	engine = myisam;
select  note_text, match(note_text) against('rabbit') as rank
	from productnotes;
select note_text
	from productnotes
    where match(note_text) against('anvils' with query expansion);