var database = require("../database/config")



function autenticar(email, senha) {
    var instrucaoSql = `
        SELECT idUsuario, nome, CPF, email, telFixo, telCelular, dataCriacao, fkEmpresa, fkTipoUsuario FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



function cadastrar(nome, CPF, email, telFixo, telCelular, idEmpresa, idTipoUsuario) {
    var instrucaoSql = `
        INSERT INTO usuario (nome, CPF, email, senha, telFixo, telCelular, dataCriacao, fkEmpresa, fkTipoUsuario) VALUES ('${nome}', '${CPF}', '${email}', 'AF#${CPF}', '${telFixo}', '${telCelular}', now(), '${idEmpresa}', '${idTipoUsuario}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



module.exports = {
    autenticar,
    cadastrar
};


