/*
An example sketch for obsticle detection using the IR Compound Eye from Dago.
*/

// instantiate direction sensor pins
const int sensorTopPin = 1;
const int sensorLeftPin = 2;
const int sensorBottomPin = 3;
const int sensorRightPin = 4;

// instantiate the digital pin
const int irPin = 3;

// instantiate the led pin
const int ledPin = 13;

void setup() {
  // setup all the required pin modes
  pinMode(sensorTopPin, INPUT);
  pinMode(sensorLeftPin, INPUT);
  pinMode(sensorBottomPin, INPUT);
  pinMode(sensorRightPin, INPUT);
  pinMode(irPin, OUTPUT);
  pinMode(ledPin, OUTPUT);
  
  // setup the serial pin for debugging
  Serial.begin(9600);
  
  // swith the IR leds on
  digitalWrite(irPin, HIGH);
}

void loop() {
  // read all analog values
  int sensorTopVal = analogRead(sensorTopPin);
  int sensorLeftVal = analogRead(sensorLeftPin);
  int sensorBottomVal = analogRead(sensorBottomPin);
  int sensorRightVal = analogRead(sensorRightPin);
  int sensorAvg = (sensorTopVal + sensorLeftVal + sensorBottomVal + sensorRightVal) / 4;
  
  // outpu the values to the serial monitor
  Serial.print("Top: ");
  Serial.println(sensorTopVal);
  
  Serial.print("Left: ");
  Serial.println(sensorLeftVal);
  
  Serial.print("Bottom: ");
  Serial.println(sensorBottomVal);
  
  Serial.print("Right: ");
  Serial.println(sensorRightVal);
  
  Serial.println("-----------------------------");
  Serial.print("Average: ");
  Serial.println(sensorAvg);
  
  Serial.println("-----------------------------");
  Serial.println();
  
  if(sensorAvg > 300) {
    digitalWrite(ledPin, HIGH);
  }
  else {
    digitalWrite(ledPin, LOW);
  }
  
  delay(1000);
}
