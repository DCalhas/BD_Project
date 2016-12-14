/*Cube*/

select dia, mes, posto, espaco, avg(montante_total) 
from reserva_factos natural join data_dimensao natural join local_dimensao
group by dia, mes, posto, espaco with rollup 
union
select dia, mes, posto, espaco, avg(montante_total) 
from reserva_factos natural join data_dimensao natural join local_dimensao
group by dia, mes, posto, espaco with rollup
union
select data_id, local_id, avg(montante_total) 
from reserva_factos natural join data_dimensao natural join local_dimensao
group by   with rollup 
union
select data_id, local_id, avg(montante_total) 
from reserva_factos natural join data_dimensao natural join local_dimensao
group by   with rollup 
