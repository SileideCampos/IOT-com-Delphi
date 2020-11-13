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
  String dado;
  while (SerialBT.available() > 0){
    dado = SerialBT.readString();
    Serial.println(dado);
    if (dado == "1") {
      digitalWrite (ledPin, HIGH);  
    }else if (dado == "0") {
      digitalWrite (ledPin, LOW);
    }
  }
}
