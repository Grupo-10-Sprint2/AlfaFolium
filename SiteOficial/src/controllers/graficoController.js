var graficoModel = require("../models/graficoModel");

function coletarTemperaturaUmidade(req, res) {
    graficoModel.coletarTemperaturaUmidade()
            .then(function (resultado) {
                    if (resultado.length >= 0) {
                        console.log(`DEU CERTO`);
                        console.log(resultado);
                        res.status(200).json(resultado);
                    } else {
                        console.log(`DEU ERRO AQUI`);
                        res.status(403).send("Nenhum dado encontrado.");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao coletar dados! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
}

module.exports = {
    coletarTemperaturaUmidade
}