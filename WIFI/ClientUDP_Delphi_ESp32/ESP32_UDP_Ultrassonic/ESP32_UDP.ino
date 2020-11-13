#include <WiFi.h>
#include <WiFiUdp.h>
#include <Ultrasonic.h>

#define echo 22
#define trigger 21
#define rele 15

const char* ssid = "STARK 2.4G";
const char* senha = "01550123";
unsigned int porta = 3333;
char pacote[10];

WiFiUDP conexao;
Ultrasonic ultrasonic(trigger, echo);

void setup() {
  pinMode(rele, OUTPUT);  
  Serial.begin(115200);

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, senha);
  while(WiFi.waitForConnectResult() != WL_CONNECTED){
    Serial.println("Conexao Falhou!");
    WiFi.begin(ssid, senha);
    delay(5000);  
  }
  Serial.println(WiFi.localIP());
  conexao.begin(porta);
}

void loop() {  
  float cmMsec;
  int tamanhoPacote = conexao.parsePacket();
  if (tamanhoPacote){
    conexao.read(pacote, sizeof(pacote));
    Serial.print("Tamanho do pacote recebido: ");
    Serial.println(tamanhoPacote);  
    Serial.print("Recebido: ");
    Serial.println(pacote);    
        
    if (strcmp("ligar", pacote) == 0){
      digitalWrite(rele, HIGH);
      Serial.println(" -> LED Desligado"); 
    }else if (strcmp("desligar", pacote) == 0 ){
      digitalWrite(rele, LOW);
      Serial.println(" -> LED Ligado");
    }else if (strcmp("TEMPE", pacote) == 0 ){
      long microsec = ultrasonic.timing();
      cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM);
            
      conexao.beginPacket(conexao.remoteIP(), conexao.remotePort());
      conexao.print(cmMsec);
      conexao.endPacket();
      
      Serial.print("Temperatura: ");
      Serial.println(cmMsec);      
    }
    memset(pacote, 0, sizeof(pacote));
  }
  conexao.flush();

  long microsec = ultrasonic.timing();
  cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM);
  Serial.print("Distancia em cm: ");
  Serial.println(cmMsec);
  delay(200);
}
