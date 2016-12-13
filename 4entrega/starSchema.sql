drop table if exists reserva_factos;
drop table if exists data_dimensao;
drop table if exists local_dimensao;
drop table if exists user_dimensao;
drop table if exists tempo_dimensao;


create table user_dimensao (
    nif varchar(9) not null unique,
    nome varchar(80) not null,
    telefone varchar(26) not null,
    primary key(nif));

create table local_dimensao (
    local_id varchar(765) not null unique,
    posto_codigo varchar(255) not null,
    espaco_codigo varchar(255) not null,
    edificio_morada varchar(255) not null,
    primary key(local_id));

create table data_dimensao (
    data_id varchar(9) not null unique,
    dia_do_ano date not null,
    semana_do_ano date not null,
   	mes_do_ano date not null,
   	semestre_do_ano date not null,
   	ano date not null,
   	data_pagamento date not null,
    primary key(data_id));

create table tempo_dimensao (
    tempo_id varchar(9) not null unique,
    hora date not null,
    minuto date not null,
    minuto_do_dia date not null,
    primary key(tempo_id));


create table reserva_factos (
    numero varchar(255) not null unique,
    user_id varchar(9) not null,
    local_id varchar(9) not null,
    tempo_id varchar(9) not null,
    data_id varchar(9) not null,
    montante_pago numeric(19,4) not null,
    duracao date not null,
    foreign key(user_id) references user_dimensao(nif),
    foreign key(local_id) references local_dimensao(local_id),
    foreign key(tempo_id) references tempo_dimensao(tempo_id),
    foreign key(data_id) references data_dimensao(data_id),
    primary key(numero));