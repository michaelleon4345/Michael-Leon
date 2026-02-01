#define THINGER_SERIAL_DEBUG

#include <ThingerESP32.h>
#include "DHT.h"

// ===== Credenciales Thinger.io =====
#define USERNAME "michaelleon"
#define DEVICE_ID "Leon"
#define DEVICE_CREDENTIAL "123456"

// ===== WiFi =====
#define SSID "Red.L.P"
#define SSID_PASSWORD""
// ===== DHT =====
#define DHTPIN 23
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);
ThingerESP32 thing(USERNAME, DEVICE_ID, DEVICE_CREDENTIAL);

void setup() {
  Serial.begin(115200);

  // Conexión WiFi
  thing.add_wifi(SSID, SSID_PASSWORD);

  // Inicializar DHT
  dht.begin();

  // ===== Recurso en Thinger.io =====
 thing["Data"] >> [](pson &out){
  float temp = dht.readTemperature();
  float hum  = dht.readHumidity();

  Serial.print("Temperatura: ");
  Serial.print(temp);
  Serial.print(" °C | Humedad: ");
  Serial.print(hum);
  Serial.println(" %");

  if (isnan(temp) || isnan(hum)) {
    Serial.println(" Error leyendo DHT11");
    out["field1"] = 0;
    out["field2"] = 0;
    out["error"] = "DHT11 error";
  } else {
    out["field1"] = temp;
    out["field2"] = hum;
  }
};

}

void loop() {
  thing.handle();
}
