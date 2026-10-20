create database loja_informatica;

use loja_informatica;

create table produtos(
id int primary key auto_increment,
nome varchar(100) not null,
preco decimal(10,2) not null,
quantidade int not null
);

create table clientes(
id int primary key auto_increment,
nome varchar(100)not null,
endereco varchar(100) not null
);

insert into produtos ( nome, preco, quantidade) values
("teclado", 120.00, 15),
("mouse", 65.00, 30),
("monitor", 850.00, 8);

-- criando usuários

create user 'vendedor'@'localhost'
identified by '123';

create user 'gerente'@'localhost'
identified by '123456';

create user 'estagiario'@'localhost'
identified by '123456789';

-- create user: cria uma conta de usuario
-- vendedor: nome da conta
-- localhost: permite conexão a partir do próprio computador onde o mysql esta executando
-- identified by: define a senha da conta

drop user 'estagiario'@'localhost';

-- drop user: exclui a conta do usuario
-- usuario: nome da conta
-- host: origem da conexão associada a conta

-- dando permissões

grant select
on loja_informatica.produtos
to 'vendedor'@'localhost';

grant select, update, insert
on loja_informatica.produtos
to 'gerente'@'localhost';

-- permissões de diferentes escopos
-- permite visualix=zar todas as tabelas existentes dentro da taabela de dados

grant select
on loja_informatica.*
to 'vendedor'@'localhost';

-- concede acesso a todas as bases de dados e suas tabelas

grant select
on *.*
to 'vendedor'@'localhost';

-- revogando permissões

revoke select
on loja_informatica.produtos
from 'vendedor'@'localhost';

-- consultando as permissões do usuario

show grants for 'vendedor'@'localhost';