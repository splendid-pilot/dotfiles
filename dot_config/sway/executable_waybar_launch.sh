#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
# waybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q waybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/waybar1.log /tmp/waybar2.log
waybar 2>&1 | tee -a /tmp/waybar1.log &
disown

echo "Bars launched..."
