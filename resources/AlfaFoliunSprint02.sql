CREATE DATABASE AlfaFolium;

USE AlfaFolium;

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    CEP CHAR(9),
    numEnd VARCHAR(10)
);

ALTER TABLE endereco MODIFY COLUMN CEP CHAR(14);

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    CNPJ CHAR (18),
    fkEndereco INT,
		CONSTRAINT fkEnderecoEmpresa FOREIGN KEY (fkEndereco)
			REFERENCES endereco(idEndereco)
);

INSERT INTO empresa (nome, CNPJ) VALUES
	('Alfa Folium', '21.886.895/0001-83');

        
CREATE TABLE tipoUsuario (
	idTipoUsuario INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(45),
    descricao VARCHAR(200),
    CONSTRAINT chkTipoUsuario CHECK (tipo IN ('Master', 'Dono', 'Funcionario'))
);

INSERT INTO tipoUsuario (tipo,descricao) VALUES 
	('Master', 'Usuários pertencententes a equipe de desenvolvimento e produção'),
    ('Dono', 'Usuário/Cliente responsável pelo controle total da plataforma através da aplicação desenvolvida'),
    ('Funcionario', 'Usuário responsável pelo controle parcial da plataforma para análises e tomada de decisoes');
    


CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    CPF CHAR (14),
    email VARCHAR (45),
    senha VARCHAR(35),
    telFixo CHAR (13),
    telCelular CHAR (14),
    dataCriacao DATE,
    fkEmpresa INT,
    fkTipoUsuario INT,
    CONSTRAINT fkUsuarioTipoUsuario FOREIGN KEY (fkTipoUsuario)
		REFERENCES tipoUsuario(idTipoUsuario),
	CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa)
		REFERENCES empresa(idEmpresa)
);


    
CREATE TABLE parametro (
	idParametro INT PRIMARY KEY AUTO_INCREMENT,
    umidadeMin DECIMAL (4, 2),
    umidadeMax DECIMAL (4, 2),
    temperaturaMin DECIMAL (4, 2),
    temperaturaMax DECIMAL (4, 2)
); 	


CREATE TABLE estufa (
	idEstufa INT PRIMARY KEY AUTO_INCREMENT,
	tamanho VARCHAR (10),
	status VARCHAR (25),
    fkEmpresa INT, 
	fkParametro INT,
		CONSTRAINT chkStatus CHECK (status IN ('Ativa', 'Inativa')),
		CONSTRAINT fkEstufaEmpresa FOREIGN KEY (fkEmpresa)
			REFERENCES empresa (idEmpresa),
		CONSTRAINT fkParametroEstufa FOREIGN KEY (fkParametro)
			REFERENCES parametro (idParametro)
);
	

CREATE TABLE sensor (
	idSensor INT,
    nome VARCHAR (45),
    fkEstufa INT,
	PRIMARY KEY (idSensor, fkEstufa),
	FOREIGN KEY (fkEstufa) REFERENCES estufa (idEstufa)
);
            
            
CREATE TABLE dados (
	idDados INT,
    temperatura DECIMAL (4, 2),
    umidade DECIMAL (4, 2),
    horario DATETIME,
    fkSensor INT,
		PRIMARY KEY (idDados, fkSensor),
	FOREIGN KEY (fkSensor) REFERENCES sensor (idSensor)
);
            
SHOW TABLES;  
  
SELECT * FROM usuario;
SELECT * FROM endereco;
SELECT * FROM empresa;
SELECT * FROM tipoUsuario;
SELECT * FROM parametro;
SELECT * FROM estufa;
SELECT * FROM sensor;
SELECT * FROM dados;
            
SHOW TABLES;




