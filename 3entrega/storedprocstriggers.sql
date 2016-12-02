delimiter //
create trigger overlaped_dates 
before insert on oferta
for each row 
begin
	if exists(select * from oferta where ((new.data_inicio < oferta.data_fim OR new.data_fim < oferta.data_fim) AND new.codigo = oferta.codigo))
	then call nonexistingfunction2(); 
	end if;
end //
delimiter ;


delimiter //
create trigger reserve_payment
before insert on estado
for each row 
begin
	if exists(select * from estado where numero = new.numero group by numero having new.time_stamp < max(time_stamp)) 
	then call nonexistingfunction2();
	end if;
end //
delimiter ;

delimiter //
create trigger insert_payment
before insert on paga
for each row 
begin
	if exists(select * from estado where new.numero = numero and new.data = time_stamp) 
	then call nonexistingfunction2();
	end if;
end //
delimiter ;