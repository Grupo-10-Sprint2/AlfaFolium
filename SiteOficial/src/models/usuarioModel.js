var database = require("../database/config")

function autenticar(email, senha) {
    var instrucaoSql = `
        SELECT id, nome, email, fk_empresa as empresaId FROM Usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrar(CPF, Nome, Email, TelFixo, TelCelular, idEmpresa) {
    var instrucaoSql = `
        INSERT INTO Usuario (CPF, Nome, Email, Senha, TelFixo, TelCelular, fkEmpresa, DataCriacao) VALUES ('${CPF}', '${Nome}', '${Email}', '${idEmpresa+CPF}', '${TelFixo}', '${TelCelular}', '${idEmpresa}', now());
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar
};