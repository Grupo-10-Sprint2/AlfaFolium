var express = require("express");
var router = express.Router();

var estufaController = require("../controllers/estufaController");

router.post("/cadastrar", function (req, res) {
    estufaController.cadastrar(req, res);
})


module.exports = router;