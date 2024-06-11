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

INSERT INTO empresa (nome) VALUES
	('Alfa Folium');

        
CREATE TABLE tipoUsuario (
	idTipoUsuario INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(45),
    descricao VARCHAR(200),
    CONSTRAINT chkTipoUsuario CHECK (tipo IN ('Master', 'Dono', 'Funcionario'))
);
ALTER TABLE tipoUsuario MODIFY COLUMN descricao VARCHAR (400);

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

            
  
SELECT * FROM usuario;
SELECT * FROM endereco;
SELECT * FROM empresa;
SELECT * FROM tipoUsuario;
SELECT * FROM parametro;
SELECT * FROM estufa;
SELECT * FROM sensor;
SELECT * FROM dados;
            



SELECT u.idUsuario as idUsuario, u.nome as nomeUsuario, u.CPF as CPFUsuario, u.email as emailUsuario, u.telFixo as telFixoUsuario, u.telCelular as telCelularUsuario, u.dataCriacao as dataCriacaoUsuario, u.fkEmpresa as empresaUSuario, u.fkTipoUsuario as idTipoUsuario , e.nome as nomeEmpresa, t.tipo as tipoUsuario
        FROM tipoUsuario as t JOIN usuario as u
		ON t.idTipoUsuario = u.fkTipoUsuario
        JOIN empresa as e
        ON u.fkEmpresa = e.idEmpresa;
        
SELECT u.idUsuario as idUsuario, u.nome as nomeUsuario, u.CPF as CPFUsuario, u.email as emailUsuario, u.telFixo as telFixoUsuario, u.telCelular as telCelularUsuario, u.dataCriacao as dataCriacaoUsuario, u.fkEmpresa as empresaUSuario, u.fkTipoUsuario as idTipoUsuario , e.nome as nomeEmpresa, t.tipo as funcaoUsuario
        FROM tipoUsuario as t JOIN usuario as u
		ON t.idTipoUsuario = u.fkTipoUsuario
        JOIN empresa as e
        ON u.fkEmpresa = e.idEmpresa
        WHERE email = 'guilherme@gmail.com' 
        AND senha = 'AF#120.125.486-51';  
        
        SELECT COUNT( e.idEstufa) AS quantidadeEstufas
		FROM estufa e
		JOIN sensor s ON e.idEstufa = s.fkEstufa
		JOIN dados d ON s.idSensor = d.fkSensor
		WHERE d.temperatura > 28 AND d.umidade > 30; 


