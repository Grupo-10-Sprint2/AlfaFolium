var database = require("../database/config");

function cadastrar(tamanhoEstufa, statusEstufa, idEmpresa, TempMaxima, TempMinima, UmidMaxima, UmidMinima) {
    var instrucaoSql = `
    INSERT INTO parametro (umidadeMin, umidadeMax, temperaturaMin, temperaturaMax) 
    VALUES (${UmidMinima}, ${UmidMaxima}, ${TempMinima}, ${TempMaxima});
`;

    return database.executar(instrucaoSql)
        .then(result => {
            var idParametro = result.insertId;
            var instrucaoSql = `
            INSERT INTO estufa (tamanho, status, fkEmpresa, fkParametro) 
            VALUES (${tamanhoEstufa}, '${statusEstufa}', ${idEmpresa}, ${idParametro});
        `;
            return database.executar(instrucaoSql);
        });

}


module.exports = {
    cadastrar
}