
#include <WiFi.h>
#include <WiFiClient.h>
#include <WiFiAP.h>

#define led 2  

const char *ssid = "Sileide_ServerESP32";
const char *password = "yourPassword";

WiFiServer server(80);

void setup() {
  pinMode(led, OUTPUT);

  Serial.begin(115200);  
  Serial.println("Configuring access point...");
  
  WiFi.softAP(ssid, password);
  IPAddress myIP = WiFi.softAPIP();
  Serial.print("AP IP address: ");
  Serial.println(myIP);
  server.begin();

  Serial.println("Server started");
}

void loop() {
  WiFiClient client = server.available();   

  if (client) {                             
    Serial.println("New Client.");          
    String currentLine = "";                
    while (client.connected()) {            
      if (client.available()) {             
        char c = client.read();             
        Serial.write(c);                    
        if (c == '\n') {                    
          if (currentLine.length() == 0) {
            // HTTP headers always start with a response code (e.g. HTTP/1.1 200 OK)
            // and a content-type so the client knows what's coming, then a blank line:
            client.println("HTTP/1.1 200 OK");
            client.println("Content-type:text/html");
            client.println();

            // the content of the HTTP response follows the header:
            client.print("Click <a href=\"/H\">here</a> to turn ON the LED.<br>");
            client.print("Click <a href=\"/L\">here</a> to turn OFF the LED.<br>");

            // The HTTP response ends with another blank line:
            client.println();
            // break out of the while loop:
            break;
          } else {    
            currentLine = "";
          }
        } else if (c != '\r') {  // if you got anything else but a carriage return character,
          currentLine += c;      // add it to the end of the currentLine          
        }
        
        if (currentLine.endsWith("GET /H")) {
          digitalWrite(led, HIGH);               
        }
        if (currentLine.endsWith("GET /L")) {
          digitalWrite(led, LOW);                
        }
      }
    }    
    client.stop();
    Serial.println("Client Disconnected.");
  }
}
