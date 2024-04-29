#include <Arduino.h>
#include <U8g2lib.h>

#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif

#include "NRF51_Radio_library.h"
#include <Adafruit_Microbit.h>

Adafruit_Microbit_Matrix matrix;  // alleen nodig voor het matrix display

NRF51_Radio MicrobitRadio = NRF51_Radio();

const int POWER = 7;            // (0..7)   Zendvermogen instellen voor Bluetooth radio (andere instelling lijkt geen verschil te maken).
const int GROEPCODE = 10;       // (0..255) Groepcode voor Bluetooth radio. Zorg dat alle deelnemende Microbits dezelfde (unieke) code gebruiken!
const int FREQUENTIEBAND = 50;  // (0..100) Frequentiegroep voor Bluetooth radio. Zorg dat alle deelnemende Microbits dezelfde (unieke) code gebruiken!

U8G2_SH1106_128X64_NONAME_F_HW_I2C u8g2(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);

// const int COL1 = 3;   // Column #1 control // pin 3  bij Microbit V1
// const int ROW1 = 26;  // 'row 1' led       // pin 26 bij Microbit V1

const byte ledPin = 13;
const byte interruptPin = 2;
volatile int teller = 0;
int volume = 0;

FrameBuffer* myDataSendData;

void setup() {
  matrix.begin();
  pinMode(ledPin, OUTPUT);
  pinMode(interruptPin, INPUT_PULLUP);
  myDataSendData = new FrameBuffer();
  attachInterrupt(digitalPinToInterrupt(interruptPin), flow_meter, RISING);
  Serial.begin(9600);
  Serial.println("De microbit is gereset!");
  MicrobitRadio.setTransmitPower(POWER);
  MicrobitRadio.hello("Test");
  MicrobitRadio.enable();  // Radio aanzetten
  MicrobitRadio.setGroup(GROEPCODE);
  MicrobitRadio.setFrequencyBand(FREQUENTIEBAND);

  // Omdat de LEDs in een matrix staan moet zowel de plus als de min aangestuurd worden.
  // De stroom loopt immers van + naar -
  //pinMode(COL1, OUTPUT);  // kolom is de -
  //pinMode(ROW1, OUTPUT);  // rij is de +
  //digitalWrite(COL1, LOW);

  analogWrite(9, 65);
  u8g2.begin();

}

void loop() {
  u8g2.clearBuffer();
  u8g2.setFont(u8g2_font_heisans_tr);
  volume = teller / 15;
  Serial.println(volume);
  
    u8g2.setCursor(0,30);
    u8g2.print("Waterverbruik:");
    u8g2.setCursor(0,40);
    u8g2.print(volume);
    u8g2.setCursor(0,50);
    u8g2.print("Liter");
    delay(500);
    u8g2.sendBuffer();
    noInterrupts();
    String volume2 = String(volume);
    verzenden(volume2);
    interrupts();
}

// void verzenden(String bericht) {
//   bericht = bericht.substring(0, 30);             // beperken tot maximale lengte van 29 bytes anders krijg je rommel
//   myDataSendData->length = bericht.length() + 3;  // +3 want een lege framebuffer is 3 bytes groot
//   myDataSendData->group = GROEPCODE;
//   myDataSendData->version = 12;
//   myDataSendData->protocol = 14;

//   for (uint8_t i = 0; i < bericht.length(); i++) {
//     myDataSendData->payload[i] = bericht.charAt(i);
//   }

void verzenden(String bericht) {
  bericht = bericht.substring(0, 30);             // beperken tot maximale lengte van 29 bytes anders krijg je rommel
  myDataSendData->length = bericht.length() + 3;  // +3 want een lege framebuffer is 3 bytes groot
  myDataSendData->group = GROEPCODE;
  myDataSendData->version = 12;
  myDataSendData->protocol = 14;

  for (uint8_t i = 0; i < bericht.length(); i++) {
    myDataSendData->payload[i] = bericht.charAt(i);
  }

  MicrobitRadio.send(myDataSendData);

}


void flow_meter() {
  teller++;
}