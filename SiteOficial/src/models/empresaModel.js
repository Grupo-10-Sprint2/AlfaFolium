var database = require("../database/config");


function cadastrar(nome, CNPJ, CEP, numero) {
    var instrucaoSql = `
        INSERT INTO endereco (CEP, numEnd) VALUES ('${CEP}', '${numero}');
    `;
    
    return database.executar(instrucaoSql)

        .then(result => {
            var idEndereco = result.insertId;
            var instrucaoSql = `
                INSERT INTO empresa (nome, CNPJ, fkEndereco) VALUES ('${nome}', '${CNPJ}', ${idEndereco});
            `;
            return database.executar(instrucaoSql);
        });
}


function listar() {
    var instrucaoSql = `SELECT idEmpresa, nome FROM empresa;`;
    return database.executar(instrucaoSql);
}


module.exports = {
    cadastrar,
    listar
};
