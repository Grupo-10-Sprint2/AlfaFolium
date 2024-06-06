var empresaModel = require("../models/empresaModel");


function cadastrar(req, res) {
  var nome = req.body.nomeServer;
  var CNPJ = req.body.cnpjServer;
  var CEP = req.body.cepServer;
  var numero = req.body.numeroServer;

  if (nome == undefined) {
    res.status(400).send("Seu nome está undefined!");
  } else if (CNPJ == undefined) {
    res.status(400).send("Seu CNPJ está undefined!");
  } else if (CEP == undefined) {
    res.status(400).send("Seu CEP está undefined!");
  } else if (numero == undefined) {
    res.status(400).send("O numero da sua empresa está undefined!");
  } else {

    empresaModel.cadastrar(nome, CNPJ, CEP, numero)
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

function listar(req, res) {
  empresaModel.listar()
      .then(function (resultado) {
          res.json(resultado);
      })
      .catch(function (erro) {
          console.log(erro);
          res.status(500).json(erro.sqlMessage);
      });
}

module.exports = {
  cadastrar,
  listar
};
