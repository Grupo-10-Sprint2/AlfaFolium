-- Criando o Banco de dados da empresa --
create database aquila;
use aquila;

-- Criando a tabela de cadastro --
create table cadastro(
idUsuario int primary key auto_increment,
nome varchar(60) not null,
email varchar(60) not null, 
cpf char(11) not null,
telefoneCelular char(11) not null,
endereço varchar(60) not null
);

-- Criando a tabela das estufas --
create table estufa(
idEstufa int primary key auto_increment,
qtdEstufa int not null,
qtdAlfaces int not null
);

-- Criando a tabela dos sensores -- 
create table sensores(
idSensor int primary key auto_increment,
tempEstufa decimal(5,2) not null,
umSolo decimal(5,2) not null,
manutencao varchar(30) not null,
constraint chkSensor check (manutencao in('Ativo', 'Desativado'))
);

-- Descrevendo a estrutura das tabelas --
desc cadastro;
desc estufa;
desc sensores;

-- Inserindo os dados nas tabelas --
insert into cadastro values
(default, 'Anthony', 'anthony.batista@sptech.school', '43746924871', '11957312168', 'Rua Nova Guataporanga'),
(default, 'Joao', 'joao.silva@sptech.school', '12345678911', '11999999999', 'Rua Silverio Castro Souza');

insert into estufa values
(default, 10, 200),
(default, 20, 400);

insert into sensores values
(default, '23.5', '13.5', 'Ativo'),
(default, '18.3', '12.4', 'Ativo');

-- Selects de todos da tabela --
select * from cadastro;
select * from estufa;
select * from sensores;

-- Selects por ID -- 
select * from cadastro where idUsuario = 1;
select * from estufa where idEstufa = 2;
select * from sensores where idSensor = 1;



