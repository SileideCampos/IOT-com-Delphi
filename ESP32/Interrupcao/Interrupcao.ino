
#define touch 4
#define LED 2

int variav;

void IRAM_ATTR interrupcao_ativada(){  
  digitalWrite(LED, HIGH);
  variav = 1;
  delay(1000);
}

void setup() {
  Serial.begin(115200);
  pinMode(LED,OUTPUT); 
  pinMode(touch, INPUT);
  digitalWrite(LED, HIGH);
  delay(1000);
  
  attachInterrupt(digitalPinToInterrupt(touch), interrupcao_ativada, CHANGE);  
}

void loop() {
  digitalWrite(LED, LOW);   
  
  while (!digitalRead(touch)){
    Serial.println("Touch não tocado!");
  }
  
  if (variav == 1){
    variav = 0;
    Serial.println("Touch tocado!");
    delay(3000);
  }
}
