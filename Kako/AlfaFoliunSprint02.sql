CREATE DATABASE AlfaFolium;

USE AlfaFolium;

CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (45),
    CEP CHAR (9),
    NumEnd VARCHAR (45),
    CNPJ CHAR (18));
    
INSERT INTO Empresa (Nome, CEP, NumEnd, CNPJ) VALUE (
	'AlfaFoliun', '12345-678', '12', '123/4561-10'),
    ('ALFAce', '12121-212', '21', '212/1221-10'),
    ('Alfa&Cia', '34543-245', '13', '456/7654-10'),
    ('AgroFace', '09887-683', '31', '987/6543-10');
    
SELECT * FROM Empresa;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (45),
    CPF VARCHAR (45),
    Email VARCHAR (45),
    Senha VARCHAR (12),
    Telefone VARCHAR (45),
    TipoUsuario VARCHAR(45),
		CONSTRAINT chkTipoUsuario CHECK (TipoUsuario IN ('Dono', 'ADM', 'Funcionarios')),
    fkEmpresa INT,
		CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) 
			REFERENCES Empresa(idEmpresa)
    );
    
INSERT INTO Usuario (Nome, CPF, Email, Senha, Telefone, TipoUsuario, fkEmpresa) VALUE
		('Kauan', '123.456.789-00', 'kauan.silva@sptech.school', '12345678900@', '11911223344', 'Dono', '1'),
        ('KauanFrança', '987.654.321-00', 'kauan.franca@sptech.school', '98765432100@', '11988776655', 'ADM', '1'),
        ('CauãGouveira', '123.321.123-00', 'caua.gouveira@sptech.school', '12332112300@', '11992837465', 'Funcionarios', '1'),
        ('Giovanna', '456.654.456-00', 'giovanna.gomes@sptech.school', '45665445600@', '11978456723', 'Dono', '2'),
        ('Guilherme', '987.789.987-00', 'guilherme.neris@sptech.school', '98778998700@', '11998513123', 'ADM', '2'),
        ('Anilmar', '246.642.246-00', 'Anilmar.choque@sptech.school', '24664224600@', '11908468213', 'Funcionarios', '2'),
        ('Diogo', '222.333.444-00', 'diogo.polastrien@sptech.school', '22233344400@', '1199067356', 'Dono', '3'),
        ('Rayanne', '111.555.777-00', 'rayanne.reis@sptech.school', '11155577700@', '11990128923', 'ADM', '3'),
        ('Mayara', '888.999.111-00', 'mayara.damas@sptech.school', '88899911100@', '11978235623', 'Funcionarios', '3'),
        ('Sophia', '999.876.555-00', 'sophia.neves@sptech.school', '99987655500@', '11990218734', 'Dono', '4'),
        ('Matheus', '111.456.777-00', 'matheus.soares@sptech.school', '11145677700@', '11976360523', 'ADM', '4'),
        ('Samuel', '555.321.567-00', 'samuel.theodoro@sptech.school', '55532156700@', '11990786543', 'Funcionarios', '4');
        
SELECT * FROM Usuario;
        
CREATE TABLE Estufa (
	idEstufa INT PRIMARY KEY AUTO_INCREMENT,
	TamanhoEstufa VARCHAR (45),
	TipoAlface VARCHAR (45),
	Funcionando CHAR (3),
		CONSTRAINT chkFuncionando CHECK (Funcionando IN ('Sim', 'Não')),
	Horario DATETIME,
    fkEmpresa INT, 
		CONSTRAINT fkEstufaEmpresa FOREIGN KEY (fkEmpresa)
			REFERENCES Empresa (idEmpresa));
            
INSERT INTO Estufa (TamanhoEstufa, TipoAlface, Funcionando, Horario, fkEmpresa) VALUES (
	'500 Metros²', 'Crespa', 'Sim', '2024-04-18 12:41:11', '1'),
    ('500 Metros²', 'Crespa', 'Sim', '2024-04-18 12:41:11', '1'),
    ('500 Metros²', 'Crespa', 'Sim', '2024-04-18 12:41:11', '1'),
    ('500 Metros²', 'Crespa', 'Sim', '2024-04-18 12:41:11', '1'),
    ('450 Metros²', 'Crespa', 'Sim', '2024-04-18 12:41:11', '2'),
    ('430 Metros²', 'Crespa', 'Sim', '2024-04-18 12:41:11', '2'),
    ('430 Metros²', 'Crespa', 'Não', '2024-04-18 12:41:11', '2'),
    ('400 Metros²', 'Crespa', 'Sim', '2024-04-18 12:41:11', '3'),
    ('400 Metros²', 'Crespa', 'Não', '2024-04-18 12:41:11', '3'),
    ('300 Metros²', 'Crespa', 'Sim', '2024-04-18 12:41:11', '4');
    
