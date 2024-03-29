create database alfaFolium;
use alfaFolium;

create table cliente(
idCliente int primary key auto_increment,
nomeCompleto varchar(50) not null,
dataNascimento date,
email varchar(50) not null,
telefone char(9) not null,
cpf char(11) not null,
cnpj char(14)
);

alter table cliente
modify column telefone char(11);

insert into cliente values
(default, 'João Pedro Gomes', '1980-03-05', 'jpalface@contato.com', '11989596971', '18853595000', null),
(default, 'Carla Menezes', '1995-12-24', 'contato@carlamenezes.com', '83993827877', '51797738658', '16486905000153'),
(default, 'Silvia Novais', '2000-08-08', 'silvabb@gmail.com', '65968171307', '94620170003', '91379991000110'),
(default, 'Luis Pablo Gonzales', '1975-07-30', 'pablovegetais@terraverde.com.br', '11989596971', '18853595000', null);

create table endereco(
idEndereco int primary key auto_increment,
cep char(8) not null,
rua varchar(40) not null,
numero int,
complemento varchar(50),
bairro varchar(40) not null,
cidade varchar(40) not null,
uf char(2) not null
);

alter table endereco add constraint CheckComplemento check(complemento in('casa', 'apto', 'fundos', 'bloco', 'sobrado', 'rancho', 'fazenda', 'sitio'));

insert into endereco values
(default, '31998060', 'Rua Itarumirim', '7', 'casa', 'Conjunto Paulo VI', 'Belo Horizonte', 'MG'),
(default, '59120710', 'Rua Severino Soares', null, 'rancho', 'Potengi', 'Natal', 'RN'),
(default, '69099441', 'Rua 9', '2050', 'fazenda', 'Cidade de Deus', 'Manaus', 'AM'),
(default, '07143650', 'Avenida Três Corações', '30', 'apto', 'Jardim Paraíso', 'Guarulhos', 'SP');

create table plantacao(
idAlface int primary key auto_increment,
qtdEstufas int,
variedade varchar (15) not null,
constraint chkTipoAlface check (variedade in('americana', 'crespa', 'ambas')),
comprimentoEstufa int,
alturaEstufa int,
temperatura int,
umidade int
);

insert into plantacao values
(default, '15', 'ambas', '27', '12', '35', '60'),
(default, '3', 'crespa', '60', '9', '25', '10'),
(default, '7', 'americana', '33', '27', '15', '35'),
(default, '18', 'ambas', '55', '27', '27', '70');

