#include <DHT_U.h>
#include <DHT.h>


#define dht_type DHT11

int dht_pin = A0;
DHT dht_1 = DHT(dht_pin, dht_type);

void setup() {
  Serial.begin(9600);
  dht_1.begin();
}

void loop() {
  float umidade = (dht_1.readHumidity()+10);
  float temperatura = (dht_1.readTemperature()-10);
  if(isnan(temperatura) or isnan(umidade)){
    Serial.println("Erro ao ler"); 
  } else {
    
    Serial.print(umidade);
    Serial.print(";");
    Serial.println(temperatura);













  
  }
  delay(2000);
}
