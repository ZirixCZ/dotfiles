#!/bin/bash
SSID=$(networksetup -getairportnetwork en0 | sed 's/^.*: //')
sketchybar --set $NAME label="Internet Connected"
