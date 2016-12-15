/*Cube*/

select dia_do_ano as dia, mes_do_ano as mes, posto_codigo as posto, espaco_codigo as espaco, avg(montante_total) as media 
from reserva_factos natural join data_dimensao natural join local_dimensao
group by dia_do_ano, mes_do_ano, posto_codigo, espaco_codigo with rollup 
union
select dia_do_ano as dia, mes_do_ano as mes, posto_codigo as posto, espaco_codigo as espaco, avg(montante_total) as media 
from reserva_factos natural join data_dimensao natural join local_dimensao
group by  mes_do_ano, posto_codigo,espaco_codigo, dia_do_ano with rollup
union
select dia_do_ano as dia, mes_do_ano as mes, posto_codigo as posto, espaco_codigo as espaco, avg(montante_total) as media
from reserva_factos natural join data_dimensao natural join local_dimensao
group by  posto_codigo, dia_do_ano, espaco_codigo, mes_do_ano with rollup 
union
select dia_do_ano as dia, mes_do_ano as mes, posto_codigo as posto, espaco_codigo as espaco, avg(montante_total) as media 
from reserva_factos natural join data_dimensao natural join local_dimensao
group by  espaco_codigo, dia_do_ano, mes_do_ano, posto_codigo with rollup;
