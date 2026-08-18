create database atv_trigger;

use atv_trigger;

create table produtos (
id int primary key auto_increment,
nome varchar(100),
preco decimal(10,2),
estoque int
);

create table clientes (
id int primary key auto_increment,
nome varchar(100),
email varchar(100) unique
);

create table log_eventos (
id int primary key auto_increment,
entidade varchar(50),
acao varchar(20),
descricao text,
data_evento datetime default current_timestamp
);


create trigger tr_inserindo_produto after insert
on log_eventos
for each row