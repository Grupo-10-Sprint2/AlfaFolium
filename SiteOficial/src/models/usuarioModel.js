var database = require("../database/config")

function coletarTemperaturaUmidade(req, res) {
    var instrucaoSql = `
    SELECT dados.*,
	condicao AS condicao,
    umidadeMin,
    umidadeMax,
    temperaturaMin,
    temperaturaMax FROM dados JOIN sensor
    ON dados.fkSensor = sensor.idSensor JOIN estufa
    ON sensor.fkEstufa = estufa.idEstufa JOIN parametro
    ON estufa.fkParametro = parametro.idParametro
    ORDER BY idDados DESC
    LIMIT 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function autenticar(email, senha) {
    var instrucaoSql = `
        SELECT u.idUsuario as idUsuario, u.nome as nomeUsuario, u.CPF as CPFUsuario, u.email as emailUsuario, u.telFixo as telFixoUsuario, u.telCelular as telCelularUsuario, u.dataCriacao as dataCriacaoUsuario, u.fkEmpresa as empresaUsuario, u.fkTipoUsuario as idTipoUsuario , e.nome as nomeEmpresa, t.tipo as funcaoUsuario
        FROM tipoUsuario as t JOIN usuario as u
		ON t.idTipoUsuario = u.fkTipoUsuario
        JOIN empresa as e
        ON u.fkEmpresa = e.idEmpresa
        WHERE email = '${email}' 
        AND senha = sha2('${senha}', 256);
        `    
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function totalEmpresas(req, res) {
    var instrucaoSql = `
        SELECT COUNT(idEmpresa) as totalEmpresa FROM empresa WHERE nome != 'Alfa Folium';
        `

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function usuariosAtivos(req, res) {
    var instrucaoSql = `
    SELECT COUNT(idUsuario) AS totalUsuariosAtivos
    FROM usuario WHERE fkTipoUsuario > 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function estufasCadastradas(req, res) {
    var instrucaoSql = `
        SELECT COUNT(idEstufa) AS totalEstufasCadastradas from estufa;
        `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function usuariosCadastrados(req, res) {
    var instrucaoSql = `
        select u.idUsuario,
        u.nome as nome,
        u.email as email,
        u.cpf as cpf,
        u.telFixo, telFixo, 
        u.telCelular as telCelular,
        e.nome as nomeEmpresa,
        t.tipo as funcao
        from usuario as u join empresa as e
        on u.fkEmpresa = e.idEmpresa join tipoUsuario as t
        on u.fkTipoUsuario = t.idTipoUsuario
        where u.fkTipoUsuario > 1;
        `

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



function cadastrar(nome, CPF, email, telFixo, telCelular, idEmpresa, idTipoUsuario) {
    var instrucaoSql = `
        INSERT INTO usuario (nome, CPF, email, senha, telFixo, telCelular, dataCriacao, fkEmpresa, fkTipoUsuario) VALUES ('${nome}', '${CPF}', '${email}', sha2('AF#${CPF}', 256), '${telFixo}', '${telCelular}', now(), '${idEmpresa}', '${idTipoUsuario}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function infoEstufas(idUsuario) {
    var instrucaoSql = `
    SELECT COUNT( e.idEstufa) AS quantidadeEstufas
    FROM estufa e
    JOIN sensor s ON e.idEstufa = s.fkEstufa
    JOIN dados d ON s.idSensor = d.fkSensor
    WHERE (d.temperatura < 17 OR d.temperatura > 21) OR (d.umidade < 72 OR d.umidade > 78); 
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function infoEstufasAtencao() {
    var instrucaoSql = `
    SELECT COUNT( e.idEstufa) AS quantidadeEstufas
    FROM estufa e
    JOIN sensor s ON e.idEstufa = s.fkEstufa
    JOIN dados d ON s.idSensor = d.fkSensor
    WHERE ((d.temperatura >= 16 AND d.temperatura <= 15) OR (d.temperatura >= 19 AND d.temperatura <= 20)) AND ((d.umidade >= 73 AND d.umidade <= 74) OR (d.umidade >= 76 AND d.umidade <= 77)); 
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

<<<<<<< Updated upstream
=======



>>>>>>> Stashed changes
module.exports = {
    autenticar,
    cadastrar,
    infoEstufas,
    infoEstufasAtencao,
    usuariosCadastrados,
    totalEmpresas,
    usuariosAtivos,
    estufasCadastradas,
    coletarTemperaturaUmidade
};





