var database = require("../database/config")



function autenticar(email, senha) {
    var instrucaoSql = `
        SELECT u.idUsuario as idUsuario, u.nome as nomeUsuario, u.CPF as CPFUsuario, u.email as emailUsuario, u.telFixo as telFixoUsuario, u.telCelular as telCelularUsuario, u.dataCriacao as dataCriacaoUsuario, u.fkEmpresa as empresaUSuario, u.fkTipoUsuario as idTipoUsuario , e.nome as nomeEmpresa, t.tipo as funcaoUsuario
        FROM tipoUsuario as t JOIN usuario as u
		ON t.idTipoUsuario = u.fkTipoUsuario
        JOIN empresa as e
        ON u.fkEmpresa = e.idEmpresa
        WHERE email = '${email}' 
        AND senha = sha2('${senha}', 256)  
        `
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



function cadastrar(nome, CPF, email, telFixo, telCelular, idEmpresa, idTipoUsuario) {
    var instrucaoSql = `
        INSERT INTO usuario (nome, CPF, email, senha, telFixo, telCelular, dataCriacao, fkEmpresa, fkTipoUsuario) VALUES ('${nome}', '${CPF}', '${email}', sha2('AF#${CPF}', 256), '${telFixo}', '${telCelular}', now(), '${idEmpresa}', '${idTipoUsuario}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function infoEstufas(idUsuario) {
    var instrucaoSql = `
    SELECT COUNT( e.idEstufa) AS quantidadeEstufas
    FROM estufa e
    JOIN sensor s ON e.idEstufa = s.fkEstufa
    JOIN dados d ON s.idSensor = d.fkSensor
    WHERE d.temperatura > 28 AND d.umidade > 30; 
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function infoEstufasAtencao(idUsuario) {
    var instrucaoSql = `
    SELECT COUNT( e.idEstufa) AS quantidadeEstufas
    FROM estufa e
    JOIN sensor s ON e.idEstufa = s.fkEstufa
    JOIN dados d ON s.idSensor = d.fkSensor
    WHERE d.temperatura > 26 AND d.umidade > 28; 
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



module.exports = {
    autenticar,
    cadastrar,
    infoEstufas,
    infoEstufasAtencao
};


