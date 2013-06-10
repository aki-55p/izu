const int LED = 13;

int val = 0;
byte inByte = 0;

void setup () {
  Serial.begin (9600);
  pinMode (LED, OUTPUT);
}

void loop () {
  inByte = Serial.read();
  
  if (inByte == 1) {
    digitalWrite (LED, HIGH);
    delay (10);
    digitalWrite (LED, LOW);
    delay (10);
  } else {
    digitalWrite (LED, LOW);
  }
}
  