SELECT * FROM Estufa;
            
CREATE TABLE Sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (45),
    Funcionando CHAR (3),
		CONSTRAINT chkFuncionandoSensor CHECK (Funcionando IN ('Sim', 'Não')),
    fkEstufa INT,
		CONSTRAINT fkSensorEstufa FOREIGN KEY (fkEstufa)
			REFERENCES Estufa (idEstufa));
            
INSERT INTO Sensor (Nome, Funcionando, fkEstufa) VALUE
	('DHT11', 'Sim', '1'),
    ('DHT11', 'Sim', '2'),
    ('DHT11', 'Sim', '3'),
    ('DHT11', 'Sim', '4'),
    ('DHT11', 'Sim', '5'),
    ('DHT11', 'Sim', '6'),
    ('DHT11', 'Sim', '7'),
    ('DHT11', 'Sim', '8'),
    ('DHT11', 'Sim', '9'),
    ('DHT11', 'Sim', '10');
    
SELECT * FROM Sensor;
            
CREATE TABLE Dados (
	idDados INT PRIMARY KEY AUTO_INCREMENT,
    Temperatura VARCHAR (45),
    Umidade VARCHAR (45),
    Horario DATETIME,
    fkSensor INT,
		CONSTRAINT fkDadosSensor FOREIGN KEY (fkSensor)
			REFERENCES Sensor (idSensor));
            
INSERT INTO Dados (Temperatura, Umidade, Horario, fkSensor) VALUE
	('23', '70', '2024-04-18 12:41:11', '1'),
    ('24', '70', '2024-04-18 12:41:11', '2'),
    ('24', '69', '2024-04-18 12:41:11', '3'),
    ('25', '67', '2024-04-18 12:41:11', '4'),
    ('27', '64', '2024-04-18 12:41:11', '5'),
    ('26', '65', '2024-04-18 12:41:11', '6'),
    ('23', '70', '2024-04-18 12:41:11', '7'),
    ('23', '71', '2024-04-18 12:41:11', '8'),
    ('22', '63', '2024-04-18 12:41:11', '9'),
    ('25', '67', '2024-04-18 12:41:11', '10');
    
SELECT * FROM Dados;
            
CREATE TABLE Parametro (
	idParametro INT PRIMARY KEY AUTO_INCREMENT,
    UmidadeMin INT,
    UmidadeMax INT,
    TemperaturaMin INT,
    Temperatura INT,
    fkSensor INT,
		CONSTRAINT fkParametroSensor FOREIGN KEY  (fkSensor)
			REFERENCES Sensor (idSensor));
            
INSERT INTO Parametro VALUE
	(default, '60', '70', '20', '25', '1'),
    (default, '60', '70', '20', '25', '2'),
    (default, '60', '70', '20', '25', '3'),
    (default, '60', '70', '20', '25', '4'),
    (default, '60', '70', '20', '25', '5'),
    (default, '60', '70', '20', '25', '6'),
    (default, '60', '70', '20', '25', '7'),
    (default, '60', '70', '20', '25', '8'),
    (default, '60', '70', '20', '25', '9'),
    (default, '60', '70', '20', '25', '10');
            
SELECT * FROM Parametro;
            
SELECT DISTINCT Empresa.Nome as NomeEmpresa,
	Usuario.Nome as NomeDono,
    Estufa.idEstufa as IdEstufa,
    Estufa.TipoAlface as TipoAlface,
    Estufa.Funcionando as Funcionando,
    Estufa.Horario as Horario,
    Sensor.idSensor as IdSensor,
    Sensor.Nome as NomeSensor,
    Sensor.Funcionando as Funcionando,
    Dados.Temperatura as Temperatura,
    Dados.Umidade as Umidade
FROM Empresa JOIN Usuario
	ON Empresa.idEmpresa = Usuario.fkEmpresa
JOIN Estufa
	ON Estufa.fkEmpresa = Empresa.idEmpresa
JOIN Sensor
	ON Estufa.idEstufa = Sensor.fkEstufa
JOIN Dados
	ON Dados.fkSensor = Sensor.idSensor
 WHERE TipoUsuario = 'Dono';