ARDUINO_CLI=arduino-cli
BOARD=digistump:avr:digispark-tiny
PORT=
.PHONY: compile upload
compile:
	$(ARDUINO_CLI) compile -b $(BOARD) .
upload: compile
	$(ARDUINO_CLI) upload -b $(BOARD) .
