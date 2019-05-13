#!/bin/bash

# Based on CUMTD api

# If you steal this key a ~spooky~ ghost will haunt you
# But yeah, I figured putting this somewhere else would be worth more cost than it's worth

API_KEY="c1eeeac5edd34355915261140aacd965"

CUMTD_URL="https://developer.cumtd.com/api/v2.2/json/getstops?key=${API_KEY}"

STOP_INFO=$(wget -qO- "${CUMTD_URL}")
# echo $STOP_INFO | jq '.stops[0].stop_name'
echo $STOP_INFO | jq '[.stops[] | {name: .stop_name, code: .code}]'
