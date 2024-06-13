var database = require("../database/config")

function coletarTemperatura(req, res) {
    var instrucaoSql = `
        SELECT COUNT(idEmpresa) as totalEmpresa FROM empresa WHERE nome != 'Alfa Folium';
        `

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    coletarTemperatura
};