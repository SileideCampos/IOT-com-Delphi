#include <WiFi.h> 
#include <ArduinoOTA.h>
#include <ESPmDNS.h>
#include <WiFiUdp.h> 

#define LED 2 

const char* ssid = "";
const char* password = "";

void setup(){

  pinMode(LED, OUTPUT);  
  Serial.begin(115200);
  Serial.println("Iniciando.. ");
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  while (WiFi.waitForConnectResult() != WL_CONNECTED)  {    
    Serial.println("Connection Failed! Rebooting...");
    delay(5000);
    WiFi.begin(ssid, password);
  }

  // A porta fica default como 3232
  ArduinoOTA.setPort(3333);
 
  ArduinoOTA.setHostname("esp32_sileide");
  ArduinoOTA.setPassword("123");

  // É possível definir uma criptografia hash md5 para a senha usando a função "setPasswordHash"
  // Exemplo de MD5 para senha "admin" = 21232f297a57a5a743894a0e4a801fc3
  // ArduinoOTA.setPasswordHash("21232f297a57a5a743894a0e4a801fc3");

  //define o que será executado quando o ArduinoOTA iniciar
  ArduinoOTA.onStart( startOTA ); //startOTA é uma função criada para simplificar o código 

  //define o que será executado quando o ArduinoOTA terminar
  ArduinoOTA.onEnd( endOTA ); //endOTA é uma função criada para simplificar o código 

  //define o que será executado quando o ArduinoOTA estiver gravando
  ArduinoOTA.onProgress( progressOTA ); //progressOTA é uma função criada para simplificar o código 

  //define o que será executado quando o ArduinoOTA encontrar um erro
  ArduinoOTA.onError( errorOTA );//errorOTA é uma função criada para simplificar o código 
  
  //inicializa ArduinoOTA
  ArduinoOTA.begin();

  //exibe pronto e o ip utilizado pelo ESP
  Serial.println("Ready");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
  
  digitalWrite(LED, HIGH);
}

void startOTA() {
   String type;
   
   //caso a atualização esteja sendo gravada na memória flash externa, então informa "flash"
    if (ArduinoOTA.getCommand() == U_FLASH)
      type = "flash";
    else  //caso a atualização seja feita pela memória interna (file system), então informa "filesystem"
      type = "filesystem"; // U_SPIFFS

    //exibe mensagem junto ao tipo de gravação
    Serial.println("Start updating " + type);

    digitalWrite(LED,HIGH);
    delay(300);
    digitalWrite(LED,LOW);
    delay(300);
    digitalWrite(LED,HIGH);
    delay(300);
    digitalWrite(LED,LOW);
    delay(300);
}

void endOTA(){
  Serial.println("\nEnd");
}

void progressOTA(unsigned int progress, unsigned int total) {
   Serial.printf("Progress: %u%%\r", (progress / (total / 100))); 
}

void errorOTA(ota_error_t error) {  
      Serial.printf("Error[%u]: ", error);
      
      if (error == OTA_AUTH_ERROR) 
        Serial.println("Auth Failed");
      else if (error == OTA_BEGIN_ERROR)
        Serial.println("Begin Failed");
      else if (error == OTA_CONNECT_ERROR)
        Serial.println("Connect Failed");
      else if (error == OTA_RECEIVE_ERROR) 
        Serial.println("Receive Failed");
      else if (error == OTA_END_ERROR)
        Serial.println("End Failed");
}

void loop() {
  //Handle é descritor que referencia variáveis no bloco de memória
  //Ele é usado como um "guia" para que o ESP possa se comunicar com o computador pela rede
  ArduinoOTA.handle();

  /*digitalWrite(LED, HIGH);
  delay(500);
  digitalWrite(LED,LOW);
  delay(500);    

  digitalWrite(LED, HIGH);
  delay(1000);
  digitalWrite(LED,LOW);
  delay(1000);    

  digitalWrite(LED, HIGH);
  delay(1500);
  digitalWrite(LED,LOW);
  delay(1500);  */

 digitalWrite(2, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(200);                       // wait for a second
  digitalWrite(2, LOW);    // turn the LED off by making the voltage LOW
  delay(200);  
}
