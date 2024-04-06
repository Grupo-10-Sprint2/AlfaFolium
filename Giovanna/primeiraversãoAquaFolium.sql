CREATE DATABASE alfa;

USE alfa;

CREATE TABLE Login (
Email VARCHAR (264),
Senha CHAR (8));

INSERT INTO Login VALUES (
'gigigomes@sptech.school.',12345678),
("polastrine@sptech.school",01234567);

	SELECT*FROM Login;
    
    CREATE TABLE cadastroCliente (
    idUsuário INT PRIMARY KEY,
    nome VARCHAR(45),
    dtNasc DATE,
    cpf CHAR (11),
    rg  CHAR (9),
    telefone VARCHAR (15),
    email VARCHAR (264),
    senha CHAR (8));
    
    INSERT INTO cadastroCliente VALUES (1,'Giovanna','2004-12-15',50825655838,123456789,11914002789,'giovanna37@gmail.com','12345678');
     INSERT INTO cadastroCliente VALUES (2,'Jéssica','1996-10-07',50825655789,123456780,11914002784,'jessica@gmail.com','12345676');
     
     SELECT*FROM cadastroCliente;
     
     CREATE TABLE cadastroEmpresa(idempresa INT PRIMARY KEY,
     nome VARCHAR (45),
     estado VARCHAR (20),
     rua VARCHAR (30),
     bairro VARCHAR(20),
     numero VARCHAR (10),
     cnpj CHAR (14),
     representante VARCHAR (45));
     
     INSERT INTO cadastroEmpresa VALUES (1,'AlfaFolium','São Paulo','Bonito Nogueira','Limão',123,12345678914785,'Maurício'),
     (2,'AquaTech','Rio De Janeiro','Joaquim Morais','Avenida Brasil',234,12345678978920,'Júlia');
     
         SELECT * FROM cadastroEmpresa;

     
     
     CREATE TABLE Estufas (idEstufa INT PRIMARY KEY,
     UnidadePlantada VARCHAR (20));
     
     
     INSERT INTO Estufas VALUES (1,500),
     (2,2000);
         SELECT * FROM Estufas;

     
     CREATE TABLE Representante (idRepresentante INT PRIMARY KEY,
     nome VARCHAR (45),
     empresa VARCHAR (45),
     telefone VARCHAR (15));
     
     INSERT INTO Representante VALUES (1,'Renata','AquaTech',11914008563),
     (2,'João','AlfaFolium',12345108796);
     
         SELECT * FROM Representante ;

     
     CREATE TABLE Dasboard (idEstufa INT PRIMARY KEY,
     Temperatura CHAR (4),
     Umidade CHAR (4),
     RegistrosAnteriores CHAR (4),
     Alteracoes CHAR (12));
     
	INSERT INTO Dasboard VALUES (1,28.3,45.6,67.9,90.7);
    
    SELECT * FROM Dasboard;
    
    
