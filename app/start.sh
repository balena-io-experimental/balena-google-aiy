#!/bin/bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Remove default audio
rmmod snd_bcm2835  >/dev/null 2>&1 || true

# Enable i2c and other interfaces
modprobe i2c-dev || true

# Configure assistant Client Credentials via ENV vars

sed -i -e "s/CLIENT_ID/$CLIENT_ID/g" /root/assistant.json
sed -i -e "s/CLIENT_SECRET/$CLIENT_SECRET/g" /root/assistant.json
sed -i -e "s/PROJECT_ID/$PROJECT_ID/g" /root/assistant.json

# Start app
python3 assistant_library_with_button_demo.py
