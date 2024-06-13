var express = require("express");
var router = express.Router();

var graficoController = require("../controllers/graficoController");

router.get("/coletarTemperatura", function (req, res) {
    graficoController.coletarTemperatura(req, res);
});

module.exports = router;
