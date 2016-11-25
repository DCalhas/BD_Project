



/*alinea a)*/

select morada, codigo
from espaco
where codigo not in (
	select codigo_espaco as codigo
	from posto natural join aluga);

/*alinea b) b)
Quais edifícios com 
um número de reservas superior à média?*/


select morada
from aluga
group by morada
having count(morada) > (
	select avg(counter)
	from (
		select count(morada) as counter, morada
		from aluga
		group by morada) as bla);


select nif
from User natural join (
	select count(numero_de_vezes_do_mesmo_fiscal) as numero_fiscais, nif
	from (
		select count(nif) as numero_de_vezes_do_mesmo_fiscal, nif
		from Fiscaliza natural join Arrenda
		group by id, nif) as numero_fiscais_por_user
	group by nif) as numero_fiscais_tabela
where numero_fiscais = 1; 