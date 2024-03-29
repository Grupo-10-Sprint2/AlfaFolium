CREATE DATABASE AlfaFolium;
USE AlfaFolium;

CREATE TABLE Cadastro (
idCadastro int primary key auto_increment,
nome varchar(50),
email varchar(40),
senha varchar(20),
contato char(11),
cpf char(11),
cnpj char(14));

CREATE TABLE Endereço (
idEndereco int primary key auto_increment,
cep varchar(8),
numero varchar(6) 
);

CREATE TABLE Estufa (
idEstufa int primary key auto_increment,
tamanho varchar(45),
qtdestufa varchar(3),
plantacao varchar(12) constraint chkplanta check (plantacao in ('AMERICANA', 'CRESPA', 'AS DUAS'))
);

CREATE TABLE Sensor (
idSensor int primary key auto_increment,
temperatura decimal,
umidade decimal,
manutencao varchar(12) constraint chkmanutencao check (manutencao in ('FUNCIONANDO', 'QUEBRADO'))
);

INSERT INTO Cadastro VALUES
(DEFAULT, 'MARCIO ANTONIO', 'MARCIO.ANT@12GMAIL.COM', 'DEUS É O PAI', '16900345622', '23698900417', '11453276113198');

INSERT INTO Endereço VALUES
(DEFAULT, '14406093', '2015');

INSERT INTO Estufa VALUES 
(DEFAULT, '4000 METROS QUADRADOS', '3', 'CRESPA');

INSERT INTO Sensor VALUES
(DEFAULT, '26.4', '73.24', 'FUNCIONANDO');

SELECT * FROM Cadastro WHERE nome LIKE '%ONI%'; 

UPDATE Sensor SET manutencao = 'QUEBRADO' WHERE idSensor = 1;

ALTER TABLE Endereço RENAME COLUMN numero TO numero; 



