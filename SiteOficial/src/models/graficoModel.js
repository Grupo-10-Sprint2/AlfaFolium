var database = require("../database/config")

function coletarTemperaturaUmidade(req, res) {
    var instrucaoSql = `
        select * from dados;';
        `

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    coletarTemperaturaUmidade
};