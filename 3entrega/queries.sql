



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
		group by morada) as edificios_alugados_counter);


/*alinea c) quais os utilizadores cujos alugaveis foram sempre fiscalizados pelo mesmo fiscal*/


select nif, nome, telefone
from user natural join (
	select count(numero_de_vezes_do_mesmo_fiscal) as numero_fiscais, nif
	from (
		select count(id) as numero_de_vezes_do_mesmo_fiscal, nif
		from fiscaliza natural join arrenda
		group by id, nif) as numero_fiscais_por_user
	group by nif) as numero_fiscais_tabela
where numero_fiscais = 1; 


/*Qual o montante total realizado (pago) por cada espaço durante o ano de 2016?
Assuma que a tarifa indicada na oferta é diária. Deve considerar os casos em que oespaço foi alugado
totalmente ou por postos.*/
/*---------------------------*/

select sum(montante_total), morada, codigo
from (select *
	from ((select *
	from (
	(select sum(montante_pago_posto) as montante_total, morada, codigo_espaco as codigo
	from (
		select tarifa * timestampdiff(day, data_inicio, data_fim) as montante_pago_posto, morada, codigo, codigo_espaco 
		from aluga natural join oferta 
					natural join posto 
		group by morada, codigo, codigo_espaco) as montante_postos)
	union
	(select tarifa * timestampdiff(day, data_inicio, data_fim) as montante_total, morada, codigo 
	from aluga natural join espaco
				natural join (
					select distinct morada, codigo, data_fim, tarifa
					from oferta) as oferta_personalized
	group by morada, codigo)) as espacos_e_postos)
	union
	(select 0 as montante_total, morada, codigo
	from espaco)) as principal_table) as final_table
group by morada, codigo;






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
