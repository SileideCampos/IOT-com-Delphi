#include <WiFi.h>
#include <HTTPClient.h>

#define touch 4
#define rele 2   //pino D2
 
const char* ssid  = "";
const char* senha = "";
String serverName = "http://54.245.48.255:8080/datasnap/rest/Ty/";
 
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
      
      http.begin(serverName+"Debito");
      http.addHeader("Content-Type", "application/json");
      //httpCode = http.PUT("{\"pedido\":\"Cerveja!\"}");            
      httpCode = http.POST("{\"nome\":\"Sileide\"}");
      if (httpCode > 0) {        
        String payload = http.getString();
        Serial.println(payload);        
      }
      
    }else if (touchRead(touch) > 80) {
      Serial.println(serverName+"pedirCerveja");      
      http.begin(serverName+"pedirCerveja(2)");      
      httpCode = http.GET();
      Serial.println(String(httpCode));
      if (httpCode > 0) {
        String retorno = http.getString();
        Serial.println(retorno);   

        digitalWrite(2, HIGH);
        delay(1000);
        digitalWrite(2, LOW);
        delay(1000);     
      }else{
        Serial.println("Error on HTTP request");
      }
    }
    http.end();
  }
  delay(1000);
}
