delimiter //
create trigger overlaped_dates 
before insert on Oferta
for each row 
begin
	if exists(select * from Oferta where (new.data_inicio < Oferta.data_fim OR new.data_fim < Oferta.data_fim)
	THEN signal SQLSTATE '45000'; /*BUT WHYYY*/
	end if;
end //
delimiter ;