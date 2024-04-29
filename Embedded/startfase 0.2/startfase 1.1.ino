#include <Arduino.h>
#include <U8g2lib.h>

#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif

U8G2_SH1106_128X64_NONAME_F_HW_I2C u8g2(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);

const int COL1 = 3;   // Column #1 control // pin 3  bij Microbit V1
const int ROW1 = 26;  // 'row 1' led       // pin 26 bij Microbit V1

const byte ledPin = 13;
const byte interruptPin = 2;
volatile int teller = 0;
int volume = 0;

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(interruptPin, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(interruptPin), flow_meter, RISING);

  Serial.begin(9600);
  Serial.println("Microbit V2 is ready!");

  // Omdat de LEDs in een matrix staan moet zowel de plus als de min aangestuurd worden.
  // De stroom loopt immers van + naar -
  pinMode(COL1, OUTPUT);  // kolom is de -
  pinMode(ROW1, OUTPUT);  // rij is de +
  digitalWrite(COL1, LOW);

  analogWrite(9, 70);
  u8g2.begin();

}


void loop() {
  u8g2.clearBuffer();
 u8g2.setFont(u8g2_font_ncenB08_tr);
  volume = teller / 10;
  Serial.println(volume);
  
    u8g2.setCursor(0,30);
  u8g2.print("waterverbruik:");
    u8g2.setCursor(0,40);
    u8g2.print(volume);
    u8g2.setCursor(0,50);
    u8g2.print("Liter");
    u8g2.sendBuffer();
    
}



void flow_meter() {
  teller++;
}