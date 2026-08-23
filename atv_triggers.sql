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

-- atividade A) --

delimiter //

create trigger inserindo_produtos 
after insert on produtos
for each row

begin

insert into log_eventos (entidade, acao, descricao)
values ('produto', 'cadastro', new.nome)

end \\

delimiter ;

insert into produtos (nome, preco, estoque)
values ("ovo centenário", 50.00, 20);

-- atividade B) --

delimiter //

create trigger inserindo_clientes
after insert on clientes
for each row

begin

insert into log_eventos (entidade, acao, descricao)
values ('cliente', 'cadastro', concat("nome:",new.nome, "email:", new.email));

end ;

delimiter \\

insert into clientes (nome, email)
values ("enzo", "emailenzo@gmail.com");

-- atividade C) --

delimiter //

create trigger deletando_produtos
after delete on produtos
for each row

begin

insert into log_eventos (entidade, acao, descricao)
values ('produto', 'exclusao', concat('produto excluido:', old.nome, ', preco:', old.preco));

end //

delimiter ;

delete from produtos
where id = 1;

delimiter //

create trigger deletando_clientes
after delete on clientes
for each row

begin

insert into log_eventos (entidade, acao, descricao)
values ('cliente', 'exclusao', concat('cliente excluido: ', old.nome, '-email', old.email));

end //

delimiter ;

delete from clientes
where id = '1';