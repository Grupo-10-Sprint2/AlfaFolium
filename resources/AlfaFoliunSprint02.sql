CREATE DATABASE AlfaFolium;

USE AlfaFolium;

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    CEP CHAR(9),
    numEnd VARCHAR(10)
);


CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    CNPJ CHAR (18),
    fkEndereco INT,
		CONSTRAINT fkEnderecoEmpresa FOREIGN KEY (fkEndereco)
			REFERENCES endereco(idEndereco)
);

-- Empresa padrão para que os donos do projeto possam acessar:
INSERT INTO empresa (nome, CNPJ) VALUES
	('Alfa Folium', '21.886.895/0001-83');

        
CREATE TABLE tipoUsuario (
	idTipoUsuario INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(45),
    descricao VARCHAR(200),
    CONSTRAINT chkTipoUsuario CHECK (tipo IN ('Master', 'Dono', 'Funcionario'))
);


-- Insert das funções pré-definidas:
INSERT INTO tipoUsuario (tipo,descricao) VALUES 
	('Master', 'Usuários pertencententes a equipe de desenvolvimento e produção'),
    ('Dono', 'Usuário/Cliente responsável pelo controle total da plataforma através da aplicação desenvolvida'),
    ('Funcionario', 'Usuário responsável pelo controle parcial da plataforma para análises e tomada de decisoes');
    

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    CPF CHAR (14),
    email VARCHAR (45),
    senha VARCHAR(200),
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


-- Insert dos usuários master:
insert into usuario values
	(default, 'Diogo Polastrine', '131.872.938-67', 'diogoP@alfa.folium', sha2('AF#13187293867',256), '(11)2393-1191','(11)98735-4411','2024-06-14',1,1),
    (default, 'Kauan França', '283.994.182-74', 'kauanF@alfa.folium', sha2('AF#28399418274',256), '(11)2643-6112','(11)97125-6421','2024-06-14',1,1),
    (default, 'Anilmar Choque', '494.102.588-23', 'anilms@alfa.folium', sha2('AF#49410258823',256), '(11)2566-1844','(11)91029-6761','2024-06-14',1,1),
    (default, 'Giovanna Gomes', '858.318.755-21', 'giGomes@alfa.folium', sha2('AF#85831875521',256), '(11)2401-1293','(11)97774-1745','2024-06-14',1,1),
    (default, 'Kauan Marques', '948.181.823-75', 'kauanMarques@alfa.folium', sha2('AF#94818182375',256), '(11)2155-6533','(11)99423-1698','2024-06-14',1,1),
    (default, 'Guilherme Neris', '133.884.854-94', 'guiNeris@alfa.folium', sha2('AF#13388485494',256), '(11)2112-2325','(11)91553-0943','2024-06-14',1,1);


CREATE TABLE parametro (
	idParametro INT PRIMARY KEY AUTO_INCREMENT,
    umidadeMin DECIMAL (4, 2),
    umidadeMax DECIMAL (4, 2),
    temperaturaMin DECIMAL (4, 2),
    temperaturaMax DECIMAL (4, 2)
); 	


CREATE TABLE estufa (
	idEstufa INT PRIMARY KEY AUTO_INCREMENT,
	tamanho INT,
	status VARCHAR (25),
    condicao VARCHAR(25),
    fkEmpresa INT, 
	fkParametro INT,
		CONSTRAINT chkCondicao CHECK (condicao IN ('Estavel', 'Atencao', 'Alerta')),
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
	idDados INT AUTO_INCREMENT,
    temperatura DECIMAL (4, 2),
    umidade DECIMAL (4, 2),
    horario DATETIME,
    fkSensor INT,
		PRIMARY KEY (idDados, fkSensor),
	FOREIGN KEY (fkSensor) REFERENCES sensor (idSensor)
);



SELECT * FROM usuario;
SELECT * FROM endereco;
SELECT * FROM empresa;
SELECT * FROM tipoUsuario;
SELECT * FROM parametro;
SELECT * FROM estufa;
SELECT * FROM sensor;
SELECT * FROM dados;
            
SHOW TABLES;

INSERT INTO dados VALUES
	(default, '23', '60', '2024-06-14 02:45:25', 1);