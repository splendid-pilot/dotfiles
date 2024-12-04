#!/bin/bash
CURRENT_THEME=$(gsettings get org.gnome.desktop.interface color-scheme)
read -r SUNRISE_TIME SUNSET_TIME < <(/usr/bin/python3 "$XDG_CONFIG_HOME/sway/get_sunrise_sunset_time.py")
BAT_CONFIG="$XDG_CONFIG_HOME/bat/config"

KITTY_THEME_DARK="Tokyo Night"
KITTY_THEME_LIGHT="Tokyo Night Day"

BAT_THEME_DARK="Catppuccin Mocha"
BAT_THEME_LIGHT="Catppuccin Latte"

QT_THEME_DARK="catppuccin-mocha-blue"
QT_THEME_LIGHT="catppuccin-latte-blue"
QT_CONFIG="$XDG_CONFIG_HOME/Kvantum/kvantum.kvconfig"

ROFI_CONFIG="$XDG_CONFIG_HOME/rofi/shared/colors.rasi"
ROFI_THEME_DIR="$XDG_CONFIG_HOME/rofi/colors"
ROFI_THEME_LIGHT="$(find "$ROFI_THEME_DIR"/light -type f | shuf -n 1)"
ROFI_THEME_DARK="$(find "$ROFI_THEME_DIR"/dark -type f | shuf -n 1)"

WOFI_THEME_DIR="$XDG_CONFIG_HOME/wofi"
WOFI_THEME_LIGHT="$(find "$WOFI_THEME_DIR/light/" -type f | shuf -n 1)"
WOFI_THEME_DARK="$(find "$WOFI_THEME_DIR/dark/" -type f | shuf -n 1)"
get_current_theme() {
  gsettings get org.gnome.desktop.interface color-scheme
}
set_dark_theme() {
  CURRENT_THEME=$(get_current_theme)
  if [[ "$CURRENT_THEME" != "'default'" ]]; then
    return
  fi
  kitten themes "$KITTY_THEME_DARK"
  gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
  sed -i "s/^--theme=.*/--theme=\"$BAT_THEME_DARK\"/" "$BAT_CONFIG"
  sed -i "s/^theme=.*/theme=\"$QT_THEME_DARK\"/" "$QT_CONFIG"
  echo "@import \"$ROFI_THEME_DARK\"" >"$ROFI_CONFIG"
  ln -sf "$WOFI_THEME_DARK" "$WOFI_THEME_DIR/style.css"
  ln -sf "$XDG_CONFIG_HOME"/gtk-3.0/settings-dark.ini "$XDG_CONFIG_HOME"/gtk-3.0/settings.ini
  notify-send "Switched to Dark theme"
}

set_light_theme() {
  CURRENT_THEME=$(get_current_theme)
  if [[ "$CURRENT_THEME" == "'default'" ]]; then
    return
  fi
  kitten themes "$KITTY_THEME_LIGHT"
  gsettings set org.gnome.desktop.interface color-scheme "default"
  sed -i "s/^--theme=.*/--theme=\"$BAT_THEME_LIGHT\"/" "$BAT_CONFIG"
  sed -i "s/^theme=.*/theme=\"$QT_THEME_LIGHT\"/" "$QT_CONFIG"
  echo "@import \"$ROFI_THEME_LIGHT\"" >"$ROFI_CONFIG"
  ln -sf "$WOFI_THEME_LIGHT" "$WOFI_THEME_DIR/style.css"
  ln -sf "$XDG_CONFIG_HOME"/gtk-3.0/settings-light.ini "$XDG_CONFIG_HOME"/gtk-3.0/settings.ini
  notify-send "Switched to light theme"
}

toggle_theme() {
  CURRENT_THEME=$(get_current_theme)
  if [[ "$CURRENT_THEME" == "'default'" ]]; then
    set_dark_theme
  else
    set_light_theme
  fi
}

run_on_schedule() {
  while true; do
    CURRENT_TIME=$(date +'%H:%M')
    if [[ "$CURRENT_TIME" > "$SUNRISE_TIME" && "$CURRENT_TIME" < "$SUNSET_TIME" ]]; then
      echo "light"
      set_light_theme
    else
      echo "dark"
      set_dark_theme
    fi

    sleep 1800
  done
}

case "$1" in
  "schedule" | "--schedule")
    run_on_schedule
    ;;
  *)
    toggle_theme
    ;;
esac
