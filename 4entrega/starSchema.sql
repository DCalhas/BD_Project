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
    local_id varchar(510) not null unique,
    posto_codigo varchar(255),
    espaco_codigo varchar(255) not null,
    edificio_morada varchar(255) not null,
    primary key(local_id));

create table data_dimensao (
    data_id int(8) not null unique,
    dia_do_ano int(2) not null,
    semana_do_ano int(2) not null,
   	mes_do_ano int(2) not null,
   	semestre_do_ano int(1) not null,
   	ano int(4) not null,
    primary key(data_id));

create table tempo_dimensao (
    tempo_id int(4) not null unique,
    hora int(2) not null,
    minuto int(2) not null,
    primary key(tempo_id));


create table reserva_factos (
    numero varchar(255) not null unique,
    user_id varchar(9) not null,
    local_id varchar(510) not null,
    tempo_id int(4) not null,
    data_id int(8) not null,
    montante_pago numeric(19,4) not null,
    duracao int(8) not null,
    foreign key(user_id) references user_dimensao(nif),
    foreign key(local_id) references local_dimensao(local_id),
    foreign key(tempo_id) references tempo_dimensao(tempo_id),
    foreign key(data_id) references data_dimensao(data_id),
    primary key(numero));