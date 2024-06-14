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
                            idEmpresa: resultadoAutenticar[0].empresaUsuario,
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

function totalEmpresas(req, res) {
    usuarioModel.totalEmpresas()
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

function usuariosAtivos(req, res) {
    usuarioModel.usuariosAtivos()
            .then(function (resultado) {
                    if (resultado.length >= 1) {
                        console.log(resultado);
                        res.status(200).json(resultado);
                    } else {
                        res.status(403).send("Nenhum usuário encontrado.");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao procurar usuários! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
}

function estufasCadastradas(req, res) {    
    usuarioModel.estufasCadastradas()
        .then(function (resultado) {
                if (resultado.length >= 1) {
                    console.log(resultado);
                    res.status(200).json(resultado)
                } else {
                    res.status(403).send("Nenhuma estufa encontrada.");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao procurar estufas! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function usuariosCadastrados(req, res) {    
        usuarioModel.usuariosCadastrados()
            .then(function (resultado) {
                    if (resultado.length >= 1) {
                        console.log(resultado);
                        res.status(200).json(resultado)
                    } else {
                        res.status(403).send("Nenhum usuário encontrado.");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao procurar usuários! Erro: ", erro.sqlMessage);
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

function infoEstufas(req, res) {
    usuarioModel.infoEstufas()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.json({ estufasCount: resultado[0].quantidadeEstufas });
            } else {
                res.status(404).json({ message: "Nenhum dado encontrado" });
            }
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao realizar a busca! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}
function infoEstufasAtencao(req, res) {
    usuarioModel.infoEstufasAtencao()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.json({ estufasCount: resultado[0].quantidadeEstufas });
            } else {
                res.status(404).json({ message: "Nenhum dado encontrado" });
            }
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao realizar a busca! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

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


function listarEstufas(req, res) {    
    let idUsuario = req.body.idUsuarioServer;
    let idEmpresa = req.body.idEmpresaServer;

    usuarioModel.listarEstufas(idEmpresa,idUsuario)
        .then(function (resultado) {
                if (resultado.length >= 1) {
                    console.log(resultado);
                    res.status(200).json(resultado)
                } else {
                    res.status(403).send("Nenhum usuário encontrado.");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao procurar usuários! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}




module.exports = {
    autenticar,
    cadastrar,
    usuariosCadastrados,
    infoEstufas,
    infoEstufasAtencao,
    totalEmpresas,
    usuariosAtivos,
    estufasCadastradas,
    coletarTemperaturaUmidade,
    listarEstufas
}
