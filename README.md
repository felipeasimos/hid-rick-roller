# HID Rick Roller

The idea is simple: insert the digispark's digistump microntroller in
a usb port of a linux machine with an open focused terminal and let the magic
happen.

When your victim comes back to their computer, what will follow is a series
of grunts and confused expressions from your victim when a new browser window
with a rick rolling video is randomly opened from time to time.

## Requirements

* A friend that uses a terminal
* A digispark's digistump-tiny microcontroller
* arduino-cli with digistump avr core (https://github.com/ArminJo/DigistumpArduino)

## How to build

```
make upload
```

This should compile and wait 60 seconds for the chip to be inserted into a port.
After the upload is done, take off the chip before it starts executing and you end
up rick rolling yourself (execution should start after a 3 second wait).

![Digistump-tiny board over a blue surface](./digistump.jpeg)
