
#include "NRF52_Radio_library.h"
#include <Adafruit_Microbit.h>
Adafruit_Microbit microbit;
Adafruit_Microbit_Matrix matrix;  // alleen nodig voor het matrix display

NRF52_Radio MicrobitRadio = NRF52_Radio();

const int POWER = 7;            // (0..7)   Zendvermogen instellen voor Bluetooth radio (andere instelling lijkt geen verschil te maken).
const int GROEPCODE = 10;       // (0..255) Groepcode voor Bluetooth radio. Zorg dat alle deelnemende Microbits dezelfde (unieke) code gebruiken!
const int FREQUENTIEBAND = 50;  // (0..100) Frequentiegroep voor Bluetooth radio. Zorg dat alle deelnemende Microbits dezelfde (unieke) code gebruiken!

FrameBuffer* myDataSendData;  // Hier staat de data in (bij verzenden) of komt de data in (bij ontvangen).

void setup() {  // eenmalig bij het opstarten een aantal dingen instellen.
  Serial.begin(9600);
  Serial.println("nRF52 Radio Library wordt gestart.");
  matrix.begin();
  microbit.begin();
  // pinMode(PIN_BUTTON_A, INPUT);
  // pinMode(PIN_BUTTON_B, INPUT);

  myDataSendData = new FrameBuffer();
  MicrobitRadio.setTransmitPower(POWER);
  MicrobitRadio.hello("Test");
  MicrobitRadio.enable();  // Radio aanzetten
  MicrobitRadio.setGroup(GROEPCODE);
  MicrobitRadio.setFrequencyBand(FREQUENTIEBAND);
}

int ontvangen();
int ontvangen() {
  FrameBuffer* myData = MicrobitRadio.recv();

  String ontvangst = "";  // lege String aanmaken
  if (myData != NULL) {
    for (uint8_t i = 0; i < myData->length - 3; i++) {  // -3 want een lege framebuffer is 3 bytes groot
      ontvangst = String(ontvangst + (char)myData->payload[i]);
    }
    delete myData;
  }
int ontvangst1 = ontvangst.toInt();
return ontvangst1;
}

int vorigeontvangst; 

void loop() {  // het hoofdprogramma, dit blok wordt voordurend doorlopen.
  int ontvangst = ontvangen();  // elke lusdoorgang kijken of er data is ontvangen 
  // if (ontvangst > 0) {    // als er data is ontvangen, de data afdrukken
  //   Serial.println(ontvangst);
  // }
  if(ontvangst > vorigeontvangst) {
    Serial.println(ontvangst + 1);
  }  else {
  return;
  }

  vorigeontvangst = ontvangst;

  delay(500);
}
