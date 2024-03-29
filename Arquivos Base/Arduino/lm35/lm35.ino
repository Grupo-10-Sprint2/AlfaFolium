int pinoSensor = 5; // Saída do sensor na A5
int valorLido; //Variável auxiliar
float temperatura = 0; //Variável que armazenará a temperatura lida
int linha = 0; //Variável que se refere as linhas

  void setup() { // Função que será executada
    Serial.begin(9600); //Inicia a comunicação serial a 9600 bauds
    }

  void loop(){ //Função que será executada continuamente
    valorLido = analogRead(pinoSensor); //Leitura analógica da porta A5
    temperatura = (valorLido * 0.00488); // 5 volts / 1023 = 0,0048 precisão de A/D
    temperatura = temperatura * 100 - 9; // converte milivolts para celcius - cada 10mV == 1 grau C
    linha++; // Incrementa linha para que a leitura pule linha
    Serial.println(temperatura);

    if(linha > 100)
    {
      linha = 0;
      }
      delay(1000);
     }
