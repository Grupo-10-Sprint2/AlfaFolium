var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
});

router.get("/totalEmpresas", function (req, res) {
    usuarioController.totalEmpresas(req, res);
});

router.get("/usuarios/usuariosAtivos", function (req, res) {
    usuarioController.usuariosAtivos(req, res);
})

router.get("/usuariosCadastrados", function (req, res) {
    usuarioController.usuariosCadastrados(req, res);
});

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.post("/infoEstufas", function (req, res) {
    usuarioController.infoEstufas(req, res);
});

router.post("/infoEstufasAtencao", function (req, res) {
    usuarioController.infoEstufas(req, res);
});

module.exports = router;