
char dado;
String dados="";
String recebido;

void setup() {  
  Serial.begin(115200);
  pinMode(2, OUTPUT);
}

void loop() {  
  
  recebido = Serial.readString();
  
  if (recebido.length()>0) {
    //Serial.println(recebido);
    if (recebido == "0"){
      digitalWrite(2, HIGH);
      delay(1000);
      digitalWrite(2, LOW);
      delay(1000);
    }else if (recebido == "1"){
      digitalWrite(2, HIGH);
      delay(500);
      digitalWrite(2, LOW);
      delay(500);
      digitalWrite(2, HIGH);
      delay(500);
      digitalWrite(2, LOW);
      delay(500);      
      Serial.write("pisca");
    }else if (recebido == "liga"){
      digitalWrite(2, HIGH);      
      Serial.print("ligado sajdhsahjbdsa sadnjksad");    
    }else if (recebido == "desliga"){
      digitalWrite(2, LOW);
        
      Serial.println("desligado");    
    }
    
  }
}

String lerSerial(){
  dados ="";
  dado=' ';
  while(Serial.available()>0){
    dado = (byte)Serial.read();
    dados += dado;
    dado = ' ';
    delay(1);    
  }  
  dados.trim();
  return dados;
}
