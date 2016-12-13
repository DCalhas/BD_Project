

select data_id, local_id, avg(montante_total) 
from reserva_factos natural join data_dimensao natural join local_dimensao
group by data_id, local_id with rollup 
union
select data_id, local_id, avg(montante_total) 
from reserva_factos natural join data_dimensao natural join local_dimensao
group by data_id with rollup
union
select data_id, local_id, avg(montante_total) 
from reserva_factos natural join data_dimensao natural join local_dimensao
group by  local_id with rollup 
/*GROUP BY MAL*/