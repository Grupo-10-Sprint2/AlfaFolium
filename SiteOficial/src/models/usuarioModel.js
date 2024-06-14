var database = require("../database/config")

function coletarTemperaturaUmidade(req, res) {
    var instrucaoSql = `
    SELECT dados.*,
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
        SELECT COUNT(idEstufa) AS totalEstufasCadastradas from estufa WHERE fkEmpresa > 1;
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
        where u.fkTipoUsuario > 1 AND e.nome != 'Alfa Folium';
        `

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



function cadastrar(nome, CPF, email, telFixo, telCelular, idEmpresa) {
    var instrucaoSql = `
        INSERT INTO usuario (nome, CPF, email, senha, telFixo, telCelular, dataCriacao, fkEmpresa, fkTipoUsuario) VALUES ('${nome}', '${CPF}', '${email}', sha2('AF#${CPF.slice(0,3)+CPF.slice(4,7)+CPF.slice(8,11)+CPF.slice(12,14)}', 256), '${telFixo}', '${telCelular}', now(), '${idEmpresa}', 2);
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrarFuncionario(nome, CPF, email, telFixo, telCelular, idEmpresa) {
    var instrucaoSql = ` 
        INSERT INTO usuario (nome, CPF, email, senha, telFixo, telCelular, dataCriacao, fkEmpresa, fkTipoUsuario) VALUES ('${nome}', '${CPF}', '${email}', sha2('AF#${CPF.slice(0,3)+CPF.slice(4,7)+CPF.slice(8,11)+CPF.slice(12,14)}', 256), '${telFixo}', '${telCelular}', now(), '${idEmpresa}', 3);
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

function listarEstufas(idEmpresa,idUsuario) {
    var instrucaoSql = `
    SELECT e.*, s.idSensor, d.*, umidadeMin, umidadeMax, temperaturaMin, temperaturaMax FROM estufa e
    JOIN empresa ON e.fkEmpresa = empresa.idEmpresa
    JOIN usuario ON usuario.fkEmpresa = empresa.idEmpresa
    LEFT JOIN sensor s ON s.fkEstufa = e.idEstufa
    LEFT JOIN dados d ON d.idDados = (
        SELECT idDados
        FROM dados
        WHERE dados.fkSensor = s.idSensor
        ORDER BY dados.idDados DESC
        LIMIT 1
    )
    JOIN parametro
    ON e.fkParametro = parametro.idParametro
    WHERE empresa.idEmpresa = ${idEmpresa}
    AND usuario.idUsuario=${idUsuario};`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar,
    cadastrarFuncionario,
    infoEstufas,
    infoEstufasAtencao,
    usuariosCadastrados,
    totalEmpresas,
    usuariosAtivos,
    estufasCadastradas,
    coletarTemperaturaUmidade,
    listarEstufas
};





