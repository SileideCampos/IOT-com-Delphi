
#define gas 15 //pino D15

void setup() {
  Serial.begin(115200);  
  pinMode(gas, INPUT);
}

void loop() {
  Serial.println(analogRead(gas));
  delay(1000);
}
