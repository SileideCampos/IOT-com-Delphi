#include <NTPClient.h>
#include <WiFi.h>
#include <WiFiUDP.h>

const char* ssid = "STARK 2.4G"; 
const char* password =  "01550123";     

WiFiUDP udp;
NTPClient ntp(udp, "a.st1.ntp.br", -3 * 3600, 60000); //Cria um objeto "NTP" com as configurações.utilizada no Brasil
struct tm data; //Cria a estrutura que contem as informacoes da data.
int hora;
char data_formatada[64];
int ATUALIZAR_DH;
String hora_ntp;

void setup()
{
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED)  {
    delay(5000);
    Serial.println("Conectando...");
  }
  Serial.println("Conectado");  

  ntp.begin();                
  ntp.forceUpdate();
}

String relogio_ntp(int retorno)
{
  if (retorno == 0 || ATUALIZAR_DH == 0)
  {
    Serial.print(" Atualizando data e hora...");
    hora = ntp.getEpochTime(); 
    Serial.print(" NTP Unix: ");
    Serial.println(hora);
    timeval tv;
    tv.tv_sec = hora;
    settimeofday(&tv, NULL);
    time_t tt = time(NULL);
    data = *gmtime(&tt);
    strftime(data_formatada, 64, "%d/%m/%Y %H:%M:%S", &data);
    Serial.print(" Data e hora atualizada:");
    Serial.println(data_formatada);
    ATUALIZAR_DH = 1;
  }

  if (retorno == 1)
  {
    time_t tt = time(NULL);
    data = *gmtime(&tt);
    strftime(data_formatada, 64, "%d/%m/%Y %H:%M:%S", &data);
    hora_ntp   = data_formatada;
  }
  return hora_ntp;

}

void loop()
{
  Serial.println(relogio_ntp(1));
  delay(1000);
}
