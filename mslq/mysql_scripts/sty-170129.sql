select note_text
	from	productnotes
    where match(note_text) against('heavy -rope*' in boolean mode);
select note_text
	from productnotes
    where match(note_text) against('+rabbit -bait' in boolean mode);
select note_text
	from productnotes
    where match(note_text) against('"rabbit bait"' in boolean mode);
select note_text
	from productnotes
    where match(note_text) against('rabbit gfd bait' in boolean mode);
select note_text
	from productnotes
    where match(note_text) against('>rabbit  <returns' in boolean mode);
select note_text
	from productnotes
    where match(note_text) against('+safe  +(<combination)' in boolean mode);