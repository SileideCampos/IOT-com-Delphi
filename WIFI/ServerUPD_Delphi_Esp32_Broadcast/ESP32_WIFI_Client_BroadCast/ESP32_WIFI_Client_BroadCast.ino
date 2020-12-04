#include <WiFi.h>
#include <WiFiUdp.h>

const char * networkName = "sua-rede-wifi";
const char * networkPswd = "sua-senha";

const char * udpAddress = "192.168.0.255";  //envio broadcast
const int udpPort = 3333;

WiFiUDP udp;

void setup() {
  Serial.begin(115200);
  WiFi.begin(networkName, networkPswd);
  while(WiFi.waitForConnectResult() != WL_CONNECTED){
    Serial.println("Conexao Falhou!");
    WiFi.begin(networkName, networkPswd);
    delay(5000);  
  }
  udp.begin(WiFi.localIP(), udpPort);
  Serial.println(WiFi.localIP());
}

void loop() {
  udp.beginPacket(udpAddress,udpPort);
  udp.printf("Seconds since boot: %lu", millis()/1000);
  udp.endPacket();  
  Serial.println();
  delay(1000);
}
