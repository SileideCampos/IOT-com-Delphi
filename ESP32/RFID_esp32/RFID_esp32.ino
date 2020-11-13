#include <SPI.h>
#include <MFRC522.h>

 /*            MFRC522      ESP32
 * Signal      Pin          Pin
 * -------------------------------------------------------------------------------------------------------
 * RST/Reset   RST          22
 * SPI SS      SDA(SS)      21
 * SPI MOSI    MOSI         23
 * SPI MISO    MISO         19
 * SPI SCK     SCK          18
 */
 
#define SS_PIN 21
#define RST_PIN 22
MFRC522 mfrc522(SS_PIN, RST_PIN);  
 
void setup() {  
  Serial.begin(115200);
  SPI.begin();
  mfrc522.PCD_Init();  
  Serial.println("Aproxime o seu cartao do leitor...");
}
 
void loop() {  
  if ((!mfrc522.PICC_IsNewCardPresent()) or (!mfrc522.PICC_ReadCardSerial())){
    return;
  }
  String conteudo= "";
  
  for (byte i = 0; i < mfrc522.uid.size; i++) {    
    conteudo.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
    conteudo.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  if (conteudo.length() > 0) {
    Serial.println(conteudo);  
    if (conteudo == "39 c2 50 5a") {
      Serial.println("Cartao reconhecido!");
    }
    delay(1000);
  }
  
} 
