#!/bin/bash
BATTERY_LEVEL=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
sketchybar --set $NAME label="Battery: $BATTERY_LEVEL%"
