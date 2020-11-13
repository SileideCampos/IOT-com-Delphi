
#define rele 23

void setup() {
  Serial.begin(115200);
  pinMode(rele, OUTPUT);
  Serial.println("Ativando o relé...");
}

void loop() {
  digitalWrite(rele, LOW);
  delay(1000);
  digitalWrite(rele, HIGH);
  delay(1000);
}
