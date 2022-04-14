ARDUINO_CLI=arduino-cli
BOARD=digistump:avr:digispark-tiny
.PHONY: compile upload docker-upload
compile:
	$(ARDUINO_CLI) compile -b $(BOARD) hid-rick-roller.ino
upload: compile
	$(ARDUINO_CLI) upload -b $(BOARD) hid-rick-roller.ino
docker-upload:
	docker run --privileged -v /dev/bus/usb:/dev/bus/usb $$(docker build -q .) bash -c "cd /hid-rick-roller && make upload"
