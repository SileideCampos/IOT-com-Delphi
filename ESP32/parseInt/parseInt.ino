#include <BluetoothSerial.h>
#include <Wire.h>

const int ledPin = 2;
BluetoothSerial SerialBT;

void setup() {  
  Serial.begin(115200); 
  SerialBT.begin("ESP32_curso");
  pinMode (ledPin, OUTPUT);
}

void loop() {
  int dado;
  while (SerialBT.available() > 0){
    dado = SerialBT.parseInt();
    Serial.println(dado);
    if (dado == 1) {
      digitalWrite (ledPin, HIGH);  
      SerialBT.print(String("28qwertyuiopasdfghjklzxcvbnm,qwertyuioasdfghjklzxcv*bnm1234567890zxcvbnmasdfghjklqwertyuiopSileide"));
    }else if (dado == 0) {
      digitalWrite (ledPin, LOW);
      SerialBT.print(String("curso"));
    }
  }
}
