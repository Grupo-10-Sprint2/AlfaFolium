CREATE DATABASE AlfaFolium;

USE AlfaFolium;

CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR (45),
    CEP CHAR (9),
    Numero VARCHAR (45),
    CNPJ CHAR (18));
    
INSERT INTO Empresa (Nome, CEP, Numero, CNPJ) VALUE (
	'ALFA_ce', '1234567_0', '120', '12.345.678/0001-90'),
    ('Alface&Cia', '1234567_1', '130', '12.121.212/0002.00'),
    ('AlfaCon', '1234567_2', '140', '13.321.312/0003.30'),
    ('Fazenda', '1234567_3', '150', '52.145.985/0056.50'),
    ('AgroFace', '1234567_4', '160', '16.211.092/0087.54');
    
SELECT * FROM Empresa;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    CPF CHAR (45),
    Nome VARCHAR (45),
    Email VARCHAR (45),
    Senha VARCHAR (45),
    Telefone VARCHAR (45),
    fkEmpresa INT,
		CONSTRAINT fkEmpresaUsuario FOREIGN KEY (fkEmpresa)
			REFERENCES Empresa (idEmpresa));
    
    
INSERT INTO Usuario (CPF, Nome, Email, Senha, Telefone, fkEmpresa) VALUE (
	'11122233300', 'KauanFrança', 'Kauan.frança@sptech.school', 'Fazenda000', '5511912345670', 1),
    ('11122233301', 'Giovanna', 'Giovanna.gomes@sptech.school', 'Fazenda001', '5511912345671', 1),
    ('11122233302', 'Guilherme', 'Guilherme.neris@sptech.school', 'Fazenda002', '5511912345672', 2),
    ('11122233303', 'Anilmar', 'Anilmar.choque@sptech.school', 'Fazenda003', '5511912345673', 3),
    ('11122233304', 'Diogo', 'Diogo.polastrine@sptech.school', 'Fazenda004', '5511912345674', 4),
    ('11122233305', 'Kako', 'Kako.marques@sptech.school', 'Fazenda005', '5511912345675', 5);
    
SELECT * FROM Usuario;
    
CREATE TABLE Estufa (
	idEstufa INT PRIMARY KEY AUTO_INCREMENT,
    Tamanho VARCHAR (45),
    TipoAlface VARCHAR (45),
    Funcionando VARCHAR (45),
    fkUsuario INT,
    Horario DATETIME,
    CONSTRAINT chkFuncionamentoEstufa CHECK (Funcionando IN ('Sim', 'Não')),
    CONSTRAINT fkUsuarioEstufa FOREIGN KEY (fkUsuario)
		REFERENCES Usuario (idUsuario));
    
INSERT INTO Estufa (Tamanho, TipoAlface, Funcionando, fkUsuario, Horario) VALUE (
	'80', 'Crespa', 'Sim', '1', '2024-04-09 22:05:22'),
    ('85', 'Crespa', 'Sim', '1', '2024-04-09 22:05:22'),
    ('90', 'Crespa', 'Não', '2', '2024-04-09 22:05:22'),
    ('95', 'Crespa', 'Sim', '2', '2024-04-09 22:05:22'),
    ('100', 'Crespa', 'Não', '3', '2024-04-09 22:05:22'),
    ('105', 'Crespa', 'Não', '3', '2024-04-09 22:05:22'),
    ('110', 'Crespa', 'Sim', '4', '2024-04-09 22:05:22'),
    ('115', 'Crespa', 'Sim', '4', '2024-04-09 22:05:22'),
    ('120', 'Crespa', 'Não', '5', '2024-04-09 22:05:22'),
    ('125', 'Crespa', 'Não', '5', '2024-04-09 22:05:22'),
    ('130', 'Crespa', 'Sim', '6', '2024-04-09 22:05:22'),
    ('135', 'Crespa', 'Sim', '6', '2024-04-09 22:05:22');
    
SELECT * FROM Estufa;
    
CREATE TABLE Temperatura (
	idTemperatura INT PRIMARY KEY AUTO_INCREMENT,
	fkEstufa INT,
	TemperaturaIdeal VARCHAR (45),
	TemperaturaAtual VARCHAR (45),
    Horario DATETIME,
    CONSTRAINT fkTemperaturaEstufa FOREIGN KEY (fkEstufa)
		REFERENCES Estufa (idEstufa));

INSERT INTO Temperatura (fkEstufa, TemperaturaIdeal, TemperaturaAtual, Horario) VALUE (
	'1', '20', '23', '2024-04-09 22:05:22'),
    ('2', '20', '21', '2024-04-09 22:05:22'),
    ('3', '20', '25', '2024-04-09 22:05:22'),
    ('4', '20', '26', '2024-04-09 22:05:22'),
    ('5', '20', '24', '2024-04-09 22:05:22'),
    ('6', '20', '22', '2024-04-09 22:05:22'),
    ('7', '20', '18', '2024-04-09 22:05:22'),
    ('8', '20', '19', '2024-04-09 22:05:22'),
    ('9', '20', '22', '2024-04-09 22:05:22'),
    ('10', '20', '23', '2024-04-09 22:05:22'),
    ('11', '20', '30', '2024-04-09 22:05:22'),
    ('12', '20', '18', '2024-04-09 22:05:22');
    
SELECT * FROM Temperatura;

CREATE TABLE Umidade (
	idUmidade INT PRIMARY KEY AUTO_INCREMENT,
    fkEstufa INT,
    UmidadeIdeal VARCHAR (45),
    UmidadeAtual VARCHAR (45),
    Horario DATETIME,
    CONSTRAINT fkUmidadeEstufa FOREIGN KEY (fkEstufa)
		REFERENCES Estufa (idEstufa));

INSERT INTO Umidade (fkEstufa, UmidadeIdeal, UmidadeAtual, Horario) VALUE (
	'1', '70', '35', '2024-04-09 22:05:22'),
    ('2', '70', '33', '2024-04-09 22:05:22'),
    ('3', '70', '38', '2024-04-09 22:05:22'),
    ('4', '70', '36', '2024-04-09 22:05:22'),
    ('5', '70', '29', '2024-04-09 22:05:22'),
    ('6', '70', '30', '2024-04-09 22:05:22'),
    ('7', '70', '22', '2024-04-09 22:05:22'),
    ('8', '70', '24', '2024-04-09 22:05:22'),
    ('9', '70', '28', '2024-04-09 22:05:22'),
    ('10', '70', '29', '2024-04-09 22:05:22'),
    ('11', '70', '19', '2024-04-09 22:05:22'),
    ('12', '70', '37', '2024-04-09 22:05:22');
    
SELECT * FROM Umidade;

SELECT Usuario.Nome AS NomeUsuario,
	Estufa.idEstufa As idEstufa,
	Temperatura.TemperaturaAtual AS TemperaturaAtual,
	Umidade.UmidadeAtual AS UmidadeAtual,
    Estufa.Horario AS HorarioCaptura
FROM Usuario JOIN Estufa
ON Usuario.idUsuario = fkUsuario
JOIN Temperatura ON Temperatura.fkEstufa = idEstufa
JOIN Umidade ON Umidade.fkEstufa = idEstufa;
