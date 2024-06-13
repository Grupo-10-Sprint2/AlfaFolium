// não altere!
const serialport = require('serialport');
const express = require('express');
const mysql = require('mysql2');

// não altere!
const SERIAL_BAUD_RATE = 9600;
const SERVIDOR_PORTA = 3300;

// configure a linha abaixo caso queira que os dados capturados sejam inseridos no banco de dados.
// false -> nao insere
// true -> insere
const HABILITAR_OPERACAO_INSERIR = true;

const serial = async (
    valoresDht11Umidade,
    valoresDht11Temperatura
) => {
    let poolBancoDados = ''

    poolBancoDados = mysql.createPool(
        {
            // altere!
            // CREDENCIAIS DO BANCO - MYSQL WORKBENCH
            host: 'localhost',
            user: 'root',
            password: 'vidanova123',
            database: 'AlfaFolium',
            port: '3306'
        }
    ).promise();

    const portas = await serialport.SerialPort.list();
    const portaArduino = portas.find((porta) => porta.vendorId == 2341 && porta.productId == 43);
    if (!portaArduino) {
        throw new Error('O arduino não foi encontrado em nenhuma porta serial');
    }
    const arduino = new serialport.SerialPort(
        {
            path: portaArduino.path,
            baudRate: SERIAL_BAUD_RATE
        }
    );
    arduino.on('open', () => {
        console.log(`A leitura do arduino foi iniciada na porta ${portaArduino.path} utilizando Baud Rate de ${SERIAL_BAUD_RATE}`);
    });
    arduino.pipe(new serialport.ReadlineParser({ delimiter: '\r\n' })).on('data', async (data) => {
        //console.log(data);
        const valores = data.split(';');
        const dht11Umidade = parseFloat(valores[0]);
        const dht11Temperatura = parseFloat(valores[1]);
        
        valoresDht11Umidade.push(dht11Umidade);
        valoresDht11Temperatura.push(dht11Temperatura);
        

        if (HABILITAR_OPERACAO_INSERIR) {

            // altere!
            // Este insert irá inserir os dados na tabela "medida"
            // -> altere nome da tabela e colunas se necessário
            // Este insert irá inserir dados de fk_aquario id=1 (fixo no comando do insert abaixo)
            // >> você deve ter o aquario de id 1 cadastrado.
            await poolBancoDados.execute(
                'INSERT INTO dados (umidade, temperatura, horario, fkSensor) VALUES (?, ?, now(), 1)',
                [dht11Umidade, dht11Temperatura]
            );
            console.log("valores inseridos no banco: ", dht11Umidade + ", " + dht11Temperatura)

        }
    });
    arduino.on('error', (mensagem) => {
        console.error(`Erro no arduino (Mensagem: ${mensagem}`)
    });
}


// não altere!
const servidor = (
    valoresDht11Umidade,
    valoresDht11Temperatura,
) => {
    const app = express();
    app.use((request, response, next) => {
        response.header('Access-Control-Allow-Origin', '*');
        response.header('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept');
        next();
    });
    app.listen(SERVIDOR_PORTA, () => {
        console.log(`API executada com sucesso na porta ${SERVIDOR_PORTA}`);
    });
    app.get('/sensores/dht11/umidade', (_, response) => {
        return response.json(valoresDht11Umidade);
    });
    app.get('/sensores/dht11/temperatura', (_, response) => {
        return response.json(valoresDht11Temperatura);
    });
}

(async () => {
    const valoresDht11Umidade = [];
    const valoresDht11Temperatura = [];
    await serial(
        valoresDht11Umidade,
        valoresDht11Temperatura
    );
    servidor(
        valoresDht11Umidade,
        valoresDht11Temperatura
    );
})();
