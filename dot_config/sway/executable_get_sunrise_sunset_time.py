#!/usr/bin/python3
import datetime
from astral import LocationInfo
from astral.sun import sun

# Constants
LONGITUDE: float = 32.06167
LATITUDE: float = 118.77778
TIME_ZONE: str = "Asia/Taipei"

location = LocationInfo("UNKNOW", "UNKNOWN", TIME_ZONE, LONGITUDE, LATITUDE)
s = sun(
    location.observer,
    date=datetime.datetime.now(),
    tzinfo=TIME_ZONE,
)

# Format sunrise and sunset times as HH:MM
sunrise = s["sunrise"].strftime("%H:%M")
sunset = s["sunset"].strftime("%H:%M")

print(f"{sunrise} {sunset}")
