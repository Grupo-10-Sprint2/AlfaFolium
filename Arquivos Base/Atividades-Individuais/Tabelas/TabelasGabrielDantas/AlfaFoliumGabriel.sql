create database AlfaFolium;

use AlfaFolium;

create table cadastroCliente(
idCliente int primary key auto_increment not null,
nomeCliente varchar(50) not null, 
emailCliente varchar(40) not null,
idEndereco int,
foreign key (idEndereco) references endereco(idEndereco),
cnpj char(14) not null
);

create table endereco(
idEndereco int primary key auto_increment not null,
cep char(8) not null,
logradouro varchar(30) not null,
numero int not null,
complemento varchar(50),
bairro varchar(20) not null,
cidade varchar(20) not null,
uf char(2) not null
);

create table telefone(
idtelefone int primary key auto_increment not null,
ddd char(2) not null,
telefone char(9) not null,
idCliente int,
foreign key (idCliente) references cadastroCliente(idCliente)
);

create table sensorLM35(
idSensor int primary key auto_increment not null,
temperaturaCapturada decimal(4,2) not null,
temperaturaMedia decimal(4,2) not null
);

create table sensorDHT11(
idSensor int primary key auto_increment not null,
umidadeCapturada decimal(4,2) not null,
umidadeMedia decimal(4,2) not null
);

insert into endereco values
(default, 08460345, "rua angelo pedroso", 53, null, "Guaianases", "São Paulo", "SP");

select * from endereco;

insert into cadastroCliente values(
default, "Jorge Henrique", "JorgeHenrique11@gmail.com", @@IDENTITY, 12345678912345
);

select * from cadastroCliente;

delete from cadastroCliente where idCliente = 1;

insert into telefone values(
default, 11, 932244541, @@identity
);

select * from telefone;
