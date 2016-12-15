insert into local_dimensao (local_id, posto_codigo, espaco_codigo, edificio_morada)
select concat(morada, codigo) as local_id,
	null as posto_codigo,
	codigo as espaco_codigo,
	morada as edificio_morada
from espaco;


insert into local_dimensao (local_id, posto_codigo, espaco_codigo, edificio_morada)
select concat(morada, codigo) as local_id,
	codigo as posto_codigo,
	codigo_espaco as espaco_codigo,
	morada as edificio_morada
from posto;

insert into user_dimensao (nif, nome, telefone)
select nif, nome, telefone
from user;


delimiter //
CREATE PROCEDURE load_time_dim()
BEGIN
   DECLARE v_full_time TIME;
   SET v_full_time = '00:00';
   WHILE v_full_time <= '23:59' DO
       INSERT INTO tempo_dimensao VALUES (
           hour(v_full_time) * 100 + minute(v_full_time),
           hour(v_full_time),
           minute(v_full_time)
       );
       SET v_full_time = DATE_ADD(v_full_time, INTERVAL 1 MINUTE);
   END WHILE;
END;
//
delimiter ;
call load_time_dim();


delimiter //
CREATE PROCEDURE load_date_dim()
BEGIN
   DECLARE v_full_date DATETIME;
   DECLARE semester int(1);
   SET v_full_date = '2016-01-01 00:00:00';
   WHILE v_full_date < '2017-01-01 00:00:00' DO
       IF month(v_full_date) > 6 
        THEN SET semester = 2; 
        ELSE SET semester = 1;
       END IF;
       INSERT INTO data_dimensao
       VALUES (
           year(v_full_date) * 10000 + month(v_full_date)*100 + day(v_full_date),
           day(v_full_date),
           week(v_full_date),
           month(v_full_date),
           semester,
           year(v_full_date)
       );
       SET v_full_date = DATE_ADD(v_full_date, INTERVAL 1 DAY);
   END WHILE;
END;
//
delimiter ;
call load_date_dim();


insert into reserva_factos (numero, user_id, local_id, tempo_id, data_id, montante_pago, duracao)
select numero as numero,
	nif as user_id,
	concat(morada, codigo) as local_id,
	hour(data) * 100 + minute(data) as tempo_id,
	year(data) * 10000 + month(data) * 100 + day(data) as data_id,
	tarifa * timestampdiff(day, data_inicio, data_fim) as montante_pago, 
	timestampdiff(day, data_inicio, data_fim) as duracao
from oferta natural join aluga natural join paga;