#!/bin/bash

# Define the paths to your config files
CONFIG_DIR="$XDG_CONFIG_HOME/gtk-3.0"
DARK_CONFIG="$CONFIG_DIR/settings-dark.ini"
LIGHT_CONFIG="$CONFIG_DIR/settings-light.ini"
CURRENT_CONFIG="$CONFIG_DIR/settings.ini"

# Check which theme is currently active and toggle
if [ "$(readlink -f "$CURRENT_CONFIG")" == "$DARK_CONFIG" ]; then
  ln -sf "$LIGHT_CONFIG" "$CURRENT_CONFIG"
  notify-send "GTK Theme Switcher" "Switched to light theme."
else
  ln -sf "$DARK_CONFIG" "$CURRENT_CONFIG"
  notify-send "GTK Theme Switcher" "Switched to dark theme."
fi
