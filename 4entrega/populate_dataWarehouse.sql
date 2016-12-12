insert into reserva_factos (duracao)
select timestampdiff(day, data_inicio, data_fim) as duracao_reserva
from oferta natural join aluga natural join reserva;

insert into reserva_factos (montante_pago)
select tarifa * timestampdiff(day, data_inicio, data_fim) as montante_pago
from oferta natural join aluga natural join reserva;