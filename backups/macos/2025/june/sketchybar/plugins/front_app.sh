#!/bin/bash
sketchybar --set $NAME label="$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true')"
