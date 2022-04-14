FROM ubuntu:18.04
ENV ARDUINO_CLI_VERSION 0.21.1
ENV ARDUINO_CLI_ARCH Linux_64bit
ENV ARDUINO_CLI_SHA256 068f0a69ffecd5688e0b4bc02609720af57ec1aa60e5ea6a2879af3ed1dc0d9b
ENV ARDUINO_CLI_URL https://github.com/arduino/arduino-cli/releases/download/${ARDUINO_CLI_VERSION}/arduino-cli_${ARDUINO_CLI_VERSION}_${ARDUINO_CLI_ARCH}.tar.gz
ENV ARDUINO_CLI_DIGISTUMP_INDEX https://raw.githubusercontent.com/ArminJo/DigistumpArduino/master/package_digistump_index.json 

# Temporary fix – see issue here: https://github.com/arduino/arduino-cli/issues/182
# by SConaway (https://github.com/SConaway)
ENV USER root

# copy file and makefile
WORKDIR /
COPY . /hid-rick-roller

RUN set -eux; \
  apt-get update; \
  apt-get install -y wget; \
  wget -O /arduino-cli.tar.gz "$ARDUINO_CLI_URL"; \
  echo "$ARDUINO_CLI_SHA256 */arduino-cli.tar.gz" | sha256sum -c -; \
  mkdir "/arduino-cli"; \
  tar --extract --file /arduino-cli.tar.gz --directory /arduino-cli; \
  rm /arduino-cli.tar.gz; \
  ln -s /arduino-cli/arduino-cli /usr/bin/arduino-cli; \
  arduino-cli version; \
  arduino-cli core update-index --additional-urls ${ARDUINO_CLI_DIGISTUMP_INDEX}; \
  arduino-cli core install digistump:avr --additional-urls ${ARDUINO_CLI_DIGISTUMP_INDEX}; \
  apt install -y make; \
  cd /hid-rick-roller; \
  make compile
