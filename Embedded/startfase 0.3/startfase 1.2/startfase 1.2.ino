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

U8G2_SH1106_128X64_NONAME_F_HW_I2C u8g2(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);

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
  analogWrite(9, 70);
  u8g2.begin();
}


void loop() {
  u8g2.clearBuffer();
 u8g2.setFont(u8g2_font_ncenB08_tr);
  volume = teller / 15;
  Serial.println(volume);
    u8g2.setCursor(0,30);
    u8g2.print("waterverbruik:");
    u8g2.setCursor(0,40);
    u8g2.print(volume);
    u8g2.setCursor(0,50);
    u8g2.print("Liter");
    delay(350);
    u8g2.sendBuffer();
    
}



void flow_meter() {
  teller++;
}