var mysql = require("mysql2");

// CONEXÃO DO BANCO MYSQL SERVER
var credenciaisAlfaFolium = {
    host: process.env.DB_HOST,
    database: process.env.DB_DATABASE,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT
};



// Função criada para executar um comando MySQL como se estivesse no query da Workbench
function executar(instrucao) {
    if (process.env.AMBIENTE_PROCESSO !== "producao" && process.env.AMBIENTE_PROCESSO !== "desenvolvimento") {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM .env OU dev.env OU app.js\n");
        return Promise.reject("AMBIENTE NÃO CONFIGURADO EM .env");
    }

    return new Promise(function (resolve, reject) {
        var conexaoMySQL = mysql.createConnection(credenciaisAlfaFolium); // Criada a conexão com o Banco e as suas credenciais
        conexaoMySQL.connect();
        conexaoMySQL.query(instrucao, function (erro, resultados) {
            conexaoMySQL.end();
            if (erro) {
                reject(erro);
            }
            console.log(resultados);
            resolve(resultados);
        });
        conexaoMySQL.on('error', function (erro) {
            return ("ERRO NO MySQL SERVER: ", erro.sqlMessage);
        });
    });
}

// Bloco criado para exportar a função executar(), podendo assim ser invocado com require por outros arquivos.
module.exports = {
    executar
};