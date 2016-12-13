delimiter //

drop procedure if exists populate_time;
create procedure populate_time()
begin
	declare full_date datetime;
	set data_fim '2016-10-12 00:00:00';
	set data_inicio '2016-10-11 00:00:00';
	while data_inicio < data_fim
	do 
		insert into data_dimensao