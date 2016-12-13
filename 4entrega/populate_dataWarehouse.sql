insert into local_dimensao (local_id, posto_codigo, espaco_codigo, edificio_morada)
select concat(morada, codigo) as local_id,
	null as posto_codigo,
	codigo as espaco_codigo,
	morada as edificio_morada,
from espaço;


insert into local_dimensao (local_id, posto_codigo, espaco_codigo, edificio_morada)
select concat(morada, codigo_espaco, codigo) as local_id,
	codigo as posto_codigo,
	codigo_espaco as espaco_codigo,
	morada as edificio_morada,
from posto;

insert into user_dimensao (nif, nome, telefone)
select nif, nome, telefone
from user;


insert into reserva_factos (numero, montante_pago, duracao)
select numero, 
	tarifa * timestampdiff(day, data_inicio, data_fim) as montante_pago, 
	timestampdiff(day, data_inicio, data_fim) as duracao_reserva,
from oferta natural join aluga;