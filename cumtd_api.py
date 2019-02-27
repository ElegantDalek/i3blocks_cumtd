import requests
import json
import pprint

pprint = pprint.PrettyPrinter(indent=4)

API_KEY = 'c1eeeac5edd34355915261140aacd965'
STOP_SEARCH_URL = 'https://developer.cumtd.com/api/v2.2/json/getstopsbysearch'

DEPARTURES_URL = 'https://developer.cumtd.com/api/v2.2/json/getdeparturesbystop'
params = {
    'key': API_KEY,
    'stop_id': 'GRGDNR'
}

re = requests.get(DEPARTURES_URL, params=params)

stops = re.json()

print(stops['status']['msg'])
#print(stops['departures'][0]['headsign'])
#print(stops['departures'][0]['expected_mins'], 'minutes')
print(type(stops['departures']))

for bus in stops['departures']:
    print(bus['headsign'], 'coming in', bus['expected_mins'], 'minutes')
