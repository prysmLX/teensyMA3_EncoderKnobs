/* 

MA3 Rotary Encoder Plugin // PrysmLX
---- teensy 4.1 + 4 x rotary encoders ----
-- needed plugins: Bounce2 + Encoder --


 */

#include <Encoder.h>
#include <Bounce.h>

const int channel = 1;

// Change these pin numbers to the pins connected to your encoder.
//   Best Performance: both pins have interrupt capability
//   Good Performance: only the first pin has interrupt capability
//   Low Performance:  neither pin has interrupt capability
Encoder knobOne(4, 3); // oldLeft
Encoder knobTwo(6, 5); // oldRight
Encoder knobThree(8, 7);
Encoder knobFour(10, 9);
// renumber these and figure out how to add SW push
//   avoid using pins with LEDs attached

void setup() {
  //Serial.begin(9600);
 // Serial.println("TwoKnobs Encoder Test:");
}

long positionOne  = -999;
long positionTwo = -999;
long positionThree = -999;
long positionFour = -999;

void loop() {
  long newOne, newTwo, newThree, newFour;
  newOne = knobOne.read();
  newTwo = knobTwo.read();
  newThree = knobThree.read();
  newFour = knobFour.read();
 if (newOne != positionOne || newTwo != positionTwo || newThree != positionThree || newFour != positionFour) {

    positionOne = newOne;
    positionTwo = newTwo;
    positionThree = newThree;
    positionFour = newFour;
    usbMIDI.sendNoteOn(1, positionOne, 1);
    usbMIDI.sendNoteOn(2, positionTwo, 2);
    usbMIDI.sendNoteOn(3, positionThree, 3);
    usbMIDI.sendNoteOn(4, positionFour, 4);

  }

    knobOne.write(0);
    knobTwo.write(0);
    knobThree.write(0);
    knobFour.write(0);
  }

