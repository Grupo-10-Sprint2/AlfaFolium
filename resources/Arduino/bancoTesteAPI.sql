CREATE DATABASE dadosSensores;

USE dadosSensores;

CREATE TABLE temperaturaUmidade (
	dht11_umidade decimal(4,2),
    dht11_temperatura decimal(4,2),
    momento datetime
); 


    
SELECT * FROM temperaturaUmidade;

