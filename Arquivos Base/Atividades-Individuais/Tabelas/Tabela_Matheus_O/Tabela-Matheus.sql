CREATE TABLE cliente (
idCliente int primary key auto_increment,
nome varchar (50) NOT NULL,
senha varchar (20) NOT NULL,
cpf char (11) NOT NULL DEFAULT 'Possui rne',
rne char (8) NOT NULL DEFAULT 'Possui cpf',
celular char (9) NOT NULL,
email varchar (50) NOT NULL
);

CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
nomeEmpresa varchar (40) NOT NULL,
enderecoEmpresa varchar (50) NOT NULL,
numeroSede varchar (10) NOT NULL,
cnpjEmpresa char (14) NOT NULL
);

CREATE TABLE estufa (
idAlface int primary key auto_increment,
tipo varchar (15) NOT NULL CONSTRAINT chkTipo CHECK (tipo IN('Crespa', 'Americana', 'Ambas')),
tamanho varchar (20),
temperatura decimal (4,2),
humidade int
);

INSERT INTO cliente (nome, senha, cpf, rne, celular, email) VALUES
	('Paulo', 'UD*(CASMnicas', '53987562414', '876110867', '897560251', 'Paulo.s@gmail.com');
    
SELECT * FROM cliente;

INSERT INTO empresa (nomeEmpresa, enderecoEmpresa, numeroSede, cnpjEmpresa) VALUES
	('Agro', 'Rua Inventada, Loucura, SP', '57', '46131350478203');
    
SELECT * FROM empresa;

INSERT INTO estufa (tipo, tamanho, temperatura, humidade) VALUES
	('Crespa', '50 Km²', '23', '80');
    
SELECT * FROM estufa;