



/*alinea a)*/

select morada, codigo
from Espaco
where codigo not in (
	select codigo_espaco as codigo
	from Posto natural join Aluga);

/*alinea b) b)
Quais edifícios com 
um número de reservas superior à média?*/


select morada
from Aluga
group by morada
having count(morada) > (
	select avg(counter)
	from (
		select count(morada) as counter, morada
		from Aluga
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


select sum(tarifa) * 365 as total_realizado, morada, codigo
from ((select morada, codigo, tarifa
	from Espaco natural join Aluga
				natural join Estado
				natural join Oferta
	group by morada codigo
	where estado = 'Pago' and timestamp like '%2016')
	union
	(select morada, codigo_espaco as codigo, tarifa
	from Posto natural join Aluga
				natural join Estado
				natural join Oferta
	group by morada, codigo
	where estado = 'Pago' and timestamp like '%2016')) as bla
group by morada, codigo;
