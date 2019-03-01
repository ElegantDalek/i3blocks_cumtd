#!/bin/bash
# Based on CUMTD api

STOP_ID="GRGDNR"
API_KEY="c1eeeac5edd34355915261140aacd965"

CUMTD_URL="https://developer.cumtd.com/api/v2.2/json/getdeparturesbystop?key=${API_KEY}&STOP_ID=${STOP_ID}"

STOP_INFO=$(wget -qO- "${CUMTD_URL}")

DEPARTURES=$(echo "${STOP_INFO}" | grep -o -e '\"departures\":\[.\+\]' | cut -d ":" -f2-)

for row in $(echo "${DEPARTURES}" | jq -r '.[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }
echo "$(_jq '.headsign'): $(_jq '.expected_mins') min"
done


#WEATHER_MAIN=$(echo "${WEATHER_INFO}" | grep -o -e '\"main\":\"[a-Z]*\"' | awk -F ':' '{print $2}' | tr -d '"')

#if [[ "${WEATHER_MAIN}" = *Snow* ]]; then
  #echo "${ICON_SNOW} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo "${ICON_SNOW} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo ""
#elif [[ "${WEATHER_MAIN}" = *Rain* ]] || [[ "${WEATHER_MAIN}" = *Drizzle* ]]; then
  #echo "${ICON_RAINY} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo "${ICON_RAINY} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  ##echo ""
#elif [[ "${WEATHER_MAIN}" = *Thunderstorm* ]]; then
  #echo "${ICON_STORM} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo "${ICON_STORM} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"  
  #echo ""
#elif [[ "${WEATHER_MAIN}" = *Cloud* ]]; then
  #echo "${ICON_CLOUDY} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo "${ICON_CLOUDY} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo ""
#elif [[ "${WEATHER_MAIN}" = *Clear* ]]; then
  #echo "${ICON_SUNNY} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo "${ICON_SUNNY} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo ""
#elif [[ "${WEATHER_MAIN}" = *Fog* ]] || [[ "${WEATHER_MAIN}" = *Mist* ]]; then
  #echo "${ICON_FOG} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo "${ICON_FOG} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo ""
#else
  #echo "${WEATHER_MAIN} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo "${WEATHER_MAIN} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #echo ""
#fi
#
#if [[ "${WEATHER_TEMP}" -lt "${URGENT_LOWER}" ]] || [[ "${WEATHER_TEMP}" -gt "${URGENT_HIGHER}" ]]; then
  #exit 33
#fi
