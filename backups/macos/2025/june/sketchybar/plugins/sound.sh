#!/bin/bash
VOLUME=$(osascript -e "output volume of (get volume settings)")
sketchybar --set $NAME label="Sound: $VOLUME%"
