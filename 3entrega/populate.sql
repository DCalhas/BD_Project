insert into User values (123456789, 'David', 911709934);
insert into User values (123456788, 'Ze', 967512334);
insert into User values (123456787, 'Cris', 911239911);
insert into User values (123456786, 'Francisco', 910287720); 

insert into Fiscal values('ist180980', 'Tecnico');
insert into Fiscal values('ist181729', 'Tecnico');
insert into Fiscal values('ist181505', 'Tecnico');

insert into Edificio values('Avenida da Republica');
insert into Edificio values('Avenida Rovisco Pais');
insert into Edificio values('Avenida Fontes Pereira de Melo');

insert into Alugavel values('Avenida da Republica', '1', 'adsasdsa');
insert into Alugavel values('Avenida da Republica', '11', 'adsasd');
insert into Alugavel values('Avenida da Republica', '12', 'adsasds');
insert into Alugavel values('Avenida da Republica', '2', 'vacasasac');
insert into Alugavel values('Avenida da Republica', '21', 'vacasas');
insert into Alugavel values('Avenida da Republica', '22', 'vacasasa');
insert into Alugavel values('Avenida Rovisco Pais', '3', 'ascasca');
insert into Alugavel values('Avenida Rovisco Pais', '31', 'ascas');
insert into Alugavel values('Avenida Rovisco Pais', '32', 'ascasc');
insert into Alugavel values('Avenida Rovisco Pais', '4', 'wqofnqofq');
insert into Alugavel values('Avenida Rovisco Pais', '41', 'wqofnqo');
insert into Alugavel values('Avenida Rovisco Pais', '42', 'wqofnqof');
insert into Alugavel values('Avenida Fontes Pereira de Melo', '5', 'acqwwqw');
insert into Alugavel values('Avenida Fontes Pereira de Melo', '51', 'acqww');
insert into Alugavel values('Avenida Fontes Pereira de Melo', '52', 'acqwwq');
insert into Alugavel values('Avenida Fontes Pereira de Melo', '6', 'acqwsavaw');
insert into Alugavel values('Avenida Fontes Pereira de Melo', '61', 'acqwsav');
insert into Alugavel values('Avenida Fontes Pereira de Melo', '62', 'acqwsava');

insert into Arrenda values('Avenida da Republica', '1', 123456789);
insert into Arrenda values('Avenida da Republica', '2', 123456788);


insert into Fiscaliza values('ist181505', 'Avenida da Republica', '1');
insert into Fiscaliza values('ist181505', 'Avenida da Republica', '2');

insert into Espaco values('Avenida da Republica', '1');
insert into Espaco values('Avenida da Republica', '2');
insert into Espaco values('Avenida Rovisco Pais', '3');
insert into Espaco values('Avenida Rovisco Pais', '4');
insert into Espaco values('Avenida Fontes Pereira de Melo', '5');
insert into Espaco values('Avenida Fontes Pereira de Melo', '6');

insert into Posto values('Avenida da Republica', '11', '1');
insert into Posto values('Avenida da Republica', '12', '1');
insert into Posto values('Avenida da Republica', '21', '2');
insert into Posto values('Avenida da Republica', '22', '2');
insert into Posto values('Avenida Rovisco Pais', '31', '3');
insert into Posto values('Avenida Rovisco Pais', '32', '3');
insert into Posto values('Avenida Rovisco Pais', '41', '4');
insert into Posto values('Avenida Rovisco Pais', '42', '4');
insert into Posto values('Avenida Fontes Pereira de Melo', '51', '5');
insert into Posto values('Avenida Fontes Pereira de Melo', '52', '5');
insert into Posto values('Avenida Fontes Pereira de Melo', '61', '6');
insert into Posto values('Avenida Fontes Pereira de Melo', '62', '6');

insert into Oferta values('Avenida Rovisco Pais', '3', '28Nov2016', '30Nov2016', 10);
insert into Oferta values('Avenida Rovisco Pais', '31', '28Nov2016', '30Nov2016', 10);
insert into Oferta values('Avenida Rovisco Pais', '32', '28Nov2016', '30Nov2016', 10);
insert into Oferta values('Avenida Fontes Pereira de Melo', '6', '28Nov2016', '30Dez2016', 1000);


insert into Reserva values(1);
insert into Reserva values(2);
insert into Reserva values(3);
insert into Reserva values(4);
insert into Reserva values(5);
insert into Reserva values(6);

insert into Aluga values('Avenida Rovisco Pais', '31', '28Nov2016', 123456789, 1);
insert into Aluga values('Avenida Rovisco Pais', '32', '28Nov2016', 123456786, 2);
insert into Aluga values('Avenida Fontes Pereira de Melo', '6', '28Nov2016', 123456788, 3);

insert into Paga values(1, '30Nov2016', 'Multibanco');
insert into Paga values(2, '30Nov2016', 'MasterCard');

insert into Estado values(1, '28Nov2016', 'Pendente');
insert into Estado values(1, '29Nov2016', 'Aceite');
insert into Estado values(1, '30Nov2016', 'Pago');
insert into Estado values(2, '28Nov2016', 'Pendente');
insert into Estado values(2, '29Nov2016', 'Aceite');
insert into Estado values(2, '30Nov2016', 'Pago');
insert into Estado values(3, '28Nov2016', 'Pendente');
insert into Estado values(3, '29Nov2016', 'Aceite');