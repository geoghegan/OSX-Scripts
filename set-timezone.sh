#!/bin/bash

#
# If you're using the disable-wifi.sh script, it is likely you will also loose automatic timezone support.
# This script sets the timezone based on your computer's name, if you naming structure starts with an
# IATA airport code. e.g. DUB-Build-123 or SFO-Test-456
#

# Sets the timezone based on location
    # Extracts the first three chars from the Computer's name
SHORT_NAME="$(/usr/sbin/scutil --get ComputerName | /usr/bin/cut -c1-3)"

if [[ "$SHORT_NAME" == "DUB" ]]; then
	/usr/sbin/systemsetup -settimezone Europe/Dublin

    # NYC is a catchall airport code for JFK, EWR, LGA
elif [[ "$SHORT_NAME" == "NYC" ]]; then
       /usr/sbin/systemsetup -settimezone America/New_York

    # There is no America/San_Franciso, so we have to use Los Angeles
elif [[ "$SHORT_NAME" == "SFO" ]]; then
        /usr/sbin/systemsetup -settimezone America/Los_Angeles

elif [[ "$SHORT_NAME" == "ORD" ]]; then
        /usr/sbin/systemsetup -settimezone America/Chicago

    # There is no Australia/Sydney (seriously!), so have to use Brisbane
elif [[ "$SHORT_NAME" == "SYD" ]]; then
        /usr/sbin/systemsetup -settimezone Australia/Brisbane

else
    # If all else fails, default to the GMT timezone
        /usr/sbin/systemsetup -settimezone GMT
fi
