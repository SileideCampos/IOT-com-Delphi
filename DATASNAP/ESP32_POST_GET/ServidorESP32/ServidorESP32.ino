#include <WiFi.h>
#include <HTTPClient.h>

#define touch 4
 
const char* ssid  = "STARK 2.4G";
const char* senha = "01550123";
String serverName = "http://192.168.0.102:8080/datasnap/rest/Ty/";
 
void setup() {   
  Serial.begin(115200);
  pinMode(touch, INPUT);
  pinMode(2, OUTPUT);
  WiFi.begin(ssid, senha); 
  while (WiFi.status() != WL_CONNECTED) {
    delay(5000);
    Serial.println("Conectando...");
    WiFi.begin(ssid, senha);
  } 
  Serial.println("Conectado!"); 
  Serial.println(WiFi.localIP());
}
 
void loop() {   
  if ((WiFi.status() == WL_CONNECTED)) {
    HTTPClient http;
    int httpCode;
    if (touchRead(touch) < 50) {
      digitalWrite(2, HIGH);
      
      http.begin("http://192.168.0.102:8080/datasnap/rest/Ty/Debito");
      
      http.addHeader("Content-Type", "application/json");
      
      //httpCode = http.PUT("{\"pedido\":\"Cerveja!\"}");
      httpCode = http.POST("{\"nome\":\"Sileide\"}");
      if (httpCode > 0) {
        String payload = http.getString();
        Serial.println(payload);
      }
      digitalWrite(2, LOW);
    }else if (touchRead(touch) > 80) {
      Serial.println(serverName+"pedirCerveja");      
      http.begin(serverName+"pedirCerveja(2)");      
      httpCode = http.GET();
      Serial.println(String(httpCode));
      if (httpCode > 0) {
        String retorno = http.getString();
        Serial.println(retorno);        
      }else{
        Serial.println("Error on HTTP request");
      }
    }
    http.end();
  }
  delay(1000);
}
