#!/bin/bash
# Based on CUMTD api

STOP_ID="GRGDNR"
API_KEY="c1eeeac5edd34355915261140aacd965"

CUMTD_URL="https://developer.cumtd.com/api/v2.2/json/getdeparturesbystop?key=${API_KEY}&STOP_ID=${STOP_ID}"

STOP_INFO=$(wget -qO- "${CUMTD_URL}")

DEPARTURES=$(echo "${STOP_INFO}" | grep -o -e '\"departures\":\[.\+\]' | cut -d ":" -f2-)
BUS_NUM=$(0)

NAME=$(echo "${DEPARTURES}" | jq '.[0] | .headsign' | tr -d '"')
MIN=$(echo "${DEPARTURES}" | jq '.[0] | .expected_mins')

echo "${NAME} ${MIN} min"
