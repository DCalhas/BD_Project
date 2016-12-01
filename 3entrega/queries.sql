



/*alinea a)*/
	
select morada, codigo
from espaco
where (morada, codigo) not in (
	select morada, codigo_espaco as codigo
	from posto natural join  aluga 
				natural join estado 
	where estado = 'Aceite')
	and (morada, codigo) in(
	select morada, codigo_espaco as codigo
	from posto);

/*nao e ir pelo aluga, tem que ter o estado aceite*/

/*alinea b) b)
Quais edifícios com 
um número de reservas superior à média?*/


select morada
from aluga
group by morada
having count(morada) > (
	select avg(numero_de_vezes_alugado)
	from (
		select count(morada) as numero_de_vezes_alugado, morada
		from aluga
		group by morada) as bla);


/*alinea c) quais os utilizadores cujos alugaveis foram sempre fiscalizados pelo mesmo fiscal*/


select nif
from user natural join (
	select count(numero_de_vezes_do_mesmo_fiscal) as numero_fiscais, nif
	from (
		select count(nif) as numero_de_vezes_do_mesmo_fiscal, nif
		from fiscaliza natural join arrenda
		group by id, nif) as numero_fiscais_por_user
	group by nif) as numero_fiscais_tabela
where numero_fiscais = 1; 


/*Qual o montante total realizado (pago) por cada espaço durante o ano de 2016?
Assuma que a tarifa indicada na oferta é diária. Deve considerar os casos em que oespaço foi alugado
totalmente ou por postos.*/
/*---------------------------*/










/*---------------------------*/




/*alinea e)Quais os espaços de trabalho cujos postos nele contidos foram todos alugados?
(Poralugado entende-se um posto de trabalho que tenha pelo menos uma oferta aceite,independentement
e das suas datas.)*/

select morada, codigo_espaco as codigo
from (select count(codigo) as numero_de_postos, morada, codigo_espaco 
		from posto 
		group by morada, codigo_espaco) as numero_de_postos_por_espaco
where (numero_de_postos, morada, codigo_espaco) in (
	select count(codigo_posto) as numero_de_postos, morada, codigo as codigo_espaco 
	from espaco natural join (
		select morada, codigo as codigo_posto, codigo_espaco as codigo 
		from posto natural join aluga 
					natural join estado 
		where estado = 'Aceite') as postos_que_foram_alugados
	group by morada, codigo);
