#!/usr/bin/env bash
dir="$HOME/.config/rofi"
theme='launcher'

case ${DESKTOP_SESSION} in
  "sway")
    monitor=$(swaymsg -t get_outputs --raw | jq '. | map(select(.focused == true)) | .[0].name' -r)
    rofi \
      -show drun \
      -m "$monitor" \
      -theme "${dir}"/${theme}.rasi
    ;;
  "i3" | "gnome-xorg" | "gnome")
    rofi \
      -show drun \
      -theme "${dir}"/${theme}.rasi
    ;;
esac
