CREATE DATABASE AlfaFolium;

USE AlfaFolium;

CREATE TABLE Endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    CEP CHAR(9),
    NumEnd VARCHAR(10),
    Complemento VARCHAR(45));
    
INSERT INTO Endereco (CEP, NumEnd, Complemento) VALUE (
	'08421-521', '12', null),
    ('34121-098', '58', null),
    ('65126-091', '76', null),
    ('85759-765', '43', 'Em frente a cúpula do alface'),
    ('09099-521', '24', null);
    
SELECT * FROM Endereco;

CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (45),
    CNPJ CHAR (18),
    fkEndereco INT,
		CONSTRAINT fkEnderecoEmpresa FOREIGN KEY (fkEndereco)
			REFERENCES Endereco(idEndereco));
    
INSERT INTO Empresa (Nome, CNPJ, fkEndereco) VALUE (
	'AlfaFoliun', '12.345.678/0001-99', 1),
    ('ALFAce', '12.345.678/0321-98', 2),
    ('Alfa&Cia', '12.875.548/0001-59', 3),
    ('AgroFace', '31.898.678/8871-13', 4),
    ('AlfaFoliumSede', '12.121.121/0909-11', 5);
    
SELECT * FROM Empresa;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (45),
    CPF CHAR (14),
    Email VARCHAR (45),
    Senha VARCHAR(35),
    TelFixo CHAR (13),
    TelCelular CHAR (14),
    TipoUsuario VARCHAR(45),
    DataCriacao DATE,
		CONSTRAINT chkTipoUsuario CHECK (TipoUsuario IN ('Master', 'Dono', 'Funcionarios')),
    fkEmpresa INT,
		CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) 
			REFERENCES Empresa(idEmpresa));
    
INSERT INTO Usuario (Nome, CPF, Email, Senha, TelFixo, telCelular, fkEmpresa) VALUE
		('Kauan', '123.456.789-90', 'kauan.silva@sptech.school', '12345678990@', '11910223344', '11981233344', 5),
		('Fernanda', '123.456.789-00', 'fernanda.caramico@sptech.school', '12345678900@', '11911223344', '11911233344', 1),
        ('KauanFrança', '987.654.321-00', 'kauan.franca@sptech.school', '98765432100@', '11988776655', '11912223344', 1),
        ('CauãGouveira', '123.321.123-00', 'caua.gouveira@sptech.school', '12332112300@', '11992837465', '11911223345', 1),
        ('Giovanna', '456.654.456-00', 'giovanna.gomes@sptech.school', '45665445600@', '11978456723', '11911228344', 2),
        ('Guilherme', '987.789.987-00', 'guilherme.neris@sptech.school', '98778998700@', '11998513123', '11911243344', 2),
        ('Anilmar', '246.642.246-00', 'Anilmar.choque@sptech.school', '24664224600@', '11908468213', '11910223344', 2),
        ('Diogo', '222.333.444-00', 'diogo.polastrien@sptech.school', '22233344400@', '1199067356', '11911223349', 3),
        ('Rayanne', '111.555.777-00', 'rayanne.reis@sptech.school', '11155577700@', '11990128923', '11911223994', 3),
        ('Mayara', '888.999.111-00', 'mayara.damas@sptech.school', '88899911100@', '11978235623', '11911255344', 3),
        ('Sophia', '999.876.555-00', 'sophia.neves@sptech.school', '99987655500@', '11990218734', '11911773344', 4),
        ('Matheus', '111.456.777-00', 'matheus.soares@sptech.school', '11145677700@', '11976360523', '11911223004', 4),
        ('Samuel', '555.321.567-00', 'samuel.theodoro@sptech.school', '55532156700@', '11990786543', '11911290344', 4);
        
SELECT * FROM Usuario;

CREATE TABLE Parametro (
	idParametro INT PRIMARY KEY AUTO_INCREMENT,
    UmidadeMin DECIMAL (4, 2),
    UmidadeMax DECIMAL (4, 2),
    TemperaturaMin DECIMAL (4, 2),
    TemperaturaMax DECIMAL (4, 2));
            
INSERT INTO Parametro VALUE
	(default, 60, 70, 20, 25);
            
SELECT * FROM Parametro;

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
            
INSERT INTO Estufa (Tamanho, Status, fkEmpresa) VALUES (
	'500 Metros', 'Ativa', 1),
    ('500 Metros', 'Ativa', 1),
    ('500 Metros', 'Ativa', 1),
    ('500 Metros', 'Ativa', 1),
    ('450 Metros', 'Ativa', 2),
    ('430 Metros', 'Ativa', 2),
    ('430 Metros', 'Inativa', 2),
    ('400 Metros', 'Ativa', 3),
    ('400 Metros', 'Inativa', 3),
    ('300 Metros', 'Ativa', 4);
    
SELECT * FROM Estufa;

CREATE TABLE Sensor (
	idSensor INT,
    Nome VARCHAR (45),
    fkEstufa INT,
		PRIMARY KEY (idSensor, fkEstufa),
	FOREIGN KEY (fkEstufa) REFERENCES Estufa (idEstufa));
            
INSERT INTO Sensor VALUE
	(1, 'DHT11', 1),
    (2, 'DHT11', 2),
    (3, 'DHT11', 3),
    (4, 'DHT11', 4),
    (5, 'DHT11', 5),
    (6, 'DHT11', 6),
    (7, 'DHT11', 7),
    (8, 'DHT11', 8),
    (9, 'DHT11', 9),
    (10, 'DHT11', 10);
    
SELECT * FROM Sensor;
            
CREATE TABLE Dados (
	idDados INT,
    Temperatura DECIMAL (4, 2),
    Umidade DECIMAL (4, 2),
    Horario DATETIME,
    fkSensor INT,
		PRIMARY KEY (idDados, fkSensor),
	FOREIGN KEY (fkSensor) REFERENCES Sensor (idSensor));
            
INSERT INTO Dados VALUE
	(1, 23, 70, '2024-04-18 12:41:11', 1),
    (2, 24, 70, '2024-04-18 12:41:11', 2),
    (3, 24, 69, '2024-04-18 12:41:11', 3),
    (4, 25, 67, '2024-04-18 12:41:11', 4),
    (5, 27, 64, '2024-04-18 12:41:11', 5),
    (6, 26, 65, '2024-04-18 12:41:11', 6),
    (7, 23, 70, '2024-04-18 12:41:11', 7),
    (8, 23, 71, '2024-04-18 12:41:11', 8),
    (9, 22, 63, '2024-04-18 12:41:11', 9),
    (10, 25, 67, '2024-04-18 12:41:11', 10);
    
SELECT * FROM Dados;
            
SHOW TABLES;
