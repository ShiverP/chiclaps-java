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

  analogWrite(9, 60);
}


void loop() {
  
  volume = teller / 10;
  
  Serial.println(volume);
}

void flow_meter() {
  teller++;
}