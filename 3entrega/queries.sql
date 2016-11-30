



/*alinea a)*/

select morada, codigo
from espaco
where (morada, codigo) not in (
	select morada, codigo_espaco as codigo
	from posto natural join  aluga 
				natural join estado 
	where estado = 'Aceite')
	and (morada, codigo) not in(
	select morada, codigo
	from estado natural join  aluga  
				natural join espaco
	where estado = 'Aceite');

/*nao e ir pelo aluga, tem que ter o estado aceite*/

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
from user natural join (
	select count(numero_de_vezes_do_mesmo_fiscal) as numero_fiscais, nif
	from (
		select count(nif) as numero_de_vezes_do_mesmo_fiscal, nif
		from fiscaliza natural join arrenda
		group by id, nif) as numero_fiscais_por_user
	group by nif) as numero_fiscais_tabela
where numero_fiscais = 1; 

/*
select sum(tarifa) * 365 as total_realizado, morada, codigo
from ((select morada, codigo, tarifa
	from espaco natural join aluga
				natural join estado
				natural join oferta
	group by morada codigo
	where estado = 'Pago' and timestamp like '%2016')
	union
	(select morada, codigo_espaco as codigo, tarifa
	from posto natural join aluga
				natural join estado
				natural join oferta
	group by morada, codigo
	where estado = 'Pago' and timestamp like '%2016')) as bla
group by morada, codigo;*/





/*alinea e)Quais os espaços de trabalho cujos postos nele contidos foram todos alugados?
(Poralugado entende-se um posto de trabalho que tenha pelo menos uma oferta aceite,independentement
e das suas datas.)*/

select morada, codigo_espaco as codigo
from (select count(codigo) as numero_de_postos, morada, codigo_espaco 
		from posto 
		group by morada, codigo_espaco) as numero_de_postos_por_espaco
where (numero_de_postos, morada, codigo_espaco) in (
	select count(codigo) as numero_de_postos, morada, codigo as codigo_espaco 
	from espaco natural join (
		select morada, codigo as codigo_posto, codigo_espaco as codigo 
		from posto natural join aluga 
					natural join estado 
		where estado = 'Aceite') as postos_que_foram_alugados
	group by morada, codigo);
