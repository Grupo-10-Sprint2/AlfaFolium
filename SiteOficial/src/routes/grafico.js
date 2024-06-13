var express = require("express");
var router = express.Router();

var graficoController = require("../controllers/graficoController");

router.get("/coletarTemperaturaUmidade", function (req, res) {
    graficoController.coletarTemperaturaUmidade(req, res);
});

module.exports = router;
