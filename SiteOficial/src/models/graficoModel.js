var database = require("../database/config")

function coletarTemperaturaUmidade(req, res) {
    var instrucaoSql = `
    SELECT dados.*,
    umidadeMin,
    umidadeMax,
    temperaturaMin,
    temperaturaMax FROM dados JOIN sensor
    ON dados.fkSensor = sensor.idSensor JOIN estufa
    ON sensor.fkEstufa = estufa.idEstufa JOIN parametro
    ON estufa.fkParametro = parametro.idParametro
    ORDER BY idDados DESC
    LIMIT 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    coletarTemperaturaUmidade
};