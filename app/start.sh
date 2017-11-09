#!/bin/bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Remove default audio
rmmod snd_bcm2835  >/dev/null 2>&1 || true

# Enable i2c and other interfaces
modprobe i2c-dev || true

# Configure assistant Client Credentials via ENV vars

sed -i -e "s/CLIENT_ID/$CLIENT_ID/g" assistant.json
sed -i -e "s/CLIENT_SECRET/$CLIENT_SECRET/g" assistant.json
sed -i -e "s/PROJECT_ID/$PROJECT_ID/g" assistant.json

# Start systemd services now that we have configured assistant Client Credentials
systemctl enable alsa-init.service
systemctl enable voice-recognizer.service
