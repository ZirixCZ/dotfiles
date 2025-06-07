#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <workspace_index>"
  exit 1
fi

workspace_index=$1
workspace_id=$(($workspace_index + 1))

space_apps=$(yabai -m query --windows --space $workspace_id | jq -r '.[].app')

if [ -z "$space_apps" ]; then
  space_apps="Empty"
else
  space_apps=$(echo "$space_apps" | paste -sd ', ' -)
fi

if [ -z "$SELECTED" ]; then
  echo "Error: SELECTED must be set"
  exit 1
fi

if [ -z "$NAME" ]; then
  NAME="space.$workspace_id"
fi

if [ "$SELECTED" = "true" ]; then
  sketchybar -m --set "$NAME" icon.highlight=on background.drawing=on label="Space"
else
  sketchybar -m --set "$NAME" icon.highlight=off background.drawing=off label="Space"
fi
