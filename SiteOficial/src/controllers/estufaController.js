var estufaModel = require("../models/estufaModel");

function cadastrar(req, res) {
    var tamanhoEstufa = req.body.tamanhoServer;
    var statusEstufa = req.body.statusServer;
    var idEmpresa = req.body.empresaServer;
    var TempMaxima = req.body.TempMaximaServer;
    var TempMinima = req.body.TempMinimaServer;
    var UmidMaxima = req.body.UmidMaximaServer;
    var UmidMinima = req.body.UmidMinimaServer;
      
    
    if (tamanhoEstufa == undefined) {
      res.status(400).send("O tamanho da estufa está undefined!");
    } else if (statusEstufa == undefined) {
      res.status(400).send("O status da estufa está undefined!");
    } else if (idEmpresa == undefined) {
      res.status(400).send("A empresa da estufa está undefined!");
    } else if (TempMaxima == undefined) {
      res.status(400).send("A temperatura maxima da estufa está undefined!");
    } else if (TempMinima == undefined) {
        res.status(400).send("A temperatura minima da estufa está undefined!");
    } else if (UmidMaxima == undefined) {
        res.status(400).send("A umidade maxima da estufa está undefined!");
    } else if (UmidMinima == undefined) {
        res.status(400).send("A umidade maxima da estufa está undefined!");
    } 
    
    else {
  
      estufaModel.cadastrar(tamanhoEstufa, statusEstufa, idEmpresa, TempMaxima, TempMinima, UmidMaxima, UmidMinima)
        .then(function (resultadoCadastrar) {
          res.json(resultadoCadastrar);

        })
        .catch(function (erro) {
          console.log(erro);
          console.log(
            "\nHouve um erro ao realizar o cadastro! Erro: ",
            erro.sqlMessage
          );
          res.status(500).json(erro.sqlMessage);
        })
    }
  }


module.exports = {
    cadastrar,
}