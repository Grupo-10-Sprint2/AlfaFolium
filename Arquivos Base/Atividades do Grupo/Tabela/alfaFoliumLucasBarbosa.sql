-- criando o banco de dados
CREATE DATABASE alfa_folium;

-- selecionando o banco de dados para uso
USE alfa_folium;

-- criando a tabela estufa
CREATE TABLE Estufa (
idEstufa int primary key auto_increment,
nome VARCHAR(40),
responsavel VARCHAR(40),
temperaturaAtual int,
umidadeAtual int,
qtdUnidadeDeAlface int,
tipoAlface Varchar(15),
constraint chkTipoAlface check (tipoAlface in('americana', 'crespa')),
localidade Varchar(40)
);

-- inserindo resgistros na tabela
INSERT INTO Estufa VALUES 
(default, 'estufa A', 'José', 18, 60, 100, 'crespa', 'Fazenda Amaral'),
(default, 'estufa B', 'José', 26, 40, 200, 'americana', 'Vale do Alface'),
(default, 'colheita-ala-1', 'Teresa', 14, 84, 150, 'crespa', 'Fazenda boa colheita'),
(default, 'colheita-ala-3', 'Teresa', 16, 65, 50, 'crespa', 'Fazenda boa colheita');

-- conferindo todos os dados da tabela
SELECT * FROM Estufa;

-- exibindo apenas o nome, a temperatura atual, a umidade atual, quantidade de unidades de alface e a localidade das estufas
SELECT nome, temperaturaAtual, umidadeAtual, qtdUnidadeDeAlface, localidade FROM Estufa;

-- exibindo apenas o nome, a temperatura atual, a umidade atual e a quantidade de unidades de alface e a localidade das estufas de um unico responsável
SELECT nome, temperaturaAtual, umidadeAtual, qtdUnidadeDeAlface, localidade FROM Estufa WHERE responsavel = 'Teresa';

-- atualizando a temperatura de uma estufa
UPDATE Estufa SET temperaturaAtual = 17 WHERE idEstufa = 2;

-- atualizando a umidade de uma estufa
UPDATE Estufa SET umidadeAtual = 50 WHERE idEstufa = 2;

-- atualizando a quantidade de alfaces na estufa
UPDATE Estufa SET qtdUnidadeDeAlface = 100 WHERE idEstufa = 4;

-- atualizando o nome do responsavel das estufas
UPDATE Estufa SET responsavel = 'José Clegane' WHERE idEstufa in(1,2);

-- atualizando o nome da estufa
UPDATE Estufa SET nome = 'colheita-ala-2' WHERE idEstufa = 4;

-- atualizando a localidade das estufas
UPDATE Estufa SET localidade = 'Fazenda São José' WHERE idEstufa = 2;

-- removendo uma estufa
DELETE FROM Estufa WHERE idEstufa = 2;

-- adicionando o campo "situação da estufa", após a escolha do grupo
ALTER TABLE Estufa ADD COLUMN situacaoSensor VARCHAR(12);

-- adicionando um check para a situação
ALTER TABLE Estufa ADD CONSTRAINT chksitucaoSensor check (situacaoSensor in('funcionando', 'quebrado'));

-- atualizando a situação dos sensores 
UPDATE Estufa SET situacaoSensor = 'funcionando' WHERE idEstufa in(1,3, 4);

-- verificando o nome, responsável, a temperatura atual, a umidade atual, a quantidade de unidades de alface, tipo de alface, a localidade e a situaçâo do sensor
SELECT nome, responsavel, temperaturaAtual, umidadeAtual, qtdUnidadeDeAlface, tipoAlface, localidade, situacaoSensor FROM Estufa;

-- adicionando novos dados
INSERT INTO Estufa VALUES 
(default, 'safra-um', 'Maria', 21, 70, 400, 'americana', 'Fazenda dos Silva', 'quebrado');

-- exibindo os dados da das estufas cujo sensor esta quebrados
SELECT * FROM Estufa WHERE situacaoSensor = 'quebrado';

-- exibindo os dados das estufas cujo sensor está funcionando
SELECT * FROM Estufa WHERE situacaoSensor = 'funcionando';


-- criando a tabela usuário
CREATE TABLE Usuario (
idUsuario int primary key auto_increment,
nome varchar(40),
email varchar(60) not null,
senha varchar(40) not null,
cpf varchar(11),
rne varchar(8),
cnpj varchar(15),
qtdEstufas int
);

-- inserindo dados na tabela
INSERT INTO Usuario(nome,email,senha,cpf,rne,cnpj,qtdEstufas) VALUES
('JoãoClegane', 'cleganemontanha@gmail.com', 'SenHa123', '12345678901', null, '12345678909321', 3), 
('Teresa Oliveira', 'oliveira@gmailcom', '12345', null, 'A1234567', null, 2),
('Lucas Barbosa', 'lukas34@gmailcom', 'Alface11', '09876543212', null, '098765433210098', 0);

-- conferindo todos os dados da tabela
SELECT * FROM Usuario;

-- Exibindo apenas o nome, email, cpf, cnpj e quantidade de estufas do usuário
SELECT nome, email, cpf, cnpj,qtdEstufas FROM Usuario;

-- Exibindo o email e quantidade de estufas de apenas uma pessoa
SELECT email,qtdEstufas FROM Usuario WHERE idUsuario = 2;

-- Atualizando o nome do usuario
UPDATE Usuario SET nome = 'Lucas Gueff' WHERE idUsuario =  3;

-- Atualizando a senha do usuario
UPDATE Usuario SET senha = '56899' WHERE idUsuario = 1;

-- Atualizando a quantidade de estufas do usuario
UPDATE Usuario SET qtdEstufas = 1 WHERE idUsuario = 3;

-- Deletando um usuario
DELETE FROM Usuario WHERE idUsuario = 2; 

-- criando a tabela Alface
CREATE TABLE Alface (
idAlface int primary key auto_increment,
tipo varchar(20),
temperaturaMinimaIdeal int,
temperaturaMaximaIdeal int,
umidadeMinimaIdeal int,
umidadeMaximaIdeal int
);

-- inserindo valores na tabela de alface
INSERT INTO Alface VALUES
(default, 'americana', 14, 24, 30, 50),
(default, 'crespa', 16, 27, 40, 70);

-- conferindo todos os dados da tabela
SELECT * FROM Alface;

-- conferindo apenas o tipo, a temperatura minima e maxima ideais
SELECT tipo, temperaturaMinimaIdeal, temperaturaMaximaIdeal FROM Alface;

-- conferindo apenas o tipo, a umidade minima e maxima ideais
SELECT tipo, umidadeMinimaIdeal, umidadeMaximaIdeal FROM Alface;
