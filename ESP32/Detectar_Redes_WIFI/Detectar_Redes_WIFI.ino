
#include <SPI.h>
#include <WiFi.h>

void setup() {
  
  Serial.begin(115200);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  printMacAddress();
}

void loop() {
  Serial.println("Scanning available networks...");
  listNetworks();
  delay(10000);
}

void printMacAddress() { 
  byte mac[6];
  
  WiFi.macAddress(mac);
  Serial.print("MAC: ");
  Serial.print(mac[5], HEX);
  Serial.print(":");
  Serial.print(mac[4], HEX);
  Serial.print(":");
  Serial.print(mac[3], HEX);
  Serial.print(":");
  Serial.print(mac[2], HEX);
  Serial.print(":");
  Serial.print(mac[1], HEX);
  Serial.print(":");
  Serial.println(mac[0], HEX);
}

void listNetworks() {
  
  Serial.println("Lista de redes: **");
  int numSsid = WiFi.scanNetworks();
  if (numSsid == -1) {
    Serial.println("Não conseguiu detectar redes disponíveis.. ");
    return; //while (true);
  }

  Serial.print("Número de redes detectadas:");
  Serial.println(numSsid);
  
  for (int thisNet = 0; thisNet < numSsid; thisNet++) {
    Serial.print(thisNet);
    Serial.print(") ");
    Serial.print(WiFi.SSID(thisNet));
    Serial.print("\tSignal: ");
    Serial.print(WiFi.RSSI(thisNet));
    Serial.print(" dBm");
    Serial.print("\tEncryption: ");
    Serial.println("");   
  }
  Serial.println("");
}
