var graficoModel = require("../models/graficoModel");

function coletarTemperatura(req, res) {
    graficoModel.coletarTemperatura()
            .then(function (resultado) {
                    if (resultado.length >= 1) {
                        console.log(resultado);
                        res.status(200).json(resultado);
                    } else {
                        res.status(403).send("Nenhuma empresa encontrada.");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao procurar empresas! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
}

module.exports = {
    coletarTemperatura
}