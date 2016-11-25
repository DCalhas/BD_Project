
set sql_notes = 0;

drop table if exists Aluga cascade;
drop table if exists Estado cascade;
drop table if exists Paga cascade;
drop table if exists Reserva cascade;
drop table if exists Oferta cascade;
drop table if exists Posto cascade;
drop table if exists Espaco cascade;
drop table if exists Fiscaliza cascade;
drop table if exists Arrenda cascade;
drop table if exists Alugavel cascade;
drop table if exists Edificio cascade;
drop table if exists Fiscal cascade;
drop table if exists User cascade;





create table User 
	(nif	int(9) unsigned not null,
	nome 	varchar(255) not null,
	telefone int(9) unsigned not null,
	primary key(nif));

create table Fiscal 
	(id varchar(255) not null,
	empresa		varchar(255) not null,
	primary key(id));

create table Edificio
	(morada varchar(255) not null,
	primary key(morada));

create table Alugavel
	(morada varchar(255) not null,
	codigo varchar(255) not null,
	fotografia varchar(255) not null,
	primary key(morada, codigo),
	foreign key(morada) references Edificio(morada));

create table Arrenda
	(morada varchar(255) not null,
	codigo 	varchar(255) not null,
	nif 	int(9) unsigned not null,
	primary key(morada, codigo),
	foreign key(morada, codigo) references Alugavel(morada, codigo),
	foreign key(nif) references User(nif));

create table Fiscaliza 
	(id 	varchar(255) not null,
	morada 	varchar(255) not null,
	codigo 		varchar(255) not null,
	primary key(id, morada, codigo),
	foreign key(id) references Fiscal(id),
	foreign key(morada, codigo) references Arrenda(morada, codigo));

create table Espaco
	(morada 	varchar(255) not null,
	codigo 		varchar(255) not null,
	primary key(morada, codigo),
	foreign key(morada, codigo) references Alugavel(morada, codigo));

create table Posto
	(morada varchar(255) not null,
	codigo	varchar(255) not null,
	codigo_espaco 	varchar(255) not null,
	primary key(morada, codigo),
	foreign key(morada, codigo_espaco) references Espaco(morada, codigo),
	foreign key(morada, codigo) references Alugavel(morada, codigo));

create table Oferta
	(morada	varchar(255) not null,
	codigo		varchar(255) not null,
	data_inicio varchar(255) not null,
	data_fim	varchar(255) not null,
	tarifa		varchar(255) not null,
	primary key(morada, codigo, data_inicio),
	foreign key(morada, codigo) references Alugavel(morada, codigo));

create table Reserva
	(numero	varchar(255) not null,
	primary key(numero));

create table Aluga
	(morada	varchar(255) not null,
	codigo 		varchar(255) not null,
	data_inicio varchar(255) not null,
	nif		int(9) unsigned not null,
	numero 	varchar(255) not null,
	primary key(morada, codigo, data_inicio, nif, numero),
	foreign key(morada, codigo, data_inicio) references Oferta(morada, codigo, data_inicio),
	foreign key(nif) references User(nif),
	foreign key(numero) references Reserva(numero));

create table Paga
	(numero		varchar(255) not null,
	data		varchar(255) not null,
	metodo		varchar(255) not null,
	primary key(numero),
	foreign key(numero) references Reserva(numero));

create table Estado 
	(numero	varchar(255) not null,
	timestamp varchar(255) not null,
	estado	varchar(255) not null,
	primary key(numero, timestamp),
	foreign key(numero) references Reserva(numero));


/*
insert into User values ('12312412', 'Davi', '5555555');
insert into User values ('000000', 'Ze', '66666661');
insert into User values ('1111111112', 'Cris', '7777777');
insert into User values ('12222222', 'FDP', '8888881'); 

insert into Alugavel values('Rua AAA', "123", "BONITO");
insert into Alugavel values('Rua BBB', '456', " BONITO");
insert into Alugavel values('Rua CCC', '789', " BONITO");

insert into fiscal values('pila', 'INESC');

insert into Espaco values('Rua AAA', '12');
insert into Espaco values('Rua BBB', '45');
insert into Espaco values('Rua CCC', '78');

insert into Posto values('Rua AAA', '123', '12');
insert into Posto values('Rua BBB', '456', '12');
insert into Posto values('Rua CCC', '789', '45');

insert into Oferta values('Rua AAA', '123', '1jan', '2jan', '1');

insert into Reserva values('3333');

insert into aluga values('Rua AAA', '123', '1jan', '5555555', '3333');
*/


