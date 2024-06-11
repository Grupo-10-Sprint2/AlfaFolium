var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    let email = req.body.emailServer;
    let senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`);

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                        res.json({
                            idUsuario: resultadoAutenticar[0].idUsuario,
                            nome: resultadoAutenticar[0].nomeUsuario,
                            email: resultadoAutenticar[0].emailUsuario,
                            CPFUsuario: resultadoAutenticar[0].CPFUsuario,
                            telFixo: resultadoAutenticar[0].telFixoUsuario,
                            telCelular: resultadoAutenticar[0].telCelularUsuario,
                            dataCriacao: resultadoAutenticar[0].dataCriacaoUsuario,
                            idEmpresa: resultadoAutenticar[0].empresaUSuario,
                            idTipoUsuario: resultadoAutenticar[0].idTipoUsuario,
                            nomeEmpresa: resultadoAutenticar[0].nomeEmpresa,
                            funcao: resultadoAutenticar[0].funcaoUsuario
                        });

                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function usuariosCadastrados(req, res) {    
        usuarioModel.usuariosCadastrados()
            .then(function (resultado) {
                    if (resultado.length >= 1) {
                        console.log(resultado);
                        res.status(200).json(resultado)
                    } else if (resultado.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

function cadastrar(req, res) {
    let nome = req.body.nomeServer
    let email = req.body.emailServer;
    let cpf = req.body.cpfServer;
    let telFixo = req.body.telFixoServer;
    let telCel = req.body.telCelServer;
    let idEmpresa = req.body.idEmpresaServer;
    let idTipoUsuario = req.body.idTipoUsuarioServer;

    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está indefinido!");
    } else if (cpf == undefined) {
        res.status(400).send("Seu cpf está indefinido!");
    } else if (telFixo == undefined) {
        res.status(400).send("Seu telefone fixo está indefinido!");
    } else if (telCel == undefined) {
        res.status(400).send("Seu telefone celular está indefinido!");
    } else if (idEmpresa == undefined) {
        res.status(400).send("Sua empresa está indefinido!");
    } else if (idTipoUsuario == undefined) {
        res.status(400).send("Sua função está indefinida!");
    } else {

        usuarioModel.cadastrar(nome, cpf, email, telFixo, telCel, idEmpresa, idTipoUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}




module.exports = {
    autenticar,
    cadastrar,
    usuariosCadastrados
}