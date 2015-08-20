#!/bin/bash
# Disable WiFi
    # Get current WiFi device
CURRENT_DEVICE=$(/usr/sbin/networksetup -listallhardwareports | /usr/bin/awk '$3=="Wi-Fi" {getline; print $2}')
    # Turn off WiFi
/usr/sbin/networksetup -setairportpower $CURRENT_DEVICE off
