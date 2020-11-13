#include "DHTesp.h"

#define DHTpin 23

DHTesp dht;

void setup()
{
  Serial.begin(115200);  
  dht.setup(DHTpin, DHTesp::DHT11); 
}

void loop()
{
  float H = dht.getHumidity();
  float T = dht.getTemperature();
  Serial.print("1: ");
  Serial.println(H, 1);
  Serial.print("2: ");
  Serial.println(T, 1);
  delay(2000);
}
