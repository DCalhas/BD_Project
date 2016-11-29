
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
	foreign key(morada) references Edificio(morada) on delete cascade);

create table Arrenda
	(morada varchar(255) not null,
	codigo 	varchar(255) not null,
	nif 	int(9) unsigned not null,
	primary key(morada, codigo),
	foreign key(morada, codigo) references Alugavel(morada, codigo) on delete cascade,
	foreign key(nif) references User(nif));

create table Fiscaliza 
	(id 	varchar(255) not null,
	morada 	varchar(255) not null,
	codigo 		varchar(255) not null,
	primary key(id, morada, codigo),
	foreign key(id) references Fiscal(id),
	foreign key(morada, codigo) references Arrenda(morada, codigo) on delete cascade);

create table Espaco
	(morada 	varchar(255) not null,
	codigo 		varchar(255) not null,
	primary key(morada, codigo),
	foreign key(morada, codigo) references Alugavel(morada, codigo) on delete cascade);

create table Posto
	(morada varchar(255) not null,
	codigo	varchar(255) not null,
	codigo_espaco 	varchar(255) not null,
	primary key(morada, codigo),
	foreign key(morada, codigo_espaco) references Espaco(morada, codigo) on delete cascade,
	foreign key(morada, codigo) references Alugavel(morada, codigo) on delete cascade);

create table Oferta
	(morada	varchar(255) not null,
	codigo		varchar(255) not null,
	data_inicio date not null,
	data_fim	date not null,
	tarifa		int(5) unsigned not null,
	primary key(morada, codigo, data_inicio),
	foreign key(morada, codigo) references Alugavel(morada, codigo) on delete cascade);

create table Reserva
	(numero	varchar(10) not null,
	primary key(numero));

create table Aluga
	(morada	varchar(255) not null,
	codigo 		varchar(255) not null,
	data_inicio date not null,
	nif		int(9) unsigned not null,
	numero 	varchar(10) not null,
	primary key(morada, codigo, data_inicio, nif, numero),
	foreign key(morada, codigo, data_inicio) references Oferta(morada, codigo, data_inicio) on delete cascade,
	foreign key(nif) references User(nif),
	foreign key(numero) references Reserva(numero));

create table Paga
	(numero		varchar(10) not null,
	data		date not null,
	metodo		varchar(255) not null,
	primary key(numero),
	foreign key(numero) references Reserva(numero));

create table Estado 
	(numero	varchar(10) not null,
	timestamp timestamp not null,
	estado	varchar(255) not null,
	primary key(numero, timestamp),
	foreign key(numero) references Reserva(numero));