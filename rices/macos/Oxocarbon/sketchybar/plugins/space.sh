#!/usr/bin/env bash

if [ "$SELECTED" = "true" ]; then
	sketchybar -m --set $NAME icon.highlight=on background.drawing=on
else
	sketchybar -m --set $NAME icon.highlight=off background.drawing=off
fi
