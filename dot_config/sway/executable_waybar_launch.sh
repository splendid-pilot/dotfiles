#!/usr/bin/env bash

killall -q waybar

echo "---" | tee -a /tmp/waybar1.log /tmp/waybar2.log
waybar 2>&1 | tee -a /tmp/waybar1.log &
disown

echo "Bars launched..."
