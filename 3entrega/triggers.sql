delimiter //
create trigger overlaped_dates 
before insert on oferta
for each row 
begin
	if exists(select * from oferta where ((new.data_inicio < oferta.data_fim OR new.data_fim < oferta.data_fim) AND new.codigo = oferta.codigo)
	THEN signal SQLSTATE '45000'; /*BUT WHYYY*/
	end if;
end //
delimiter ;