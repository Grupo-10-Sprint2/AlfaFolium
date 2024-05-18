-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE AlfaFolium;

USE AlfaFolium;


CREATE TABLE Endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    CEP CHAR(9),
    NumEnd VARCHAR(10),
    Complemento VARCHAR(45));


CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (45),
    CNPJ CHAR (18),
    fkEndereco INT,
		CONSTRAINT fkEnderecoEmpresa FOREIGN KEY (fkEndereco)
			REFERENCES Endereco(idEndereco)
);


CREATE TABLE Parametro (
	idParametro INT PRIMARY KEY AUTO_INCREMENT,
    UmidadeMin DECIMAL (4, 2),
    UmidadeMax DECIMAL (4, 2),
    TemperaturaMin DECIMAL (4, 2),
    TemperaturaMax DECIMAL (4, 2)
);


CREATE TABLE Estufa (
	idEstufa INT PRIMARY KEY AUTO_INCREMENT,
	Tamanho VARCHAR (10),
	Status VARCHAR (25),
		CONSTRAINT chkStatus CHECK (Status IN ('Ativa', 'Inativa')),
    fkEmpresa INT, 
		CONSTRAINT fkEstufaEmpresa FOREIGN KEY (fkEmpresa)
			REFERENCES Empresa (idEmpresa),
	fkParametro INT,
		CONSTRAINT fkParametroEstufa FOREIGN KEY (fkParametro)
			REFERENCES Parametro (idParametro));

		
CREATE TABLE Sensor (
	idSensor INT,
    Nome VARCHAR (45),
    fkEstufa INT,
		PRIMARY KEY (idSensor, fkEstufa),
	FOREIGN KEY (fkEstufa) REFERENCES Estufa (idEstufa));


CREATE TABLE Dados (
	idDados INT,
    Temperatura DECIMAL (4, 2),
    Umidade DECIMAL (4, 2),
    Horario DATETIME,
    fkSensor INT,
		PRIMARY KEY (idDados, fkSensor),
	FOREIGN KEY (fkSensor) REFERENCES Sensor (idSensor));


